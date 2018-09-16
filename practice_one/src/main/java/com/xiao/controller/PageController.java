package com.xiao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @Description 页面跳转controller
 * @Auther: 笑笑
 * @Date: 22:41 2018/8/30
 */
@Controller
public class PageController {

    /**
     * @Description 跳转主页
     * @Date 22:41 2018/8/30
     * @Param
     * @return
     */
    @GetMapping("/")
    public String index(){
        return "index";
    }

    /**
     * @Description 跳转首页
     * @Date 21:31 2018/9/5
     * @Param
     * @return
     */
    @GetMapping("/home")
    public String home(){
        return "home";
    }

    /**
     * @Description 住房管理模块页面跳转
     * @Date 23:03 2018/8/30
     * @Param
     * @return
     */
    @GetMapping("/roomManagement/{page}")
    public String roomPage(@PathVariable("page") String page){
        return "roomManagement/"+page;
    }
}
