/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-14
 */
package com.beautifulchina.controller.trip;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.city.CityVO;
import com.beautifulchina.constants.CreateTripError;
import com.beautifulchina.customline.vo.CustomlineVO;
import com.beautifulchina.destinationday.vo.DestinationDayVO;
import com.beautifulchina.service.city.CityService;
import com.beautifulchina.service.customline.CustomlineService;
import com.beautifulchina.service.destinationday.DestinationDayService;
import com.beautifulchina.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 自定义线路页面控制器
 */
@Controller
@RequestMapping(value = "createtrip")
public class CreateTripController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(BaseController.class);

    @Autowired
    private CityService cityService;

    /**
     * 自定义线路页面
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model) {
        //加载界面时进行国际化判断
        String language = getLocal(request);
        List<CityVO> cityVOList = cityService.getAllcity(language);
        model.addAttribute("cityList", cityVOList);
        return "/trip/createtrip";
    }


    @Autowired
    private DestinationDayService destinationDayService;

    @Autowired
    private CustomlineService customlineService;
    /**
     * 旅游路线相关信息插入
     *
     * @param customlineVO
     * @return
     */
    @RequestMapping(value = "insertCustomline", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insert(@RequestBody CustomlineVO customlineVO,HttpSession session,HttpServletRequest request) {
        Map<String, Object> result = null;
        String language = getLocal(request);
        //验证验证码
        if (!(customlineVO.getCode().equalsIgnoreCase(session.getAttribute("code").toString()))) {
            result = failResult(CreateTripError.CODEFAILURE);
        }else {
            //旅游天数和城市
            DestinationDayVO destinationDayVO = new DestinationDayVO();
            destinationDayVO.setCitylist(customlineVO.getCitylist());
            destinationDayVO.setDay(customlineVO.getDay());
            destinationDayVO.setNameEN(customlineVO.getNameEN());
            //创建时间
            String createTime = DateUtil.getCurrentDate();
            customlineVO.setCreateTime(createTime);
            destinationDayVO.setCreateTime(createTime);
            try {
                customlineService.insertCustomline(customlineVO);
                int id = customlineVO.getId();
                //旅游城市插入数据库
                List<String> list = customlineVO.getCitylist();
                for (int i = 0; i < list.size(); i++) {
                    destinationDayVO.setCstId(id);
                    destinationDayVO.setNameEN(list.get(i));
                    destinationDayService.insertDestinationDay(destinationDayVO,language);
                }
                result = successResult(CreateTripError.SUCCESS);
            } catch (Exception e) {
                logger.error("系统错误", e);
                result = failResult(CreateTripError.FAILURE);
            }
        }
        return result;
    }

}
