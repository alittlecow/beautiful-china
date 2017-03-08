/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-09
 */
package com.beautifulchina.util;


import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * 日期时间工具
 */
public class GreenWichTimeUtil {

    /**
     * 隐藏工具类的构造方法
     */
    protected GreenWichTimeUtil() {
        throw new UnsupportedOperationException();
    }

    public static final int msInMin = 60000;
    public static  final int minInHr = 60;

    /**
     * 获取格林威治时间
     * @return
     */
    public static String getGreenWichTime(){
        Date date = new Date();
        int Hours, Minutes;
        SimpleDateFormat dateFormat = new SimpleDateFormat(DateUtil.DATE_FORMAT_LONG_ONE);
        TimeZone zone = dateFormat.getTimeZone();
        Minutes = zone.getOffset(date.getTime()) / msInMin;
        Hours = Minutes / minInHr;
        zone = zone.getTimeZone("GMT Time" + (Hours >= 0 ? "+" : "") + Hours
                + ":" + Minutes);
        dateFormat.setTimeZone(zone);
        String greenDate =dateFormat.format(date);
        return greenDate;
    }

    /**
     * 根据格林威治+时区 取当前时区时间 传String类型类型参数
     * @param greenDate
     * @param timeZone
     * @return
     */
    public static String getGreenWichTimeByTimeZone(String greenDate, double timeZone) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.DATE_FORMAT_LONG_ONE);
        Calendar calendar = Calendar.getInstance();
        Date time=sdf.parse(greenDate);
        calendar.setTime(time);
        //先判断是小数
        if(timeZone%1!=0){
            if(timeZone%1>0){
                calendar.add(Calendar.MINUTE,30);
            }else{
                calendar.add(Calendar.MINUTE,-30);
            }
        }
        calendar.add(Calendar.HOUR_OF_DAY,(int)timeZone/1);
        Date date = calendar.getTime();
        return sdf.format(date);
    }


    /**
     * 根据经度获取时区
     * @param longitude
     * @return
     */
    public static double getTimeZone(double longitude){
        double  zoneResult  =  longitude/15;
        BigDecimal  bd  = new BigDecimal(zoneResult);
        double timeZone =  bd.setScale(1,  BigDecimal.ROUND_HALF_UP).doubleValue();
        return timeZone;
    }

    /**
     * 根据格林威治+时区 取当前时区时间
    * @param time
    * @param timeZone
    * @return
            */
    public static String getGreenWichTimeByTimeZone(Date time,double timeZone){
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        calendar.setTime(time);
        //先判断是小数
        if(timeZone%1!=0){
            if(timeZone%1>0){
                calendar.add(Calendar.MINUTE,30);
            }else{
                calendar.add(Calendar.MINUTE,-30);
            }
        }
        calendar.add(Calendar.HOUR_OF_DAY,(int)timeZone/1);
        Date date = calendar.getTime();

        return sdf.format(date);
    }


}
