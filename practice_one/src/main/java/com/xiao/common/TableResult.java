package com.xiao.common;

import lombok.Data;

import java.util.List;

/**
 * @Description layui表格 最外层返回对象
 * @Auther: 笑笑
 * @Date: 23:45 2018/8/30
 */
@Data
public class TableResult<T> {

    private Integer code ;

    private String msg ;

    private Integer count;

    private List<T> data;
}
