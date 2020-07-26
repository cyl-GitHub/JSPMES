<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/admin/updateUser.js"></script>
</head>
<body>

<form id="uploadPicture" enctype="multipart/form-data">

    <label for="name">用户名:</label>
    <input type="text" name="name" id="name" value="${updateUser.name}" style="width: 200px">
    <br><br>

    <label for="position">职务:</label>
    <input type="text" name="position" id="position" value="${updateUser.position}" style="width: 200px">
    <br><br>

    <label for="salary">薪资:</label>
    <input type="text" name="salary" id="salary" value="${updateUser.salary}" style="width: 200px">
    <br><br>

    <div>
        部门:
        &nbsp;
        <select id="department" name="department" style="width: 200px">
            <option value="未选择">------------未选择------------</option>
        </select>
    </div>

    <br>

    <div>
        权限:
        &nbsp;
        <select id="perm" name="perm" style="width: 200px">
            <option value="未选择">------------未选择------------</option>
            <option value="默认">------------默认------------</option>
        </select>
    </div>


    <br><br>
    <div id="div1" style="width: 100%;color: red;font-size:18px;"></div>
    <br>

    <input type="button" id="updateButton" onclick="updateUser()" value="更新">
    <input type="reset" value="重置">
    <br>
    <input type="button" value="取消" onclick="window.history.back(-1); ">
</form>

</body>
</html>
