package com.beautifulchina.support;

/**
 * @author pengx
 * @date 2017/3/15
 */
public interface LocaleSupport {

    /*根据语言类型获取本地化语言*/
    String getLanguageContent(String key, String local);

    /*根据方言值更新对象*/
    void localeContent(Object object, String local);
}
