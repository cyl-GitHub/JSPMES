<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cyl27
  Date: 2020/7/16
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>物料不足</title>
</head>
<body>
<p>物料不足,请联系管理员进行补货!</p>

<p>物料不足名称</p>
<c:forEach items="${need}" var="nee">
    <span>${nee.mName}</span>
    <br>
</c:forEach>


<a href="/task/selectAllTasks">点击回到工作界面</a>


</body>
</html>
