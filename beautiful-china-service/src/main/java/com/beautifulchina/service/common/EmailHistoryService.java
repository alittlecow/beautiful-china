/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-28
 */
package com.beautifulchina.service.common;

import com.beautifulchina.dao.common.EmailHistoryMapper;
import com.beautifulchina.email.vo.EmailHistoryVO;
import com.beautifulchina.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2016/1/28.
 * 发送邮件历史记录服务
 */
@Service
public class EmailHistoryService {
    @Autowired
    private EmailHistoryMapper emailHistoryMapper;

    /**
     * 保存邮件历史记录
     * @param title
     * @param content
     * @param userId
     * @param email
     */
    public void saveEmailHistory(String title,String content,Long userId,String email){
        EmailHistoryVO emailHistoryVO=new EmailHistoryVO();
        emailHistoryVO.setTitle(title);
        emailHistoryVO.setContent(content);
        emailHistoryVO.setUserId(userId);
        emailHistoryVO.setEmail(email);
        //获取当前时间
        String datetime= DateUtil.getCurrentDate();
        emailHistoryVO.setOperatetime(datetime);
        emailHistoryMapper.saveEmailHistory(emailHistoryVO);
    }
}
