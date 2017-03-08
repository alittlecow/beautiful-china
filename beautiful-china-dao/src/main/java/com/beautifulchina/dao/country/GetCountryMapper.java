package com.beautifulchina.dao.country;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.country.Country;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Repository
public interface GetCountryMapper extends SqlMapper {
    /**
     * 获取国家
     */
    List<Country> getCountry();
    /**
     * 获取省
     */
    List<Country> getProv(String code);
}
