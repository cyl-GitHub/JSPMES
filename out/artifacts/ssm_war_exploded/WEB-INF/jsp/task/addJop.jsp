<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/jop/addJop.js"></script>
</head>
<body>

<form>

    <div id="showJop">
        <label for="tId">工作编号:</label><input type="text" id="tId" name="tId" value="${id}">
        <br>
        <label for="ranking">工序次序:</label>
        <input type="text" name="ranking" id="ranking" style="width: 200px">
        <br><br>

    </div>


    <br><br>
    <div id="div1" style="width: 100%;color: red;font-size:18px;"></div>
    <br>

    <input type="button" onclick="addJop()" value="设置">
    <input type="reset" value="重置">
    <br>
    <input type="button" value="取消" onclick="window.history.back(-1); ">
</form>

</body>
</html>
