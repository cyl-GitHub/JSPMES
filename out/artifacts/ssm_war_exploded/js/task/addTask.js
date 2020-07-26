function addTask() {
    $.ajax({
        url: "/task/doAddTask", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            tName: $("#tName").val(),
            machineNum: $("#machineNum").val()
        }),
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                $("#div1").html("创建成功");
                window.location.href = '/task/selectAllTasks';
            } else if (data.result == "信息不可为空") {
                $("#div1").html(data.result);
            } else {
                $("#div1").html(data.result);
            }
        },
        //处理失败返回的数据
        error: function (data) {
            changeImg();
            $("#divAll").html(data.result);
        }
    })
}
