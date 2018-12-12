package com.example.demo.base.config;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.base.exception.BusFamilyErrorCode;
import com.example.demo.base.exception.BusinessException;
import com.zhenzi.sms.ZhenziSmsClient;
import org.springframework.stereotype.Service;

import java.util.Random;

/**
 * @program: prisondemo
 * @description: 发送短信验证码
 * @author: jiahao
 * @create: 2018-12-12 15:16
 **/
@Service
public class Msg {

    private final static String appId = "100289";
    private final static String appSecret = "f5b79220-0b6c-4165-a8a0-866e9937ea8c";
    private final static String apiurl = "https://sms_developer.zhenzikj.com";
    /**
     * @param number :  接受手机号码
     * @description  注册发送短信
     * @author  jiahao
     * @Date  2018/12/12 15:29
     */
    public String sendSms(String number) {
        try {
            JSONObject json = null;
            //生成6位验证码
            String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
            //发送短信
            ZhenziSmsClient client = new ZhenziSmsClient(apiurl, appId,appSecret);
            String result = client.send(number, "您的验证码为:" + verifyCode + "，该码有效期为2分钟，该码只能使用一次！【短信签名】");
            System.out.println("短信验证码返回"+result);
            json = JSONObject.parseObject(result);
            if(json.getIntValue("code") != 0){//发送短信失败
                return "fail";
            }else{
                return verifyCode;
            }
        } catch (Exception e) {
            throw new BusinessException(BusFamilyErrorCode.SEND_SMS_FAIL);
        }
    }

}
