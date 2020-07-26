<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/material/addMaterial.js"></script>
</head>
<body>

<form>

    <div >
        <label for="mName">物料名:</label><input type="text" id="mName" name="mName">
        <br>
        <label for="number">物料数量:</label>
        <input type="text" name="number" id="number" style="width: 200px">
        <br><br>

    </div>


    <br><br>
    <div id="div1" style="width: 100%;color: red;font-size:18px;"></div>
    <br>

    <input type="button" onclick="addMaterial()" value="设置">
    <input type="reset" value="重置">
    <br>
    <input type="button" value="取消" onclick="window.history.back(-1); ">
</form>

</body>
</html>
