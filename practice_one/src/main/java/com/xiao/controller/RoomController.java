package com.xiao.controller;

import com.xiao.entity.Room;
import com.xiao.service.RoomService;
import com.xiao.common.TableResult;
import com.xiao.utils.MapResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

/**
 * @Description 住房信息controller
 * @Auther: 笑笑
 * @Date: 23:11 2018/8/30
 */
@RestController
@RequestMapping(value = "/room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    /**
     * @Description 查询所有住房信息接口
     * @Date 20:15 2018/8/31
     * @Param
     * @return
     */
    @GetMapping(value = "/getAllRoom")
    public TableResult<Room> getAllRoom(Integer page,Integer limit){
        return roomService.getAllRoom(page,limit);
    }

    /**
     * @Description 添加住房信息接口
     * @Date 23:20 2018/9/1
     * @Param
     * @return
     */
    @PostMapping(value = "/addRoom")
    public Map<String,Object> addRoom(Room room){
       return MapResultUtils.map(roomService.addRoom(room));
    }

    /**
     * @Description 根据房号查询住房信息接口
     * @Date 22:10 2018/9/2
     * @Param
     * @return
     */
    @GetMapping(value = "/getRoom")
    public TableResult<Room> getRoom(String roomNum){
       return roomService.getRoom(roomNum);
    }

    /**
     * @Description 根据ID删除住房信息接口
     * @Date 23:02 2018/9/4
     * @Param
     * @return
     */
    @DeleteMapping(value = "/deleteRoom")
    public Map<String,Object> deleteRoom(@RequestBody String roomId){
        return MapResultUtils.map(roomService.deleteRoomById(roomId));
    }

    /**
     * @Description 根据ID查询住房信息接口
     * @Date 11:32 2018/9/8
     * @Param
     * @return
     */
    @GetMapping(value = "/getRoomById")
    public Room getRoomById(String roomId){
        return roomService.getRoomById(roomId);
    }

    /**
     * @Description 修改住房信息接口
     * @Date 10:17 2018/9/8
     * @Param
     * @return
     */
    @PutMapping(value = "/updateRoom")
    public Map<String,Object> updateRoom(@RequestBody Room room){
       return MapResultUtils.map(roomService.updateRoom(room));
    }

    /**
     * @Description 根据ID批量删除住房信息接口
     * @Date 21:05 2018/9/9
     * @Param
     * @return
     */
    @DeleteMapping(value = "/batchDelete")
    public Map<String,Object> batchDelete(@RequestBody String[] roomId){
        return MapResultUtils.map(roomService.batchDelete(roomId));
    }

}
