<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>房屋出租管理系统</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/jquery-1.11.3/jquery.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a class="layui-logo" href="/">房屋出租管理系统</a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <#--<li class="layui-nav-item"><a href="">控制台</a></li>-->
            <#--<li class="layui-nav-item"><a href="">商品管理</a></li>-->
            <#--<li class="layui-nav-item"><a href="">用户</a></li>-->
           <#-- <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>-->
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    笑笑
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree my-menu-tree"  lay-filter="test">
                <#--<li class="layui-nav-item"><a href="" target="_content">首页</a></li>-->
                <#--<li class="layui-nav-item"><a class="" href="" >住房管理</a></li>-->
                <#--<li class="layui-nav-item"><a href="">房客管理</a></li>-->
                <#--<li class="layui-nav-item"><a href="">租金管理</a></li>-->
                <#--<li class="layui-nav-item"><a href="">权限管理</a></li>-->
            </ul>
        </div>
    </div>

    <div class="layui-body" style="overflow: hidden;">
        <!-- 内容主体区域 -->
        <iframe src="/home" name="_content" width="100%" height="100%" frameborder="0" ></iframe>
        <#--<div style="padding: 15px;">内容主体区域</div>-->
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use('element', function(){
        var element = layui.element;

    });

    $(function () {
        var content = "";
        $.get(
            "/menu/getAllMenu",
            function (data) {
                if (data !=null ) {
                    for (var i = 0; i < data.length; i++){
                        // <li class="layui-nav-item"><a href="" target="_content">首页</a></li>
                        content = "<li class='layui-nav-item'>" +
                                    "<a style='font-size: 18px;' href='"+data[i].menuUrl+"' target='_content'>"+data[i].menuName+"</a>" +
                                 "</li>";
                        // console.log(content);
                        $(".my-menu-tree").append(content);
                    }
                }
            }
        );
    });
</script>
</body>
</html>