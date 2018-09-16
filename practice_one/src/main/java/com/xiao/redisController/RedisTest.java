package com.xiao.redisController;


import com.xiao.entity.Room;
import com.xiao.mapper.RoomMapper;
import com.xiao.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;


/**
 * @Description redis测试
 * @Auther: 笑笑
 * @Date: 9:50 2018/9/14
 */
@Controller
public class RedisTest {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private RoomMapper roomMapper;


    @RequestMapping("/redis")
    @ResponseBody
    public List<Room> test(){

//        String s = JSONUtils.toJSONString(roomMapper.getRoom("001"));
//        System.out.println(s);
//        redisTemplate.opsForValue().set("room",roomMapper.getRoom("001").toString());
          redisTemplate.opsForValue().set("room",JsonUtils.objectToJson(roomMapper.getAllRoom()));
          String room = redisTemplate.opsForValue().get("room");
          List<Room> roomList = JsonUtils.jsonToList(room, Room.class);
          System.err.println(room);
          System.err.println(roomList);
//          redisTemplate.delete("room");
          return roomList;
    }
}
