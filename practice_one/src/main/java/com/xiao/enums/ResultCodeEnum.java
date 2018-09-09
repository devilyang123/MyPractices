package com.xiao.enums;

import lombok.Getter;

/**
 * @Description 返回接口最外层对象状态码枚举类
 * @Auther: 笑笑
 * @Date: 19:53 2018/8/31
 */
@Getter
public enum ResultCodeEnum {

    SUCCESS(0,"成功"),
    FAIL(1,"无数据")
    ;

    private Integer code;

    private String msg;

    ResultCodeEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
