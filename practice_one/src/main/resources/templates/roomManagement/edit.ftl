<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>住房管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">住房信息</li>
    </ul>
</div>

<form class="layui-form">

    <input  type="hidden" autocomplete="off" class="layui-input roomId" name="roomId">


    <div class="layui-form-item">
        <label class="layui-form-label">房号</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input roomNum" name="roomNum" type="number">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">规格</label>
        <div class="layui-input-inline">
            <select  class="roomSize" name="roomSize" lay-filter="roomSize">
                <option value="0">单间</option>
                <option value="1">一室一厅</option>
                <option value="2">两室一厅</option>
                <option value="3">三室一厅</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">面积</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input roomArea" name="roomArea" type="text">
        </div>
        <div class="layui-form-mid layui-word-aux">单位(m²)</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <select  class="roomStatus" name="roomStatus">
            <option value="0">未租</option>
            <#--<option value="1">已租</option>-->
            <#--<option value="2">预定</option>-->
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">房屋设施/描述</label>
        <div class="layui-input-block">
            <textarea  class="layui-textarea roomDesc" name="roomDesc"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-sm"  lay-submit id="roomSubmit" lay-filter="roomForm">确定</button>
            <button class="layui-btn layui-btn-sm layui-btn-primary" type="reset">取消</button>
        </div>
    </div>

</form>


<script src="/static/layui/layui.js" charset="utf-8"></script>
<script src="/static/jquery-1.11.3/jquery.js"></script>
<script>
    layui.use(['jquery','table','layer','form'], function(){
        var $ = layui.jquery
                ,layer = layui.layer
                ,form = layui.form;

        $(function () {
            var roomId = $(".roomId").val();
            //如果roomId为空，循环重新加载页面
            for(;;){
                if(roomId === ''){
                    location.reload();
                }else {
                    // console.log(roomId);
                    $.ajax({
                        type:"GET",
                        url:"/room/getRoomById",
                        data:{roomId:$(".roomId").val()},
                        dataType:"json",
                        success:function (data) {
                            $(".roomNum").val(data.roomNum);
                            $(".roomSize option[value='"+data.roomSize+"']").attr("selected","selected");
                            $(".roomArea").val(data.roomArea);
                            $(".roomStatus option[value='"+data.roomStatus+"']").attr("selected","selected");
                            $(".roomDesc").val(data.roomDesc);
                            //重新渲染表单
                            form.render();
                        }
                    });
                }
                break;
            }
        });

        //表单提交事件
        form.on("submit(roomForm)",function (data) {
            var index1 = layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            var index2 = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            // console.log(data.field);
            var room = {
                "roomId":$(".roomId").val(),
                "roomNum": $(".roomNum").val(),
                "roomSize":$(".roomSize").val(),
                "roomArea":$(".roomArea").val(),
                "roomStatus":$(".roomStatus").val(),
                "roomDesc":$(".roomDesc").val()
            };
            // console.log(room);
            $.ajax({
                type:"PUT",
                url:"/room/updateRoom",
                data:JSON.stringify(room),
                contentType:"application/json",
                dataType:"json",
                async: false,
                success:function (data) {
                   if(data.result){
                       layer.close(index1);
                       parent.layer.close(index2);           //再执行关闭
                       parent.layer.msg('修改成功',{time:2000});
                       parent.layui.table.reload('myTable',{page:{curr:1}});
                   }
                   else{
                       layer.close(index1);
                       parent.layer.close(index2);           //再执行关闭
                       parent.layer.msg('添加失败',{time:2000});
                       parent.layui.table.reload('myTable',{page:{curr:1}});
                   }
                },
                error:function () {
                    layer.close(index1);
                    parent.layer.close(index2);     //再执行关闭
                    parent.layer.msg('服务器异常',{time:2000});
                }
            });
        })

    });

</script>

</body>