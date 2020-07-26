<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/admin/page1.css">
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/TotalPage.css">
</head>
<body>
<div class="allpage">

    <div class="up">
        <%--后台--%>
        <a target="_blank" href="/user/login">
            <div class="up_left"></div>
        </a>
        <div class="up_right">
            <a href="/admin/adminLogin"><img src="${requestScope.ContextPath}/img/page1/quit.gif" alt="退出"></a>
        </div>
    </div>

    <div class="down">
        <%--导航栏--%>
        <iframe src="/admin/navigation" class="iframe1" name="iframe1" target="iframe2">
        </iframe>


        <%--默认为显示用户管理界面--%>
        <iframe src="/user/selectAllUsers" class="iframe2" name="iframe2">
        </iframe>
    </div>
</div>
</body>
</html>
