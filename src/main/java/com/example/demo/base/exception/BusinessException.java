package com.example.demo.base.exception;

import lombok.Getter;

import java.text.MessageFormat;

/**
 *@Author:syc
 *@Desc:业务异常通常根据业务的需要可以选择抛出去或者捕获后处理掉。
 *@Date: 14:47 2018/3/23
 */
@Getter
public class BusinessException extends RuntimeException {

    private ErrorCode errorCode;

    public BusinessException(ErrorCode errorCode, Object ... params){
        super(MessageFormat.format(errorCode.getErrorMsg(),params));
        this.errorCode = errorCode;
    }

    public BusinessException(ErrorCode errorCode, Throwable e, Object ... params){
        super(MessageFormat.format(errorCode.getErrorMsg(),params),e);
        this.errorCode = errorCode;
    }


}
