package com.xiao.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiao.common.TableResult;
import com.xiao.entity.Room;
import com.xiao.mapper.RoomMapper;
import com.xiao.service.RoomService;
import com.xiao.utils.IDUtil;
import com.xiao.utils.TableResultUtils;
import com.xiao.utils.Tools;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description 住房信息service实现类
 * @Auther: 笑笑
 * @Date: 23:07 2018/8/30
 */
@Service
@Slf4j
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    /**
     * @Description 查询所有住房信息
     * @Date 23:08 2018/8/30
     * @Param
     * @return
     */
    @Override
    public TableResult<Room> getAllRoom(Integer page,Integer limit) {
        TableResult<Room> result = new TableResult<>();
        PageHelper.startPage(page,limit);
        List<Room> roomList = roomMapper.getAllRoom();
        PageInfo<Room> pageInfo = new PageInfo<>(roomList);
        if (roomList != null && roomList.size() > 0){
            //设置成功状态码和信息
            TableResultUtils.sucess(result);
            result.setCount((int)pageInfo.getTotal());
            result.setData(roomList);
            return result;
        }
        TableResultUtils.fail(result);
        log.error("【查询所有房屋信息】 当前无任何房屋信息");
        return result;
    }

    /**
     * @Description 添加住房信息
     * @Date 22:49 2018/8/31
     * @Param
     * @return
     */
    @Override
    public boolean addRoom(Room room) {
        room.setRoomId(IDUtil.getID());
        int i = roomMapper.addRoom(room);
        if (i > 0){
            return true;
        }
        log.error("【添加住房信息】 添加住房信息失败，room={}",room);
        return false;
    }

    /**
     * @Description 根据房号查询住房信息
     * @Date 21:31 2018/9/2
     * @Param
     * @return
     */
    @Override
    public TableResult<Room> getRoom(String roomNum) {
        TableResult<Room> result = new TableResult<>();
        if (roomNum == null || roomNum.equals("")){
            TableResultUtils.fail(result);
            return result;
        }
        Room room = roomMapper.getRoom(roomNum);
        if (room != null){
            List<Room> roomList = new ArrayList<>();
            roomList.add(room);
            TableResultUtils.sucess(result);
            result.setCount(1);//单挑数据，只有一页
            result.setData(roomList);
            return result;
        }
        TableResultUtils.fail(result);
        log.error("【根据号查询房屋信息】 无此住房信息，roomNum={}",roomNum);
        return result;
    }

    /**
     * @Description 根据ID删除住房信息
     * @Date 22:48 2018/9/4
     * @Param
     * @return
     */
    @Override
    public boolean deleteRoomById(String roomId) {
        int i = roomMapper.deleteRoomById(roomId);
        if(i > 0){
            return true;
        }
        log.error("【根据ID删除房屋信息】 删除失败，roomId={}",roomId);
        return  false;
    }

    /**
     * @Description 修改住房信息
     * @Date 9:56 2018/9/8
     * @Param
     * @return
     */
    @Override
    public boolean updateRoom(Room room) {
        int i = roomMapper.updateRoom(room);
        if(i > 0){
            return true;
        }
        log.error("【修改房屋信息】 修改失败，room={}",room);
        return false;
    }
    /**
     * @Description 根据ID查询住房信息
     * @Date 11:06 2018/9/8
     * @Param
     * @return
     */
    @Override
    public Room getRoomById(String roomId) {
        if(Tools.notEmpty(roomId)){
            Room room = roomMapper.getRoomById(roomId);
            if( room != null){
                return room;
            }
            log.error("【根据ID查询住房信息】无此住房信息 ，roomId={}",roomId);
            return null;
        }
        log.error("【根据ID查询住房信息】住房ID为空 ，roomId={}",roomId);
        return null;
    }

    /**
     * @Description 根据ID批量删除住房信息
     * @Date 20:55 2018/9/9
     * @Param
     * @return
     */
    @Override
    public boolean batchDelete(String[] roomId) {
        int i = roomMapper.batchDelete(roomId);
        if(i == roomId.length){
            return true;
        }
        log.error("【根据ID批量删除住房信息】 删除失败，roomId={}",roomId);
        return false;
    }
}
