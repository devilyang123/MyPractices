package com.xiao.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description 工具类
 * @Auther: 笑笑
 * @Date: 11:12 2018/9/8
 */
public class Tools {

    /**
     * @Description 判断一个字符串是否不为空(null,"null","")
     * @Date 11:15 2018/9/8
     * @Param
     * @return
     */
    public static boolean notEmpty(String s){
        return s != null && !s.equals("") && !s.equals("null");
    }

    /**
     * @Description 判断请求是否是Ajax请求
     * @Date 10:00 2018/9/17
     * @Param
     * @return
     */
    public static boolean isAjax(HttpServletRequest request){
        return(request.getHeader("X-Requested-With")!=null
                &&"XMLHttpRequest".equals(request.getHeader("X-Requested-With").toString()));
    }
}
