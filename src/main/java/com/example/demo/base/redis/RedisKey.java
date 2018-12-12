package com.example.demo.base.redis;


import org.apache.tomcat.util.buf.StringUtils;

public class RedisKey {

    //未用
    private final static String redeemCodePond = "REDEEM_POND";
    //已用
    private final static String redeemCodeUSEDPond = "REDEEM_USED_POND";
    //临时
    private final static String redeemTempPond = "REDEEM_TEMP_POND";

    //redisUserKey
    private final static String redisUserKey = "REDIS_USER_";


    public static String sceneryRedeemCodeKey(Long sceneryId){
        return StringUtils.join(new String[]{sceneryId.toString(),"_",redeemCodePond});
    }

    public static String sceneryRedeemCodeUseKey(Long sceneryId){
        return StringUtils.join(new String[]{sceneryId.toString(),"_",redeemCodeUSEDPond});
    }

    public static String sceneryRedeemCodeTempKey(Long sceneryId){
        return StringUtils.join(new String[]{sceneryId.toString(),"_",redeemTempPond});
    }

    public static String userRedisKey(Long userId){
        return StringUtils.join(new String[]{redisUserKey,userId.toString()});
    }
}
