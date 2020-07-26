<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/task/addTask.js"></script>
</head>
<body>

<form>

    <label for="tName">工作名:</label>
    <input type="text" name="tName" id="tName" style="width: 200px">
    <br><br>


    <label for="machineNum">机器数:</label>
    <input type="text" name="machineNum" id="machineNum" style="width: 200px">
    <br><br>


    <br><br>
    <div id="div1" style="width: 100%;color: red;font-size:18px;"></div>
    <br>

    <input type="button"  onclick="addTask()" value="添加">
    <input type="reset" value="重置">
    <br>
    <input type="button" value="取消" onclick="window.history.back(-1); ">
</form>

</body>
</html>
