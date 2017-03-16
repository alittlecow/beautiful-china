/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: fengbaitong
 * date: 2016-01-12
 */
package com.beautifulchina.theme.bo;


import com.beautifulchina.theme.vo.ThemeVO;
import core.annotation.Locale;

import java.lang.reflect.Field;

/**
 * 目的地BO
 */
public class ThemeBO extends ThemeVO {


    public static void main(String[] args) {
        ThemeBO bo = new ThemeBO();
        Class a = bo.getClass().getSuperclass();
        Field[] fields = a.getDeclaredFields();
        for (Field f : fields) {
            if (f.isAnnotationPresent(Locale.class))
                System.out.println("能获取注解");
            System.out.println(f.getName());
        }
        System.out.println("总字段数量：" + bo.getClass().getDeclaredFields().length);
    }

    /**
     * 图片1,2,3,4
     */
    private String photoOne;

    private String photoTwo;

    private String photoThree;

    private String photoFour;


    public String getPhotoOne() {
        return photoOne;
    }

    public void setPhotoOne(String photoOne) {
        this.photoOne = photoOne;
    }

    public String getPhotoTwo() {
        return photoTwo;
    }

    public void setPhotoTwo(String photoTwo) {
        this.photoTwo = photoTwo;
    }

    public String getPhotoThree() {
        return photoThree;
    }

    public void setPhotoThree(String photoThree) {
        this.photoThree = photoThree;
    }

    public String getPhotoFour() {
        return photoFour;
    }

    public void setPhotoFour(String photoFour) {
        this.photoFour = photoFour;
    }
}
