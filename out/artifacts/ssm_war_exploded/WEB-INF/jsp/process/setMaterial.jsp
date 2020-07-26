<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/material/setMaterial.js"></script>
</head>
<body>

<form>

    <label for="pId">工序id:</label>
    <input type="text" name="pId" id="pId" value="${pid}" style="width: 200px">
    <br><br>

    <label for="mId">物料id:</label>
    <input type="text" name="mId" id="mId" style="width: 200px">
    <br><br>


    <label for="count">数量需求:</label>
    <input type="text" name="count" id="count" style="width: 200px">
    <br><br>


    <br><br>
    <div id="div1" style="width: 100%;color: red;font-size:18px;"></div>
    <br>

    <input type="button" onclick="setMaterial()" value="添加">
    <input type="reset" value="重置">
    <br>
    <input type="button" value="取消" onclick="window.history.back(-1); ">
</form>

</body>
</html>
