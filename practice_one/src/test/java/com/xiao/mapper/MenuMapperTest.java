package com.xiao.mapper;

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
public class MenuMapperTest {

    @Autowired
    private MenuMapper menuMapper;

    @Test
    public void getAllMenu() {

        List<Menu> menuList = menuMapper.getAllMenu();
        System.out.println(menuList);
        Assert.assertNotEquals(0,menuList.size());
    }
}