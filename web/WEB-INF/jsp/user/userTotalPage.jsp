<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户</title>
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/admin/page1.css">
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/TotalPage.css">

</head>

<body>
<div class="allpage">

    <div class="up">
        <%--后台--%>
        <a target="_blank" href="#">
            <div class="up_left"></div>
        </a>
        <div class="up_right">
            <a href="/user/login"><img src="${requestScope.ContextPath}/img/page1/quit.gif" alt="退出"></a>
        </div>
    </div>

    <div class="down">
        <%--导航栏--%>
        <iframe src="/user/userNavigation" class="iframe1" name="iframe1" target="iframe2">
        </iframe>

        <%-- 默认为用户界面--%>
        <iframe src="/task/selectAllTasks" class="iframe2" name="iframe2">
        </iframe>
    </div>
</div>


</body>
</html>
