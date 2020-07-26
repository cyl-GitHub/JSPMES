function changePassword() {
    $.ajax({
        url: "/user/changePassword",
        dataType: "json",
        async: false,
        type: "POST",
        contentType: "application/x-www-form-urlencoded",
        //向后端传输的数据
        data: {
            password: $('#password').val(),
            newPassword: $("#newPassword").val()
        },
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                $("#result").html("密码修改成功");
                $(" #password").val("");
                $(" #newPassword").val("");

            } else if (data.result == "原密码错误") {
                $("#result").html("原密码错误");
                $(" #password").val("");
                $(" #newPassword").val("");
            }
        },
        //处理失败返回的数据
        error: function (data) {
        }
    })
}






