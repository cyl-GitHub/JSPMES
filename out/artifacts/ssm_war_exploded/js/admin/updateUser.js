function updateUser() {
    var obj;

    obj = new FormData();

    obj.append("name", $("#name").val());
    obj.append("position", $("#position").val());
    obj.append("salary", $("#salary").val());
    obj.append("department", $("#department option:selected").val());
    obj.append("perm", $("#perm option:selected").val());

    $.ajax({
        url: "/user/doUpdateUser",
        dataType: "json",
        type: "POST",
        contentType: false,
        //向后端传输的数据
        cache: false,
        data: obj,
        processData: false,

        //处理后端返回的数据
        success: function (data) {
            if (data.result == "信息不可为空,请检查后重新提交!") {
                $("#div2").html("");
                $("#div1").html(data.result);
            } else {
                alert("更新成功");
                window.location.href = "/user/selectAllUsers";
            }
        },
        //处理失败返回的数据
        error: function (data) {
            alert("插入失败");
        }
    });
}


window.onload = function () {
    selectDepartment();
}

function selectDepartment() {
    $.ajax({
        url: "/department/selectAllDepartment", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            id: 1
        }),
        //处理后端返回的数据
        success: function (data) {
            var count = data.departments.length;
            if (count == 0) {
                $("#department").html("<option value=\"未选择\">------------未选择------------</option>");
            } else {
                for (var i = 0; i < count; i++) {
                    $("#department").append("<option  value=\"" + data.departments[i].dName + "\">" + data.departments[i].dName + "</option>");
                }
            }

        },
        //处理失败返回的数据
        error: function (data) {
        }
    })

}
