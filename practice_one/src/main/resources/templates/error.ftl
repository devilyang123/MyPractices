<h1 style="color: red">全局异常处理</h1>
<br />
<span >
    错误地址：
    <#if url??>
        ${url}
    </#if>
</span>
<br />
<span>
    异常信息：
    <#if exception.message??>
        ${exception.message}
    </#if>
</span>