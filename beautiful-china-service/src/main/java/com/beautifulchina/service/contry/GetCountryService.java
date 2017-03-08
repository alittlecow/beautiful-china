package com.beautifulchina.service.contry;

import com.beautifulchina.country.Country;
import com.beautifulchina.dao.country.GetCountryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Service
public class GetCountryService {
    @Autowired
    private GetCountryMapper getCountryMapper;

    public List<Country> getCountry(){
        List<Country> list=getCountryMapper.getCountry();
        return list;
    }
    public List<Country> getProv(String code){
        List<Country> list=getCountryMapper.getProv(code);
        return list;
    }
}
