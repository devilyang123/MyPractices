package com.xiao.enums;

import lombok.Getter;

/**
 * @Description 异常信息枚举类
 * @Auther: 笑笑
 * @Date: 20:48 2018/9/4
 */
@Getter
public enum  ExceptionEnum {

    ;

    private Integer code;

    private String msg;

    ExceptionEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
