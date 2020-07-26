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
        <th style="width: 100px">工作编号</th>
        <th style="width: 50px">工序数</th>
        <th style="width: 100px">作业排序</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${jops}" var="jop">
        <tr>
            <td>${jop.id}</td>
            <td>${jop.tId}</td>
            <td>${jop.processNum}</td>
            <td>${jop.ranking}</td>

            <td>
                <a href="/jop/deleteJop?id=${jop.id}&pageNumber=${pageNumber}&tId=${jop.tId}">删除</a>
                <a href="/process/selectAllProcesses?jId=${jop.id}">查看工序</a>
                <a href="/process/addProcess?jId=${jop.id}">添加工序</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div style="float: left;font-size: 18px;">
    <tr>
        <td colspan="10">
            <a href="/jop/addJop?id=${tId}">添加作业</a>
            <input type="button" value="返回" onclick="window.history.back(-1); ">
        </td>
    </tr>

</div>

<div style="float: right;font-size: 18px;">
    <tr>
        <td colspan="10">
            当前${pageNumber}/${totalPage }页&nbsp;&nbsp;

            <c:if test="${pageNumber ne 1}">
                <a href="/jop/selectAllJops?pageNumber=1&tId=${tId}">首页</a>
                <a href="/jop/selectAllJops?pageNumber=${pageNumber-1}&tId=${tId}">上一页 </a>
            </c:if>

            <c:if test="${pageNumber ne totalPage}">
                <a href="/jop/selectAllJops?pageNumber=${pageNumber+1}&tId=${tId}">下一页 </a>
                <a href="/jop/selectAllJops?pageNumber=${totalPage}&tId=${tId}">末页</a>
            </c:if>

        </td>
    </tr>

</div>

<div class="footer">2019©作业车间系统</div>
</body>
</html>
