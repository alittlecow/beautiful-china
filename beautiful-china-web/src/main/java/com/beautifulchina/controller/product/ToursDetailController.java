/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016/1/18.
 */
package com.beautifulchina.controller.product;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.option.bo.OptionBO;
import com.beautifulchina.page.Page;
import com.beautifulchina.constants.ToursdetailErrorCode;
import com.beautifulchina.page.Page;
import com.beautifulchina.questions.bo.QuestionBO;
import com.beautifulchina.questions.vo.QuestionVO;
import com.beautifulchina.service.option.OptionService;
import com.beautifulchina.service.question.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import com.beautifulchina.product.bo.ToursBookingBO;
import com.beautifulchina.product.bo.ToursConfigBO;
import com.beautifulchina.product.bo.ToursDetailBO;
import com.beautifulchina.product.bo.ToursImageBO;
import com.beautifulchina.review.Review;
import com.beautifulchina.service.review.ReviewService;
import com.beautifulchina.service.toursdetail.ToursBookingService;
import com.beautifulchina.service.toursdetail.ToursConfigService;
import com.beautifulchina.service.toursdetail.ToursDetailService;
import com.beautifulchina.service.toursdetail.ToursImageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 线路明细页面控制器
 */
@Controller
@RequestMapping(value = "toursdetail")
public class ToursDetailController extends BaseController {

    @Autowired
    private QuestionService questionService;

    private static Logger logger = LoggerFactory.getLogger(ToursDetailController.class);

    @Autowired
    private ToursImageService toursImageService;

    @Autowired
    private ToursDetailService toursDetailService;

    @Autowired
    private ToursConfigService toursConfigService;

    @Autowired
    private ToursBookingService toursBookingService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private OptionService optionService;

    /**
     * 无参数返回主页面
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "redirect:/";
    }

    /**
     * 根据id获取线路图片
     * 获取option选项
     * 将路径参数提取为tourId值
     *
     * @param tourId
     * @return
     */
    @RequestMapping(value = "{tourId}", method = RequestMethod.GET)
    public String selectTourImageById(@PathVariable String tourId, Model model, HttpServletRequest request) {
        String language = this.getLocal(request);
        Map map = new HashMap();
        map.put("language", language);
        map.put("tourId", tourId);
        //查找所有的option
        List<OptionBO> optionBOList = optionService.getAllOption(map);
        //将option分类
        List<List<OptionBO>> opList = new ArrayList<List<OptionBO>>();
        //记录option条数
        int count = 0;
        for (int i = 0; i < optionBOList.size(); i++) {
            if (i == 0) {
                List<OptionBO> optionBOList1 = new ArrayList<OptionBO>();
                optionBOList1.add(optionBOList.get(i));
                opList.add(optionBOList1);
            }
            else {
                //和上一次的option相同，直接添加
                if (optionBOList.get(i).getOptionName().equals(optionBOList.get(i - 1).getOptionName())) {
                    opList.get(count).add(optionBOList.get(i));
                }
                //和上一次的option不同,则添加到新的list中
                else{
                    count++;
                    List<OptionBO> optionBOList1 = new ArrayList<OptionBO>();
                    optionBOList1.add(optionBOList.get(i));
                    opList.add(optionBOList1);
                }
            }
        }
        try {
            int id = Integer.parseInt(tourId);
            List<ToursImageBO> toursImageBOList = toursImageService.selectTourImageById(id);
            //线路存在则查看线路详情
            if (toursImageBOList.size() > 0) {
                model.addAttribute("toursImageBOList", toursImageBOList);
                model.addAttribute("tourId", tourId);
                //线路增值服务
                if(opList != null){
                    model.addAttribute("opList", opList);
               }

                if("true".equals(request.getParameter("isPrint"))){
                    return "/product/toursDetailPrint";
                }
                return "/product/toursdetail";
            }
        } catch (NumberFormatException e) {
            return "redirect:/";
        }
        //线路不存在则返回主页面
        return "redirect:/";
    }

