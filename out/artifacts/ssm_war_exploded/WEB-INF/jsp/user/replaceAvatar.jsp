<%--
  Created by IntelliJ IDEA.
  User: cyl27
  Date: 2020/2/22
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更换头像</title>

    <script src="${requestScope.ContextPath}/jquery-2.1.1/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/user/replaceAvatar.js"></script>

<script>



</script>
</head>
<body>

<form enctype="multipart/form-data">
    <label for="avatar">头像:</label>
    <input type="file" id="avatar">
    <input type="button" id="replaceAvatar" onclick="avatar2()" value="提交">
    <input type="reset" value="重置">
    <div id="tishi"></div>
</form>

<img id="avatar1" style="max-height:600px;max-width:600px;border-width:0px;">
<div>

</div>






</body>
</html>
