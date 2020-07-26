function addMaterialNumber() {
    $.ajax({
        url: "/material/doAddMaterialNumber", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            id: $("#mId").val(),
            count: $("#count").val()
        }),
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                window.location.href = '/material/selectAllMaterials';
            } else if (data.result == "数据不可为空或0") {
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


