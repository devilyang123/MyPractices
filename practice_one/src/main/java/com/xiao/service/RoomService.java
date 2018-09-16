package com.xiao.service;

import com.xiao.common.TableResult;
import com.xiao.entity.Room;

/**
 * @Description 住房管理service接口
 * @Auther: 笑笑
 * @Date: 23:06 2018/8/30
 */
public interface RoomService {

    /**
     * 查询所有住房信息
     */
    TableResult<Room> getAllRoom(Integer page,Integer limit);

    /**
     * 添加住房信息
     */
    boolean addRoom(Room room);

    /**
     * 根据房号查询住房信息
     */
    TableResult<Room> getRoom(String roomNum);

    /**
     * 根据ID删除住房信息
     */
    boolean deleteRoomById(String roomId);

    /**
     * 修改住房信息
     */
    boolean updateRoom(Room room);

    /**
     * 根据ID查询住房信息
     */
    Room getRoomById(String roomId);

    /**
     * 根据ID批量删除住房信息
     */
    boolean batchDelete(String[] roomId);

}

