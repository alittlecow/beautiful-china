package com.beautifulchina.support;

import com.beautifulchina.dao.language.LanguageMapper;
import com.beautifulchina.util.ReflectionUtils;
import core.annotation.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.*;

/**
 * @author pengx
 * @date 2017/3/13
 */
@Repository("languageRepository")
public class LanguageDataRepository implements LocaleSupport {
    @Autowired
    LanguageMapper languageMapper;


    public String getLanguageContent(String key, String local) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("key", key);
        params.put("local", local);
        String content = languageMapper.getLanguageContent(params);
        return content != null ? content : "";
    }


    public void localeContent(Object object, String local) {
        //获取所有父类中的字段
        List<Field> fieldList = new ArrayList<Field>();
        Class cls = object.getClass();
        do {
            fieldList.addAll(Arrays.asList(cls.getDeclaredFields()));
            cls = cls.getSuperclass();
        } while (cls != null);

        for (Field f : fieldList) {
            Locale localeAnnotation = f.getAnnotation(Locale.class);
            if (localeAnnotation != null) {
                String fieldName = f.getName();
                String key = (String) ReflectionUtils.getFieldValue(object, fieldName);
                String newContent = getLanguageContent(key, local);
                ReflectionUtils.invokeSetterMethod(object, fieldName, newContent);
            }
        }
    }
}
