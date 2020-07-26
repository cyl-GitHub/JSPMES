function login() {
    $.ajax({
        url: "/admin/adminDoLogin", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            name: $("#name").val(),
            password: $("#password").val(),
            code: $("#code").val()
        }),
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                window.location.href = '/admin/totalPage';
            } else if (data.result == "管理员信息错误") {
                changeImg();
                $("#divId").html("");
                $("#divAll").html("");
                $("#divUser").html(data.result);
            } else if (data.result == "验证码错误") {
                changeImg();
                $("#divUser").html("");
                $("#divId").html("");
                $("#divAll").html(data.result);
            } else {
                changeImg();
                $("#divUser").html("");
                $("#divId").html("");
                $("#divAll").html(data.result);
            }
        },
        //处理失败返回的数据
        error: function (data) {
            changeImg();
            $("#divAll").html(data.result);
        }
    })
}


function KeyDown() {
    if (event.keyCode == 13) {
        var btn_login = document.getElementById("user-btn1");//id为登录按钮id
        btn_login.focus();
        btn_login.click();
    }
}






