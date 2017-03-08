/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-10-22
 */
package com.beautifulchina.constants;

/**
 * 公共常量枚举
 */
public enum CommonEnum {
    /**
     * 价格格式化
     */
    PRICE_FORMAT_STR("#0.###");

    private String value;

    private CommonEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public boolean equals(String str) {
        return this.value.equals(str);
    }

    public boolean equalsIgnoreCase(String str) {
        return this.value.equalsIgnoreCase(str);
    }

    @Override
    public String toString() {
        return this.value;
    }

}
