package com.xiao.mapper;

import com.xiao.entity.Menu;

import java.util.List;

/**
 * @Desc 菜单mapper接口
 * @Auther: 笑笑
 * @Date: 23:20 2018/8/29
 */
public interface MenuMapper {

    /**
     * 查询所有菜单
     */
    List<Menu> getAllMenu();

}
