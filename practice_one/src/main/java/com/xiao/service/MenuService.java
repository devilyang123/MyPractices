package com.xiao.service;

import com.xiao.entity.Menu;

import java.util.List;

/**
 * @Desc 菜单service接口
 * @Auther: 笑笑
 * @Date: 23:32 2018/8/29
 */
public interface MenuService {

    /**
     * 查询所有菜单
     */
    List<Menu> getAllMenu();

}
