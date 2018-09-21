<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>住房管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
    <style>

    </style>
</head>
<body>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">住房管理</li>
    </ul>
</div>
<blockquote class="layui-elem-quote">
    <div class="layui-input-inline">
        <input type="text" placeholder="请输入房号" autocomplete="off" class="layui-input" id="searchInput">
    </div>
    <button class="layui-btn" id="searchBtn">搜索</button>
    <button class="layui-btn" id="add-btn">添加</button>
    <#--<a href="/roomInformation" class="layui-btn">添加</a>-->
    <button class="layui-btn layui-btn-danger" id="batchDelect">批量删除</button>
</blockquote>

<table class="layui-hide" id="myTable"  lay-filter="myTable"></table>
<table class="layui-hide" id="oneTable" lay-filter="oneTable"></table>

<script type="text/html" id="operatorBtn">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="/static/layui/layui.js" charset="utf-8"></script>
<script src="/static/jquery-1.11.3/jquery.js"></script>

<script type="text/html" id="roomSize">
    {{#  if(d.roomSize === 0){ }}
        单间
    {{# } else if(d.roomSize === 1){ }}
        一室一厅
    {{# }else if(d.roomSize === 2){ }}
        两室一厅
    {{# } else{ (d.roomSize === 3)}}
        三室一厅
    {{#  } }}
</script>
<script type="text/html" id="roomTenantId">
    {{#  if(d.roomTenantId === null ){ }}
        无
    {{# } else{ (d.roomTenantId !== null)}}
        d.roomTenantId
    {{#  } }}
</script>
<script type="text/html" id="roomStatus">
    {{#  if(d.roomStatus === 0){ }}
        <span style="color: red;">未租</span>
    {{# } else if(d.roomStatus === 1){ }}
        <span style="color: green;">已租</span>
    {{# } else{ (d.roomStatus === 2)}}
        <span style="color: blueviolet;">预定</span>
    {{#  } }}
</script>
<script>
    layui.use(['jquery','table','layer','form'], function(){
            var $ = layui.$ //由于layer弹层依赖jQuery，也可以直接得到
                ,table = layui.table
                ,form = layui.form
                ,layer = layui.layer;

        table.render({
            elem: '#myTable'
            // ,data:array
            ,url:'/room/getAllRoom'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,height:472
            ,page:true
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                // ,{field:'roomId', width:160, title: 'ID'}
                ,{field:'roomNum', width:100, title: '房号'}
                ,{field:'roomSize', width:100, title: '规格',templet:'#roomSize'}
                ,{field:'roomArea', width:90, title: '面积(\m²)'}
                ,{field:'roomTenantId', width:130, title: '承租人',templet:"#roomTenantId"}
                ,{field:'roomStatus', title: '状态',width:80,templet:"#roomStatus"}
                ,{field:'startDate', title: '出租日期',width:150}
                ,{field:'endDate', title: '结束日期',width:150}
                ,{field:'roomDesc', title: '房间设施/描述'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{title:'操作', toolbar: '#operatorBtn', width:180,fixed: 'right'}
            ]]
        });
        //监听房屋信息列表表格右侧
        table.on('tool(myTable)', function(obj){
            // var checkStatus = table.checkStatus(obj.config.id);
            var roomId = obj.data.roomId;
            switch(obj.event){
                case 'detail':
                    console.log(obj.data);
                    var index1 = layer.open({
                        type: 2,
                        title:"查看住房信息",
                        // area: ['900px', '500px'],
                        // shadeClose: true, //点击遮罩关闭
                        content: './show',
                        success:function (layero, index) {
                            var body = layui.layer.getChildFrame('body', index); // 取到弹出层里的元素
                            //设置房号
                            body.find(".roomNum").val(obj.data.roomNum);
                            //设置规格
                            if(obj.data.roomSize === 0){
                                body.find(".roomSize").val("单间");
                            }else if (obj.data.roomSize === 1) {
                                body.find(".roomSize").val("一室一厅");
                            }
                            else if (obj.data.roomSize === 2) {
                                body.find(".roomSize").val("两室一厅");
                            }else{
                                body.find(".roomSize").val("三室一厅");
                            }
                            //设置面积
                            body.find(".roomArea").val(obj.data.roomArea);
                            //设置承租人
                            if(obj.data.roomTenantId === null){
                                body.find(".roomTenantId").val("无");
                            }
                            //设置出租日期
                            if(obj.data.startDate === null){
                                body.find(".startDate").val("未出租");
                            }
                            //设置结束日期
                            if(obj.data.endDate === null){
                                body.find(".endDate").val("未出租");
                            }
                            //设置状态
                            if(obj.data.roomStatus === 0){
                                body.find(".roomStatus").val("未租");
                            }else if(obj.data.roomStatus === 1){
                                body.find(".roomStatus").val("已租");
                            }else{
                                body.find(".roomStatus").val("预定");
                            }
                            //设置房屋设施/描述
                            body.find(".roomDesc").val(obj.data.roomDesc);
                            // 记得重新渲染表单
                            // form.render();
                            //获取新窗口对象
                            var iframeWindow = layero.find('iframe')[0].contentWindow;
                            //重新渲染表单
                            iframeWindow.layui.form.render();
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回房屋信息列表', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },100)
                        }
                    });
                    layui.layer.full(index1);
                    break;
                case 'edit':
                    var index2 = layer.open({
                        type: 2,
                        title:"修改住房信息",
                        content: './edit',
                        success:function (layero, index) {
                            var body = layui.layer.getChildFrame('body', index); // 取到弹出层里的元素
                            body.find(".roomId").val(obj.data.roomId);
                            // 记得重新渲染表单
                            // form.render();
                            //获取新窗口对象
                            var iframeWindow = layero.find('iframe')[0].contentWindow;
                            //重新渲染表单
                            iframeWindow.layui.form.render();
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回房屋信息列表', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },100)
                        }
                    });
                    layui.layer.full(index2);
                    break;
                case 'del':
                    layer.confirm('此操作不可逆，确定删除吗？', {
                        btn: ['是','否'],icon: 2, title:'警告'},
                            function(index){
                        $.ajax({
                            url:"/room/deleteRoom",
                            data:obj.data.roomId,
                            type:"DELETE",
                            dataType:"json",
                            success:function (data) {
                                if(data.result){
                                    layer.msg("删除成功",{time:2000});
                                    table.reload('myTable',{page:{curr:1}});
                                }else{
                                    layer.msg("删除失败",{time:2000});
                                    table.reload('myTable',{page:{curr:1}});
                                }
                            },
                            error:function () {
                                layer.msg("服务器异常",{time:2000});
                            }
                        });
                        layer.close(index);
                    },function () {
                        //点击否按钮
                    });
                    break;
            }
        });

        //监听复选框事件
        table.on('checkbox(myTable)', function(obj){
            // console.log(obj.checked); //当前是否选中状态
            // console.log(obj.data); //选中行的相关数据
            // console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
            // console.log(obj);
        });

        //批量删除按钮点击事件
        $("#batchDelect").click(function () {
            var checkStatus = table.checkStatus('myTable');
            // layer.alert(JSON.stringify(data));
            if(checkStatus.data.length === 0){
                layer.msg('请先选择', {time: 2000});
                return false;
            }else{
                layer.confirm('此操作不可逆，确定删除吗？', {
                            btn: ['是','否'],icon: 2, title:'警告'},
                        function(index){
                            var ids = [];
                            for(var i = 0;i < checkStatus.data.length; i++){
                                // ids += checkStatus.data[i].roomId+",";
                                ids.push(checkStatus.data[i].roomId);
                            }
                            // console.log(ids);
                            $.ajax({
                                url:"/room/batchDelete",
                                data:JSON.stringify(ids),
                                type:"DELETE",
                                dataType:"json",
                                contentType:"application/json",
                                success:function (data) {
                                    if(data.result){
                                        layer.msg("删除成功",{time:2000});
                                        table.reload('myTable',{page:{curr:1}});
                                    }else{
                                        layer.msg("删除失败",{time:2000});
                                        table.reload('myTable',{page:{curr:1}});
                                    }
                                },
                                error:function () {
                                    layer.msg("服务器异常",{time:2000});
                                }
                            });
                            layer.close(index);
                        },function () {
                            //点击否按钮
                        });

            }

        });

        //根据房号查询搜索按钮点击事件
        $("#searchBtn").click(function () {
            var roomNum = $("#searchInput").val();
            if (roomNum === '' || roomNum === null || (roomNum%1) !== 0 ){
                layer.msg("请正确输入房号",{time:3000});
                return false;
            }
            table.render({
                elem: '#oneTable'
                ,url:'/room/getRoom?roomNum='+roomNum
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                // ,page:true
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    // ,{field:'roomId', width:160, title: 'ID'}
                    ,{field:'roomNum', width:100, title: '房号'}
                    ,{field:'roomSize', width:100, title: '规格',templet:'#roomSize'}
                    ,{field:'roomArea', width:90, title: '面积(\m²)'}
                    ,{field:'roomTenantId', width:130, title: '承租人',templet:"#roomTenantId"}
                    ,{field:'roomStatus', title: '状态',width:80,templet:"#roomStatus"}
                    ,{field:'startDate', title: '出租日期',width:150}
                    ,{field:'endDate', title: '结束日期',width:150}
                    ,{field:'roomDesc', title: '房间设施/描述'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ,{fixed: 'right',title:'操作', toolbar: '#operatorBtn', width:180}
                ]]
            });

        });

        //监听房屋信息列表表格右侧
        table.on('tool(oneTable)', function(obj){
            // var checkStatus = table.checkStatus(obj.config.id);
            var roomId = obj.data.roomId;
            switch(obj.event){
                case 'detail':
                    console.log(obj.data);
                    var index1 = layer.open({
                        type: 2,
                        title:"查看住房信息",
                        // area: ['900px', '500px'],
                        // shadeClose: true, //点击遮罩关闭
                        content: './show',
                        success:function (layero, index) {
                            var body = layui.layer.getChildFrame('body', index); // 取到弹出层里的元素
                            //设置房号
                            body.find(".roomNum").val(obj.data.roomNum);
                            //设置规格
                            if(obj.data.roomSize === 0){
                                body.find(".roomSize").val("单间");
                            }else if (obj.data.roomSize === 1) {
                                body.find(".roomSize").val("一室一厅");
                            }
                            else if (obj.data.roomSize === 2) {
                                body.find(".roomSize").val("两室一厅");
                            }else{
                                body.find(".roomSize").val("三室一厅");
                            }
                            //设置面积
                            body.find(".roomArea").val(obj.data.roomArea);
                            //设置承租人
                            if(obj.data.roomTenantId === null){
                                body.find(".roomTenantId").val("无");
                            }
                            //设置出租日期
                            if(obj.data.startDate === null){
                                body.find(".startDate").val("未出租");
                            }
                            //设置结束日期
                            if(obj.data.endDate === null){
                                body.find(".endDate").val("未出租");
                            }
                            //设置状态
                            if(obj.data.roomStatus === 0){
                                body.find(".roomStatus").val("未租");
                            }else if(obj.data.roomStatus === 1){
                                body.find(".roomStatus").val("已租");
                            }else{
                                body.find(".roomStatus").val("预定");
                            }
                            //设置房屋设施/描述
                            body.find(".roomDesc").val(obj.data.roomDesc);
                            // 记得重新渲染表单
                            // form.render();
                            //获取新窗口对象
                            var iframeWindow = layero.find('iframe')[0].contentWindow;
                            //重新渲染表单
                            iframeWindow.layui.form.render();
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回房屋信息列表', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },100)
                        }
                    });
                    layui.layer.full(index1);
                    break;
                case 'edit':
                    var index2 = layer.open({
                        type: 2,
                        title:"修改住房信息",
                        content: './edit',
                        success:function (layero, index) {
                            var body = layui.layer.getChildFrame('body', index); // 取到弹出层里的元素
                            body.find(".roomId").val(obj.data.roomId);
                            // 记得重新渲染表单
                            // form.render();
                            //获取新窗口对象
                            var iframeWindow = layero.find('iframe')[0].contentWindow;
                            //重新渲染表单
                            iframeWindow.layui.form.render();
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回房屋信息列表', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },100)
                        }
                    });
                    layui.layer.full(index2);
                    break;
                case 'del':
                    layer.confirm('此操作不可逆，确定删除吗？', {
                                btn: ['是','否'],icon: 2, title:'警告'},
                            function(index){
                                $.ajax({
                                    url:"/room/deleteRoom",
                                    data:obj.data.roomId,
                                    type:"DELETE",
                                    dataType:"json",
                                    success:function (data) {
                                        if(data.result){
                                            layer.msg("删除成功",{time:2000});
                                            table.reload('myTable',{page:{curr:1}});
                                        }else{
                                            layer.msg("删除失败",{time:2000});
                                            table.reload('myTable',{page:{curr:1}});
                                        }
                                    },
                                    error:function () {
                                        layer.msg("服务器异常",{time:2000});
                                    }
                                });
                                layer.close(index);
                            },function () {
                                //点击否按钮
                            });
                    break;
            }
        });


        //添加住房信息按钮点击事件
        $('#add-btn').on('click', function(){
            var index = layer.open({
                type: 2,
                title:"添加住房信息",
                area: ['900px', '500px'],
                // shadeClose: true, //点击遮罩关闭
                content: './add',
                success:function (layero, index) {
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回房屋信息列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },100);

                }
            });
            //设置弹出层布满窗口
            layui.layer.full(index);
        });
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(window.sessionStorage.getItem("index"));
        });
    });

</script>

</body>
</html>