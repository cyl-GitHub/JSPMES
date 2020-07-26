function addJop() {
    $.ajax({
        url: "/jop/doAddJop", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            tId: $("#tId").val(),
            ranking: $("#ranking").val()
        }),
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                window.location.href = '/jop/selectAllJops?tId=' + data.tId + '';
            } else if (data.result == "数据不可为空") {
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


