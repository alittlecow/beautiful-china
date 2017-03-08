/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-09
 */
package com.beautifulchina.exception;

import com.beautifulchina.handle.ErrorHandler;

import java.util.Map;

/**
 * 公共的异常或无法确定范围的异常
 */
public class CommonException extends BaseException {

    public CommonException(String errorCode, String errorMessage) {
        super(errorCode, errorMessage);
    }

    public CommonException(Map map) {
        super(map);
    }

    public CommonException() {
        super();
    }

    public CommonException(BaseException e) {
        super(e);
    }

    public CommonException(String errorCode){
        super(errorCode, ErrorHandler.getErrMsg(errorCode));
        this.errorMessage = ErrorHandler.getErrMsg(errorCode);
        this.errorCode = errorCode;
    }
}
