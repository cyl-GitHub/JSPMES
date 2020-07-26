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
    <form action="/user/selectUserByName" method="post">
        <div style="float: left">
            <label for="byName">根据姓名查询:</label><input type="text" name="byName" id="byName">
        </div>
        <input type="submit" value="查询">


    </form>
    <a href="/user/selectAllUsers">显示全部</a>

</div>


<div id="cla4"></div>

<table class="table table-bordered">
    <thead>
    <tr>
        <th style="width: 33px">编号</th>
        <th style="width: 100px">姓名</th>
        <th style="width: 60px">职务</th>
        <th style="width: 100px">部门</th>
        <th style="width: 50px">薪资</th>
        <th style="width: 60px">权限</th>
        <th style="width: 35px">操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.position}</td>
            <td>${user.department.dName}</td>
            <td>${user.salary}</td>
            <td>${user.perm}</td>

            <td>
                <a href="/user/updateUser?name=${user.name}">修改</a>
                <a href="/user/deleteUser?id=${user.id}&pageNumber=${pageNumber}">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div style="float: right;font-size: 18px;">

    <%--<c:choose>--%>
    <%--<c:when test="${cla3 eq null}">--%>
    <tr>
        <td colspan="10">
            当前${pageNumber}/${totalPage }页&nbsp;&nbsp;

            <c:if test="${pageNumber ne 1}">
                <a href="/user/selectAllUsers?pageNumber=1">首页</a>
                <a href="/user/selectAllUsers?pageNumber=${pageNumber-1}">上一页 </a>
            </c:if>

            <c:if test="${pageNumber ne totalPage}">
                <a href="/user/selectAllUsers?pageNumber=${pageNumber+1}">下一页 </a>
                <a href="/user/selectAllUsers?pageNumber=${totalPage}">末页</a>
            </c:if>

        </td>
    </tr>
    <%--</c:when>--%>

    <%--<c:when test="${cla3 ne null}">--%>
    <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<td colspan="10">&ndash;%&gt;--%>
    <%--&lt;%&ndash;当前${pageNumber3}/${totalPage}页&nbsp;&nbsp;&ndash;%&gt;--%>

    <%--&lt;%&ndash;<c:if test="${pageNumber3 ne 1}">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<a href="/title/selectTitle2?pageNumber3=1&cla3=${cla3}&cla1=${cla1}&cla2=${cla2}">首页</a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<a href="/title/selectTitle2?pageNumber3=${pageNumber3-1}&cla3=${cla3}&cla1=${cla1}&cla2=${cla2}">上一页 </a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>

    <%--&lt;%&ndash;<c:if test="${pageNumber3 ne totalPage}">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<a href="/title/selectTitle2?pageNumber3=${pageNumber3+1}&cla3=${cla3}&cla1=${cla1}&cla2=${cla2}">下一页 </a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<a href="/title/selectTitle2?pageNumber3=${totalPage}&cla3=${cla3}&cla1=${cla1}&cla2=${cla2}">末页</a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>

    <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
    <%--</c:when>--%>

    <%--</c:choose>--%>

</div>

<div class="footer">2019©作业车间系统</div>
</body>
</html>
