package com.beautifulchina.support;

import org.springframework.data.mongodb.core.mapping.Document;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author pengx
 * @date 2017/3/15
 */
@Target(ElementType.FIELD)
@Document
@Retention(RetentionPolicy.RUNTIME)
public @interface Locale {
}
