package com.xiao.service.impl;

import com.xiao.entity.Menu;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MenuServiceImplTest {

    @Autowired
    private MenuServiceImpl menuService;

    @Test
    public void getAllMenu() {
        List<Menu> menuList = menuService.getAllMenu();
        Assert.assertNotEquals(0,menuList.size());
    }
}