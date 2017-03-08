package com.beautifulchina.service.suggestions;

import com.beautifulchina.dao.suggestions.SuggestionsMapper;
import com.beautifulchina.suggestions.Suggestions;
import com.beautifulchina.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Service
public class SuggestionsService {
    //用于生成6位序列号
    private static int i=0;
    @Autowired
    private SuggestionsMapper suggestionsMapper;

    public void insertSuggestions(Suggestions suggestions){
        //订单号
        String disno=getSerialNum(suggestions.getUserId());
        suggestions.setDisno(disno);
        suggestionsMapper.insertSuggestions(suggestions);
    }


    //订单号生成
    public  String getSerialNum(int userId){
        //获得当前时间，格式 yyyyMMddHHmmss
        String dt = DateUtil.getCurrentDate("yyyyMMddHHmmss");
        //序列号
        String serialNum = getNum();
        //订单号
        String orderNo = dt + userId + serialNum;
        return orderNo;
    }

    /**
     * 返回6位自增序列号
     */
    private static String getNum(){
        //如果i=999999,则重置
        if(i==999999){
            reset();
        }
        i++;
        String s = "000000" + String.valueOf(i);
        return s.substring(s.length() - 6);
    }

    /**
     * 重置i
     */
    public static void reset(){
        i=0;
    }

}
