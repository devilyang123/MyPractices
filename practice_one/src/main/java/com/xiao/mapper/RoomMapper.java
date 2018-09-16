package com.xiao.mapper;

import com.xiao.entity.Room;
import java.util.List;

/**
 * @Description 住房信息mapper接口
 * @Auther: 笑笑
 * @Date: 22:43 2018/8/30
 */
public interface RoomMapper {

    /**
     * 查询所有住房信息
     */
    List<Room> getAllRoom();

    /**
     * 添加住房信息
     */
    int addRoom(Room room);

    /**
     * 根据房号查询住房信息
     */
    Room getRoom(String roomNum);

    /**
     * 根据ID删除住房信息
     */
    int deleteRoomById(String roomId);

    /**
     * 修改住房信息
     */
    int updateRoom(Room room);

    /**
     * 根据ID查询住房信息
     */
    Room getRoomById(String roomId);

    /**
     * 根据ID批量删除住房信息
     */
    int batchDelete(String[] roomId);

}
