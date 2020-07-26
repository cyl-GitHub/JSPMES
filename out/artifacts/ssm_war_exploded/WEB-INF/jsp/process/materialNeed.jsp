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
        <th style="width: 100px">物料名</th>
        <th style="width: 60px">物料需求</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${materials}" var="material">
        <tr>
            <td>${material.id}</td>
            <td>${material.mName}</td>
            <td>${material.count}</td>


            <td>
                <a href="/process/deletePm?pmId=${material.pmId}&pageNumber=${pageNumber}&pId=${material.pId}">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
<div style="float: left;font-size: 18px;">
    <tr>
        <td colspan="10">
            <a href="/process/setMaterial?pid=${pId}">设置物料</a>
            <input type="button" value="返回" onclick="window.history.back(-1); ">
        </td>
    </tr>

</div>

<div style="float: right;font-size: 18px;">
    <tr>
        <td colspan="10">
            当前${pageNumber}/${totalPage }页&nbsp;&nbsp;

            <c:if test="${pageNumber ne 1}">
                <a href="/material/selectAllMaterials?pageNumber=1">首页</a>
                <a href="/material/selectAllMaterials?pageNumber=${pageNumber-1}">上一页 </a>
            </c:if>

            <c:if test="${pageNumber ne totalPage}">
                <a href="/material/selectAllMaterials?pageNumber=${pageNumber+1}">下一页 </a>
                <a href="/material/selectAllMaterials?pageNumber=${totalPage}">末页</a>
            </c:if>

        </td>
    </tr>

</div>

<div class="footer">2019©作业车间系统</div>
</body>
</html>
