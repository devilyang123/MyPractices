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

<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">
            <span style="color: red;">*</span>
            房号
        </label>
        <div class="layui-input-inline">
            <input  lay-verify="required" autocomplete="off" class="layui-input roomNum" name="roomNum" type="number">
        </div>
        <div class="layui-form-mid warmInformation" style="color: red; display: none;">该房号已存在</div>
        <div class="layui-form-mid ableInformation" style="color: green; display: none;">该房号可用</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">
            <span style="color: red;">*</span>
            规格
        </label>
        <div class="layui-input-inline">
            <select  class="roomSize" name="roomSize" lay-verify="required">
                <option value=""></option>
                <option value="0">单间</option>
                <option value="1">一室一厅</option>
                <option value="2">两室一厅</option>
                <option value="3">三室一厅</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">
            <span style="color: red;">*</span>
            面积
        </label>
        <div class="layui-input-inline">
            <input  lay-verify="required" autocomplete="off" class="layui-input roomArea" name="roomArea" type="text">
        </div>
        <div class="layui-form-mid layui-word-aux">单位(m²)</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">
            <span style="color: red;">*</span>
            状态
        </label>
        <div class="layui-input-inline">
            <select  class="roomStatus" name="roomStatus" lay-verify="required">
                <#--<option value=""></option>-->
                <option value="0">未租</option>
                <#--<option value="1">已租</option>-->
                <#--<option value="2">预定</option>-->
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">
            <span style="color: red;">*</span>
            房屋设施/描述
        </label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea roomDesc" name="roomDesc" lay-verify="required"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-sm"  lay-submit id="roomSubmit" lay-filter="roomForm">添加</button>
            <button class="layui-btn layui-btn-sm layui-btn-primary" type="reset" id="goBack">取消</button>
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

        //表单提交
        form.on("submit(roomForm)",function(data){
            var index1 = layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            var index2 = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            // console.log(JSON.stringify(data.field));
            var room = new Object();
            room['roomNum'] = $(".roomNum").val();
            room['roomSize'] = $(".roomSize").val();
            room['roomArea'] = $(".roomArea").val();
            room['roomStatus'] = $(".roomStatus").val();
            room['roomDesc'] = $(".roomDesc").val();
            // console.log(room);
            $.ajax({
                type:"POST",
                url:"/room/addRoom",
                data:room,
                dataType:"json",
                success: function(data) {
                    if(data.result){
                        layer.close(index1);
                        parent.layer.close(index2);           //再执行关闭
                        parent.layer.msg('添加成功',{time:2000});
                        parent.layui.table.reload('myTable',{page:{curr:1}});
                        // parent.location.reload();          //刷新父页面
                    }else{
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
            return false;
        });

        //取消按钮点击事件
        $("#goBack").click(function () {
            $(".warmInformation").css("display","none");
            $(".ableInformation").css("display","none");
        });

        //房号输入框失去焦点，异步验证房号是否存在
        $(".roomNum").blur(function () {
            var num = $(".roomNum").val();
            if(num === null || num === ''){
                return false;
            }
            $.ajax({
                type:"GET",
                url:"/room/getRoom",
                data:{roomNum:$(".roomNum").val()},
                dataType:"json",
                success:function (data) {
                    if(data.data !== null ){
                        $(".warmInformation").css("display","block");
                        $("#roomSubmit").attr("disabled",true);
                        layer.msg("该房号已被占用")
                    }
                    if(data.data === null){
                        $(".ableInformation").css("display","block")
                        $("#roomSubmit").attr("disabled",false);
                    }
                },
                error:function () {
                    layer.msg("服务器异常")
                }
            });
        });
        //房号输入框聚焦事件，隐藏信息提示
        $(".roomNum").focus(function () {
            $(".warmInformation").css("display","none");
            $(".ableInformation").css("display","none");
        });

    });
</script>


</body>