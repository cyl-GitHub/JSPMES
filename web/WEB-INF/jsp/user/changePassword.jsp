<%--
  Created by IntelliJ IDEA.
  User: cyl27
  Date: 2020/2/11
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/user/changePassword.js"></script>
</head>
<body>

<div>
    <form>
        <label for="password">原 密 码 :</label><input type="password" id="password">
        <br>
        <label for="newPassword">新 密 码 :</label><input type="password" id="newPassword">
        <br>
        <div id="result" style="width: 100%;color: red;font-size:18px;text-align: center"></div>

        <input type="button" value="提交" onclick="changePassword()">
        <input type="reset" value="重置">
    </form>
</div>

</body>
</html>
