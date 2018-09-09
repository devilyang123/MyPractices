package com.xiao.mapper;

import com.xiao.entity.Room;
import com.xiao.utils.IDUtil;
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
public class RoomMapperTest {

    @Autowired
    private RoomMapper roomMapper;

    @Test
    public void getAllRoom() {
        List<Room> roomList = roomMapper.getAllRoom();
        System.out.println(roomList);
        Assert.assertNotEquals(0,roomList.size());
    }

    @Test
    public void addRoom() {
        Room room = new Room();
        room.setRoomId(IDUtil.getID());
        room.setRoomNum(506);
        room.setRoomSize(0);
        room.setRoomArea(64);
        room.setRoomTenantId("123");
        room.setRoomStatus(0);
        room.setStartDate("未出租");
        room.setEndDate("未出租");
        room.setRoomDesc("空调，洗衣机，冰箱");
        int i = roomMapper.addRoom(room);
        System.out.println(i);
    }

    @Test
    public void getRoom() {
        Room room = roomMapper.getRoom(363546);
        System.out.println(room);
        Assert.assertNotNull(room);
    }

    @Test
    public void deleteRoomById() {
        int i = roomMapper.deleteRoomById("2018520405935304");
        System.out.println(i);
        Assert.assertNotEquals(0,i);
    }

    @Test
    public void updateRoom() {
        Room room = new Room();
        room.setRoomId("2018090536897190");
        room.setRoomNum(6666);
        room.setRoomSize(2);
        room.setRoomArea(456);
        room.setRoomStatus(0);
        room.setRoomDesc("我十多个66666");
        int i = roomMapper.updateRoom(room);
        Assert.assertNotEquals(0,i);
    }

    @Test
    public void getRoomById() {
        Room room = roomMapper.getRoomById("2018090536897190");
        System.out.println(room);
        Assert.assertNotNull(room);
    }

    @Test
    public void batchDelete() {
        String[] roomId = {"2018090536897190","2018090624979247"};
        int i = roomMapper.batchDelete(roomId);
        System.out.println(i);
    }
}