package com.xiao.utils;

import org.junit.jupiter.api.Test;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @Auther: 笑笑
 * @Date: 15:08 2018/8/26
 */
public class IDUtil {

    public static String getID(){
        SimpleDateFormat sf = new SimpleDateFormat("yyyymmddss");
        String date = sf.format(new Date());
        //生成随机六位数字
        int random = (int)((Math.random()*9+1)*100000);
        return date+random;
    }
}
