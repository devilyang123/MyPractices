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

          //将房屋信息集合转换成json字符串，存入redis中
          redisTemplate.opsForValue().set("room",JsonUtils.objectToJson(roomMapper.getAllRoom()));
          //通过key获取json字符串
          String room = redisTemplate.opsForValue().get("room");
          //将json字符串转换成room集合
          List<Room> roomList = JsonUtils.jsonToList(room, Room.class);
          System.err.println(room);
          System.err.println(roomList);
          //删除redis中的数据
          redisTemplate.delete("room");
          return roomList;
    }
}
