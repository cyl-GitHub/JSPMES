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


<div style="float: left">
    <input type="hidden" id="pageNumber3" name="pageNumber3" value="1">
    <form action="/task/selectTaskByName" method="post">
        <div style="float: left">
            <label for="byName">根据工作名查询:</label><input type="text" name="byName" id="byName">
        </div>
        <input type="submit" value="查询">


    </form>
    <a href="/task/selectAllTasks">显示全部</a>

</div>


<div id="cla4"></div>

<table class="table table-bordered">
    <thead>
    <tr>
        <th style="width: 33px">编号</th>
        <th style="width: 100px">工作名</th>
        <th style="width: 60px">用户id</th>
        <th style="width: 230px">创建时间</th>
        <th style="width: 100px">最短用时</th>
        <th style="width: 50px">机器数</th>
        <th style="width: 50px">作业数</th>
        <th style="width: 100px">是否完成</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${tasks}" var="task">
        <tr>
            <td>${task.id}</td>
            <td>${task.tName}</td>
            <td>${task.uid}</td>
            <td>${task.createTime}</td>
            <td>${task.endTime}</td>
            <td>${task.machineNum}</td>
            <td>${task.jopNum}</td>
            <td>
                <c:if test="${task.over eq 1}">
                    完成
                </c:if>
                <c:if test="${task.over eq 0}">
                    未运行
                </c:if>
            </td>
            <td>
                <a href="/task/deleteTask?id=${task.id}&pageNumber=${pageNumber}">删除</a>
                <a href="/jop/selectAllJops?tId=${task.id}">查看</a>
                <a href="/jop/addJop?id=${task.id}">添加作业</a>
                <c:if test="${task.over eq 1}">
                    <a href="/task/taskResult?id=${task.id}">输出结果</a>
                </c:if>
                <c:if test="${task.over eq 0}">
                    <a href="/task/taskResult?id=${task.id}">执行</a>
                </c:if>

            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div style="float: right;font-size: 18px;">
    <tr>
        <td colspan="10">
            当前${pageNumber}/${totalPage }页&nbsp;&nbsp;

            <c:if test="${pageNumber ne 1}">
                <a href="/task/selectAllTasks?pageNumber=1">首页</a>
                <a href="/task/selectAllTasks?pageNumber=${pageNumber-1}">上一页 </a>
            </c:if>

            <c:if test="${pageNumber ne totalPage}">
                <a href="/task/selectAllTasks?pageNumber=${pageNumber+1}">下一页 </a>
                <a href="/task/selectAllTasks?pageNumber=${totalPage}">末页</a>
            </c:if>

        </td>
    </tr>

</div>

<div class="footer">2019©作业车间系统</div>
</body>
</html>
