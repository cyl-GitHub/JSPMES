function avatar2() {
    var obj;
    obj = new FormData();
    obj.append("file", $('#avatar')[0].files[0]);

    $.ajax({
        url: "/user/doReplaceAvatar",
        dataType: "json",
        type: "POST",
        contentType: false,
        //向后端传输的数据
        cache: false,
        data: obj,
        processData: false,

        //处理后端返回的数据
        success: function (data) {
            if (data.result == "成功") {
                $("#tishi").html("注册成功,3s后跳转!");
                window.setTimeout("window.location.href = '/user/myInformation'", 3000);
            } else if (data.result == "未选择文件") {
                alert("未选择文件");
            }
        },
        //处理失败返回的数据
        error: function (data) {
            alert("插入失败");
        }
    });
}

$(function () {
    $("#avatar").change(function () {
        var $file = $(this);
        var fileObj = $file[0];
        var windowURL = window.URL || window.webkitURL;
        var dataURL;
        var $img = $("#avatar1");

        if (fileObj && fileObj.files && fileObj.files[0]) {
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $img.attr('src', dataURL);
        } else {
            dataURL = $file.val();
            var imgObj = document.getElementById("avatar1");
            // 两个坑:
            // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
            // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
            imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

        }
    });
});




