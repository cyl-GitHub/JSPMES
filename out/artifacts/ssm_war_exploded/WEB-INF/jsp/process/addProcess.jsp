<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/process/addProcess.js"></script>
</head>
<body>

<form>

    <label for="jId">作业id:</label>
    <input type="text" name="jId" id="jId" value="${jId}" style="width: 200px">
    <br><br>

    <label for="ranking">工序排序:</label>
    <input type="text" name="ranking" id="ranking" style="width: 200px">
    <br><br>


    <label for="mId">机器编号:</label>
    <input type="text" name="mId" id="mId" style="width: 200px">
    <br><br>

    <label for="time">加工时间:</label>
    <input type="text" name="time" id="time" style="width: 200px">
    <br><br>


    <br><br>
    <div id="div1" style="width: 100%;color: red;font-size:18px;"></div>
    <br>

    <input type="button" onclick="addProcess()" value="添加">
    <input type="reset" value="重置">
    <br>
    <input type="button" value="取消" onclick="window.history.back(-1); ">
</form>

</body>
</html>
