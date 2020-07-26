<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导航栏</title>
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/Navigation.css">


</head>
<body>
<%--style="background-color: #2f353f"--%>

<div class="item-left clearfix">
    <%--<p class="title">车型选择</p>--%>
    <a class="item active" href="/task/selectAllTasks" target="iframe2">查看所有工作</a>
    <a class="item active" data-index="0" href="/task/addTask" target="iframe2">创建工作</a>

        <a class="item active" href="/material/selectAllMaterials1" target="iframe2">查看物料</a>
</div>


</body>
</html>
