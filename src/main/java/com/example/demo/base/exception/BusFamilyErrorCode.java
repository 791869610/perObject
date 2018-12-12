package com.example.demo.base.exception;


public enum BusFamilyErrorCode implements ErrorCode {
    //1101-1199划分成用户错误码。
    SEND_SMS_FAIL(1101, "发送短信失败"),
    VERIFY_CODE_ERROR(1102, "短信验证码错误");


    BusFamilyErrorCode(int code, String errorMsg) {
        this.code = code;
        this.errorMsg = errorMsg;
    }

    private int code;
    private String errorMsg;

    @Override
    public int getCode() {
        return code;
    }

    @Override
    public String getErrorMsg() {
        return errorMsg;
    }
}
