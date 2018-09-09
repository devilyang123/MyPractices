package com.xiao.entity;

import lombok.Data;

/**
 * @Description 住房信息实体类
 * @Auther: 笑笑
 * @Date: 22:33 2018/8/30
 */
@Data
public class Room {

    /**
     * 住房id
     */
    private String roomId;

    /**
     * 房号
     */
    private Integer roomNum;

    /**
     * 规格 0-单间 1-一室一厅 2-两室一厅 3-三室 4-三室一厅
     */
    private Integer roomSize;

    /**
     * 面积
     */
    private double roomArea;

    /**
     * 具体描述（房屋设施）
     */
    private String roomDesc;

    /**
     * 状态 0-未租，1-已租，2-预定
     */
    private Integer roomStatus;

    /**
     * 出租时间
     */
    private String startDate;

    /**
     * 结束时间
     */
    private String endDate;

    /**
     * 房客id,表示谁承租此房
     */
    private String roomTenantId;

}
