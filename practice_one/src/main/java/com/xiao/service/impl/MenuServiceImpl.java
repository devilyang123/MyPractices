package com.xiao.service.impl;

import com.xiao.entity.Menu;
import com.xiao.mapper.MenuMapper;
import com.xiao.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Desc 菜单service实现类
 * @Auther: 笑笑
 * @Date: 23:33 2018/8/29
 */
@Service
@Slf4j
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    /**
     * @Desc 实现查询所有菜单方法
     * @return
     */
    @Override
    public List<Menu> getAllMenu() {
        List<Menu> menuList = menuMapper.getAllMenu();
        if(menuList !=null && menuList.size() > 0){
            return menuList;
        }
        log.error("【查询所有菜单】 无任何菜单信息");
        return null;
    }
}
