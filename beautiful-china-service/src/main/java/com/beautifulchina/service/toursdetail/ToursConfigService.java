/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.service.toursdetail;


import com.beautifulchina.dao.toursdetail.ToursConfigMapper;
import com.beautifulchina.product.bo.ToursConfigBO;
import com.beautifulchina.product.pojo.ToursConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 线程配置信息服务
 */
@Service
public class ToursConfigService {

    private static Logger logger = LoggerFactory.getLogger(ToursConfigService.class);

    @Autowired
    private ToursConfigMapper toursConfigMapper;

    /**
     * 根据线路id查找线路配置
     *
     * @param tourId
     * @param language
     * @return
     */
    public List<ToursConfigBO> selectTourConfigById(int tourId, String language) {

        //配置列表
        List<ToursConfigBO> toursConfigBOList = new ArrayList<ToursConfigBO>();
        //数据库对应数据
        List<ToursConfig> toursConfigList = toursConfigMapper.selectTourConfigById(tourId);

        for (ToursConfig toursConfig : toursConfigList) {
            ToursConfigBO toursConfigBO = new ToursConfigBO();
            //配置名称
            toursConfigBO.setName(toursConfig.getName());
            //配置类型
            toursConfigBO.setType(toursConfig.getType());
            // 根据前端语言类型查询对应的字段
            if ("fr".equals(language)) {
                //法文
                toursConfigBO.setContent(toursConfig.getContentFr());

            } else {
                //英文
                toursConfigBO.setContent(toursConfig.getContentEn());

            }
            toursConfigBOList.add(toursConfigBO);
        }
        return toursConfigBOList;
    }
}
