package com.xiao.entity;

import lombok.Data;

/**
 * @Desc 菜单实体类
 * @Auther: 笑笑
 * @Date: 23:14 2018/8/29
 */
@Data
public class Menu {

    /**
     * 菜单id
     */
    private String menuId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 跳转地址
     */
    private String menuUrl;


}
