package com.xiao.exception;

import com.xiao.enums.ExceptionEnum;
import javax.validation.constraints.NotNull;

/**
 * @Description 自定义异常处理
 * @Auther: 笑笑
 * @Date: 20:45 2018/9/4
 */
public class SystemException  extends RuntimeException{

    private Integer code;

    public SystemException(@NotNull ExceptionEnum exceptionEnum){
        super(exceptionEnum.getMsg());
        this.code = exceptionEnum.getCode();
    }
}
