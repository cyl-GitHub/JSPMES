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
    <form action="/material/selectMaterialsByName1" method="post">
        <div style="float: left">
            <label for="byName">根据物料名查询:</label><input type="text" name="byName" id="byName">
        </div>
        <input type="submit" value="查询">


    </form>
    <a href="/material/selectAllMaterials1">显示全部</a>

</div>


<div id="cla4"></div>

<table class="table table-bordered">
    <thead>
    <tr>
        <th style="width: 33px">编号</th>
        <th style="width: 100px">物料名</th>
        <th style="width: 60px">物料剩余</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${materials}" var="material">
        <tr>
            <td>${material.id}</td>
            <td>${material.mName}</td>
            <td>${material.number}</td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div style="float: right;font-size: 18px;">
    <tr>
        <td colspan="10">
            当前${pageNumber}/${totalPage }页&nbsp;&nbsp;

            <c:if test="${pageNumber ne 1}">
                <a href="/material/selectAllMaterials1?pageNumber=1">首页</a>
                <a href="/material/selectAllMaterials1?pageNumber=${pageNumber-1}">上一页 </a>
            </c:if>

            <c:if test="${pageNumber ne totalPage}">
                <a href="/material/selectAllMaterials1?pageNumber=${pageNumber+1}">下一页 </a>
                <a href="/material/selectAllMaterials1?pageNumber=${totalPage}">末页</a>
            </c:if>

        </td>
    </tr>

</div>

<div class="footer">2019©作业车间系统</div>
</body>
</html>
