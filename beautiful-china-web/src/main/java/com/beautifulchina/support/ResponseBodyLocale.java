package com.beautifulchina.support;

import java.lang.annotation.*;

/**
 * @author pengx
 * @date 2017/3/15
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ResponseBodyLocale {
}
