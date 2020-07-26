<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导航栏</title>
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/Navigation.css">
</head>
<body>

<div class="item-left clearfix">
    <a class="item active" data-index="0" href="/user/selectAllUsers" target="iframe2">用户管理</a>
    <a class="item active" href="/user/addUser" target="iframe2">添加用户</a>
    <a class="item active" href="/material/selectAllMaterials" target="iframe2">查看物料</a>
    <a class="item active" href="/material/addMaterial" target="iframe2">添加物料</a>

</div>

</body>
</html>
