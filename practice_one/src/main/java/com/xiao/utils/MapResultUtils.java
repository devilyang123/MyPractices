package com.xiao.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description 返回结果map 工具类
 * @Auther: 笑笑
 * @Date: 22:58 2018/9/4
 */
public class MapResultUtils {

    /**
     * @Description 增删改 返回map方法
     * @Date 23:06 2018/9/4
     * @Param
     * @return
     */
    public static Map<String,Object> map(boolean b){
        Map<String,Object> map = new HashMap<>();
        map.put("result",b);
        return map;
    }


}
