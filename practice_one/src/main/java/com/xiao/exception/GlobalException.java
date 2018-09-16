package com.xiao.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description 全局异常处理(不能处理ajax异常)
 * @Auther: 笑笑
 * @Date: 20:52 2018/9/5
 */
@ControllerAdvice
public class GlobalException {

    public static final String ERROR_VIEW = "error";

    @ExceptionHandler(value = Exception.class)
    public Object errorHandler(HttpServletRequest request, HttpServletResponse response,
                               Exception e){
        e.printStackTrace();

        ModelAndView mv = new ModelAndView();
        mv.addObject("exception",e);
        mv.addObject("url",request.getRequestURI());
        mv.setViewName(ERROR_VIEW);//跳转自定义错误页
        return mv;
    }

}
