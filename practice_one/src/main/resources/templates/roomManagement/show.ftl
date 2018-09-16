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

    <div class="layui-form-item">
        <label class="layui-form-label">房号</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input roomNum" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">规格</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input roomSize" value="" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">面积</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input roomArea" disabled="disabled">
        </div>
        <div class="layui-form-mid layui-word-aux">单位(m²)</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">承租人</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input roomTenantId" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出租日期</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input startDate" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">结束日期</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input endDate" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <input  autocomplete="off" class="layui-input roomStatus" value="" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">房屋设施/描述</label>
        <div class="layui-input-block">
            <textarea  class="layui-textarea roomDesc" disabled="disabled" style="width: 500px;"></textarea>
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

    });

</script>

</body>