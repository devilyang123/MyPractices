package com.xiao.controller;

import com.xiao.entity.Menu;
import com.xiao.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

/**
 * @Description 菜单controller
 * @Auther: 笑笑
 * @Date: 0:00 2018/8/30
 */
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    /**
     * @Description 返回主页左侧导航栏所有菜单接口
     * @Date 23:58 2018/8/29 
     * @Param 
     * @return 
     */
    @GetMapping(value = "/getAllMenu")
    public List<Menu> getAllMenu(){
        return  menuService.getAllMenu();
    }

}
