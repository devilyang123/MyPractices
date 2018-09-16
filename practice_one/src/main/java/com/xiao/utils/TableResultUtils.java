package com.xiao.utils;

import com.xiao.common.TableResult;
import com.xiao.enums.ResultCodeEnum;

/**
 * @Description layui返回结果工具类
 * @Auther: 笑笑
 * @Date: 23:02 2018/9/2
 */
public class TableResultUtils {


    /**
     * @Description 数据请求成功方法
     * @Date 23:04 2018/9/2
     * @Param
     * @return
     */
    public static void sucess(TableResult result){
        result.setCode(ResultCodeEnum.SUCCESS.getCode());
        result.setMsg(ResultCodeEnum.SUCCESS.getMsg());
    }
    /**
     * @Description 数据请求失败方法
     * @Date 23:05 2018/9/2
     * @Param
     * @return
     */
    public static void fail(TableResult result){
        result.setCode(ResultCodeEnum.FAIL.getCode());
        result.setMsg(ResultCodeEnum.FAIL.getMsg());
    }
}