    /**
     * 全部问题分页查询
     *
     * @param pageNumber
     * @param tourId
     * @return
     */
    @RequestMapping(value = "getQuestionByPage")
    @ResponseBody
    public Map<String, Object> getQuestionByPage(Integer pageNumber, String tourId) {
        Page page = null;
        Map<String, Object> result = null;
        try {
            int size = questionService.getAllQuestions(tourId);
            List<QuestionBO> eachList = null;
            //从上数据库查询界面需要的数据
            if (pageNumber != 0) {
                page = new Page(size, pageNumber, Integer.parseInt(tourId));
                eachList = questionService.getQuestionsByPage(page);
                for (QuestionBO questionBO : eachList) {
                    questionBO.setAnswerList(questionService.getAnswerById(questionBO.getId()));
                }
            } else {
                page = new Page(size, 1, Integer.parseInt(tourId));
                eachList = questionService.getQuestionsByPage(page);
                for (QuestionBO questionBO : eachList) {
                    questionBO.setAnswerList(questionService.getAnswerById(questionBO.getId()));
                }
            }
            //数据传到前台
            List questionList = new ArrayList();
            questionList.add(eachList);
            questionList.add(page);
            result = successDataResult(questionList);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 评论条数
     *
     * @param request
     * @param model
     */
    @RequestMapping(value = "getAllReviewCount")
    @ResponseBody
    public Map<String, Object> review(String tourId, HttpServletRequest request, Model model) {
        Map<String, Object> result = null;
        try {
            //评论总条数
            int size = reviewService.getReview(tourId);
            //好评条数
            int goodReviewCount = reviewService.getReviewCount(tourId, 1);
            //中评条数
            int midReviewCount = reviewService.getReviewCount(tourId, 2);
            //差评条数
            int badReviewCount = reviewService.getReviewCount(tourId, 3);
            //将条数数据传到前台
            List list = new ArrayList();
            list.add(size);
            list.add(goodReviewCount);
            list.add(midReviewCount);
            list.add(badReviewCount);
            result = successDataResult(list);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 全部评论分页查询
     *
     * @param pageNumber
     * @param tourId
     * @return
     */
    @RequestMapping(value = "getReviewByPage")
    @ResponseBody
    public Map<String, Object> getReviewByPage(Integer pageNumber, String tourId) {
        Page page = null;
        Map<String, Object> result = null;
        //评论总条数
        try {
            int size = reviewService.getReview(tourId);
            List<Review> reviewlist = new ArrayList<Review>();
            //从上数据库查询界面需要的数据
            if (pageNumber != 0) {
                page = new Page(size, pageNumber, Integer.parseInt(tourId));
                reviewlist = reviewService.getReviewByPage(page);
            } else {
                page = new Page(size, 1, Integer.parseInt(tourId));
                reviewlist = reviewService.getReviewByPage(page);
            }
            //数据传到前台
            List list = new ArrayList();
            list.add(reviewlist);
            list.add(page);
            result = successDataResult(list);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 好评论分页查询
     *
     * @param pageNumber
     * @param tourId
     * @return
     */
    @RequestMapping(value = "getGoodReviewByPage")
    @ResponseBody
    public Map<String, Object> getGoodReviewByPage(Integer pageNumber, String tourId) {
        Page page = null;
        Map<String, Object> result = null;
        //评论总条数
        try {
            int size = reviewService.getReviewCount(tourId, 1);
            List<Review> reviewlist = new ArrayList<Review>();
            //从上数据库查询界面需要的数据
            if (pageNumber != 0) {
                page = new Page(size, pageNumber, Integer.parseInt(tourId));
                page.setAllLevel(1);
                reviewlist = reviewService.getGoodReviewByPage(page);
            } else {
                page = new Page(size, 1, Integer.parseInt(tourId));
                page.setAllLevel(1);
                reviewlist = reviewService.getGoodReviewByPage(page);
            }
            //数据传到前台
            List list = new ArrayList();
            list.add(reviewlist);
            list.add(page);
            result = successDataResult(list);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 中等评论分页查询
     *
     * @param pageNumber
     * @param tourId
     * @return
     */
    @RequestMapping(value = "getMidReviewByPage")
    @ResponseBody
    public Map<String, Object> getMidReviewByPage(Integer pageNumber, String tourId) {
        Page page = null;
        Map<String, Object> result = null;

        //评论总条数
        try {
            int size = reviewService.getReviewCount(tourId, 2);
            List<Review> reviewlist = new ArrayList<Review>();
            //从上数据库查询界面需要的数据
            if (pageNumber != 0) {
                page = new Page(size, pageNumber, Integer.parseInt(tourId));
                page.setAllLevel(2);
                reviewlist = reviewService.getGoodReviewByPage(page);
            } else {
                page = new Page(size, 1, Integer.parseInt(tourId));
                page.setAllLevel(2);
                reviewlist = reviewService.getGoodReviewByPage(page);
            }
            //数据传到前台
            List list = new ArrayList();
            list.add(reviewlist);
            list.add(page);
            result = successDataResult(list);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 差评论分页查询
     *
     * @param pageNumber
     * @param tourId
     * @return
     */
    @RequestMapping(value = "getBadReviewByPage")
    @ResponseBody
    public Map<String, Object> getBadReviewByPage(Integer pageNumber, String tourId) {
        Page page = null;
        Map<String, Object> result = null;
        try {
            //评论总条数
            int size = reviewService.getReviewCount(tourId, 3);
            List<Review> reviewlist = new ArrayList<Review>();
            //从上数据库查询界面需要的数据
            if (pageNumber != 0) {
                page = new Page(size, pageNumber, Integer.parseInt(tourId));
                page.setAllLevel(3);
                reviewlist = reviewService.getGoodReviewByPage(page);
            } else {
                page = new Page(size, 1, Integer.parseInt(tourId));
                page.setAllLevel(3);
                reviewlist = reviewService.getGoodReviewByPage(page);
            }
            //数据传到前台
            List list = new ArrayList();
            list.add(reviewlist);
            list.add(page);
            result = successDataResult(list);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 获取线路明细
     *
     * @param tourId
     * @param request
     * @return
     */
    @RequestMapping(value = "SelectToursDetail")
    @ResponseBody
    public Map<String, Object> SelectToursDetail(int tourId, HttpServletRequest request) {

        //获取当地请求语言类型
        RequestContext requestContext = new RequestContext(request);
        Locale locale = requestContext.getLocale();
        String language = locale.getLanguage();
        //查询线路明细
        List<ToursDetailBO> toursDetailBOList = toursDetailService.selectByTourCode(tourId, language);
        //调用BaseController中的方法 封装json对象
        Map<String, Object> result = successDataResult(toursDetailBOList);
        //返回线路明细
        return result;
    }


    /**
     * 获取线路配置
     *
     * @param tourId
     * @param request
     * @return
     */
    @RequestMapping(value = "selectTourConfigById")
    @ResponseBody
    public Map<String, Object> selectTourConfigById(int tourId, HttpServletRequest request) {
        //获取当地请求语言类型
        RequestContext requestContext = new RequestContext(request);
        Locale locale = requestContext.getLocale();
        String language = locale.getLanguage();
        //查询线路配置
        List<ToursConfigBO> toursConfigBOList = toursConfigService.selectTourConfigById(tourId, language);
        //调用BaseController中的方法 封装json对象
        Map<String, Object> result = successDataResult(toursConfigBOList);
        //返回线路配置
        return result;
    }


    /**
     * 根据预定日期和线路id查询最近价格
     *
     * @param tourId
     * @return
     */
    @RequestMapping(value = "selectBookingInfoById")
    @ResponseBody
    public Map<String, Object> selectBookingInfoById(int tourId, HttpServletRequest request) {
        String language = getLocal(request);
        List<ToursBookingBO> toursBookingBOList = toursBookingService.selectBookingInfoById(tourId, language);
        //调用BaseController中的方法 封装json对象
        Map<String, Object> result = successDataResult(toursBookingBOList);
        return result;
    }

    @RequestMapping(value = "getBookingInfo")
    @ResponseBody
    public Map<String, Object> getBookingInfo(int tourId, Date date) {

        ToursBookingBO toursBookingBO = toursBookingService.getBookingInfo(tourId, date);

        //调用BaseController中的方法 封装json对象
        Map<String, Object> result = successDataResult(toursBookingBO);
        return result;
    }


}
