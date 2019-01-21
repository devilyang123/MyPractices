package com.xiao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @Description 入口类
 * @Auther: 笑笑
 * @Date: 16:30 2019/1/21
 */
@SpringBootApplication
@MapperScan(basePackages = "com.xiao.mapper")
public class ApplicationEntry {
    public static void main(String[] args){
        SpringApplication.run(ApplicationEntry.class,args);
    }
}
