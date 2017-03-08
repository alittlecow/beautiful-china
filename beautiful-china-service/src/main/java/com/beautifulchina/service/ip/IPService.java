/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-09
 */
package com.beautifulchina.service.ip;

import com.beautifulchina.constants.CommonErrorCode;
import com.beautifulchina.exception.CommonException;
import com.beautifulchina.handle.PropertyHandler;
import com.beautifulchina.util.DateUtil;
import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.record.Location;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Date;

/**
 * IP地址服务，用于查询IP的相关信息
 */
@Service
public class IPService {

    private Logger logger = LoggerFactory.getLogger(IPService.class);

    private DatabaseReader reader = null;

    public IPService(){
        logger.info("------------------------------读取IP数据库--------------------------------");
        File database = new File(PropertyHandler.getProperty("beautifulChina.geoip.path"));
        try {
            reader = new DatabaseReader.Builder(database).build();
        } catch (IOException e) {
            logger.error("IPService 实例化失败",e);
        }
    }

    /**
     * 根据ip获取对应时区的时间
     * @param ip
     * @param date
     * @return
     */
    public String getTimeZone(String ip,Date date,String localTimeZoneId) throws CommonException {
        String strDate = "";
        try {
            InetAddress ipAddress = InetAddress.getByName(ip);
            Location location = reader.city(ipAddress).getLocation();
            String timeZone = location.getTimeZone();
            if(StringUtils.isNotEmpty(timeZone)){
                strDate = DateUtil.getTimeZoneDate(date, DateUtil.DATE_FORMAT_LONG_ONE, timeZone);
            }else {
                strDate = DateUtil.getTimeZoneDate(date, DateUtil.DATE_FORMAT_LONG_ONE, localTimeZoneId);
            }

        } catch (Exception e) {
            logger.error("getTimeZone()",e);
            throw new CommonException(CommonErrorCode.IP_TIME_ZONE_ERROR);
        }
        return strDate;
    }

    /**
     * 根据ip获取对应时区的时间
     * @param ip
     * @param date
     * @return
     */
    public Date getTimeZoneDate(String ip,Date date,String localTimeZoneId) throws CommonException {
        Date objDate = null;
        try {
            InetAddress ipAddress = InetAddress.getByName(ip);
            Location location = reader.city(ipAddress).getLocation();
            String timeZone = location.getTimeZone();
            if(StringUtils.isNotEmpty(timeZone)){
                objDate = DateUtil.getDate(DateUtil.getTimeZoneDate(date, DateUtil.DATE_FORMAT_LONG_ONE, timeZone));
            }else {
                objDate = DateUtil.getDate(DateUtil.getTimeZoneDate(date, DateUtil.DATE_FORMAT_LONG_ONE, localTimeZoneId));
            }

        } catch (Exception e) {
            logger.error("getTimeZone()",e);
            throw new CommonException(CommonErrorCode.IP_TIME_ZONE_ERROR);
        }
        return objDate;
    }

}
