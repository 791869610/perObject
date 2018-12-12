package com.example.demo.base.enums.commom;

public enum IsDeleteEnum {

    DELETE(1,"删除"),
    NOT_DELETE(2,"没有删除");


    IsDeleteEnum(int code, String describe) {
        this.code = code;
        this.describe = describe;
    }

    private int code;
    private String describe;

    public int getCode() {
        return code;
    }

    public String getDescribe() {
        return describe;
    }
}
