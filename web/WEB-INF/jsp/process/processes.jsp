<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章管理</title>
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/article.css">
    <link href="${requestScope.ContextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${requestScope.ContextPath}/jquery-2.1.1/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/bootstrap.min.js"></script>

</head>
<body>


<div id="cla4"></div>

<table class="table table-bordered">
    <thead>
    <tr>
        <th style="width: 33px">编号</th>
        <th style="width: 100px">作业编号</th>
        <th style="width: 50px">机器编号</th>
        <th style="width: 50px">用时</th>
        <th style="width: 50px">开始时间</th>
        <th style="width: 50px">结束时间</th>
        <th style="width: 50px">工序排序</th>

    </tr>
    </thead>
    <tbody>

    <c:forEach items="${processes}" var="process">
        <tr>
            <td>${process.id}</td>
            <td>${process.jId}</td>
            <td>${process.mId}</td>
            <td>${process.time}</td>
            <td>${process.starttime}</td>
            <td>${process.endtime}</td>
            <td>${process.ranking}</td>

            <td>
                <a href="/process/deleteProcess?id=${process.id}&pageNumber=${pageNumber}&jId=${process.jId}">删除</a>
                <a href="/process/setMaterial?pid=${process.id}">设置物料</a>
                <a href="/material/selectAllMaterialsByPid?pId=${process.id}">查看物料</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div style="float: left;font-size: 18px;">
    <tr>
        <td colspan="10">
            <a href="/process/addProcess?jId=${jId}">添加工序</a>
            <input type="button" value="返回" onclick="window.history.back(-1); ">
        </td>
    </tr>

</div>


<div style="float: right;font-size: 18px;">
    <tr>
        <td colspan="10">
            当前${pageNumber}/${totalPage }页&nbsp;&nbsp;

            <c:if test="${pageNumber ne 1}">
                <a href="/process/selectAllProcesses?pageNumber=1&jId=${jId}">首页</a>
                <a href="/process/selectAllProcesses?pageNumber=${pageNumber-1}&jId=${jId}">上一页 </a>
            </c:if>

            <c:if test="${pageNumber ne totalPage}">
                <a href="/process/selectAllProcesses?pageNumber=${pageNumber+1}&jId=${jId}">下一页 </a>
                <a href="/process/selectAllProcesses?pageNumber=${totalPage}&jId=${jId}">末页</a>
            </c:if>

        </td>
    </tr>

</div>

<div class="footer">2019©作业车间系统</div>
</body>
</html>
