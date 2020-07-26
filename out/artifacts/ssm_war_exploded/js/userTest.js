function gotoExam(id) {
    var keyV = "";
    var key = document.getElementsByName("rad");
    for (var i in key) {
        if (key[i].checked) {
            keyV = keyV + key[i].value;
        }
    }

    $.ajax({
        url: "/title/getTitle",
        dataType: "json",
        type: "POST",
        contentType: 'application/x-www-form-urlencoded',
        //向后端传输的数据
        data: {
            id1: id,
            id: $("#qid").val(),
            key: keyV,
        },
        //处理后端返回的数据
        success: function (data) {

            $("#qid").attr('value', data.qid);

            $('input[type=radio][name="rad"]:checked').attr("checked", false);
            $('input[type=checkbox][name="rad"]:checked').attr("checked", false);

            if (data.qid == 1) {
                $("#last").attr("style", "display:none;");
            } else {
                $("#last").attr("style", "display:block;");
            }

            if (data.qid == 50) {
                $("#next").attr("style", "display:none;");
            } else {
                $("#next").attr("style", "display:block;");
            }

            if (data.title.multiple == 1) {
                $("#content").html(data.qid + "." + data.title.content + "(多选)");
                $("#A").attr('type', 'checkbox');
                $("#B").attr('type', 'checkbox');
                $("#C").attr('type', 'checkbox');
                $("#D").attr('type', 'checkbox');
            } else if (data.title.multiple == 0) {
                $("#content").html(data.qid + "." + data.title.content + "(单选)");
                $("#A").attr('type', 'radio');
                $("#B").attr('type', 'radio');
                $("#C").attr('type', 'radio');
                $("#D").attr('type', 'radio');
            }


            $("#kA").html("A." + data.title.key1);
            $("#kB").html("B." + data.title.key2);
            if (data.title.key3 != null && data.title.key3 != '') {

                $("#dC").attr("style", "display:block;");
                $("#kC").html("C." + data.title.key3);
            } else {
                $("#dC").attr("style", "display:none;");
            }
            if (data.title.key4 != null && data.title.key4 != '') {
                $("#dD").attr("style", "display:block;");
                $("#kD").html("D." + data.title.key4);
            } else {
                $("#dD").attr("style", "display:none;");
            }

            if (data.title.picture != null && data.title.picture != '') {
                $("#pic").attr("style", "display:block;");
                $("#pic").attr("src", data.title.picture);
            } else {
                $("#pic").attr("style", "display:none;");
            }

        },
        //处理失败返回的数据
        error: function (data) {

        }
    })
}


// function change(ud) {
//
//     var keyV = "";
//     var key = document.getElementsByName("rad");
//     for (var i in key) {
//         if (key[i].checked) {
//             keyV = keyV + key[i].value;
//         }
//     }
//
//     $.ajax({
//         url: "/title/change",
//         dataType: "json",
//         type: "POST",
//         contentType: 'application/x-www-form-urlencoded',
//         //向后端传输的数据
//         data: {
//             id: $("#qid").val(),
//             key: keyV,
//             ud: ud
//         },
//         //处理后端返回的数据
//         success: function (data) {
//             var i = "EOV" + $("#qid").val();
//             document.getElementById(i).style.background = "#2aabd2";
//             $("#qid").attr('value', data.qid);
//             $('input[type=radio][name="rad"]:checked').attr("checked", false);
//             $('input[type=checkbox][name="rad"]:checked').attr("checked", false);
//
//             if (data.qid == 1) {
//                 $("#last").attr("style", "display:none;");
//             } else {
//                 $("#last").attr("style", "display:block;");
//             }
//             if (data.qid == 50) {
//                 $("#next").attr("style", "display:none;");
//             } else {
//                 $("#next").attr("style", "display:block;");
//             }
//
//             if (data.title.multiple == 1) {
//                 $("#content").html(data.qid + "." + data.title.content + "(多选)");
//                 $("#A").attr('type', 'checkbox');
//                 $("#B").attr('type', 'checkbox');
//                 $("#C").attr('type', 'checkbox');
//                 $("#D").attr('type', 'checkbox');
//
//             } else if (data.title.multiple == 0) {
//                 $("#content").html(data.qid + "." + data.title.content + "(单选)");
//                 $("#A").attr('type', 'radio');
//                 $("#B").attr('type', 'radio');
//                 $("#C").attr('type', 'radio');
//                 $("#D").attr('type', 'radio');
//             }
//
//
//             $("#kA").html("A." + data.title.key1);
//             $("#kB").html("B." + data.title.key2);
//             if (data.title.key3 != null && data.title.key3 != '') {
//
//                 $("#dC").attr("style", "display:block;");
//                 $("#kC").html("C." + data.title.key3);
//             } else {
//                 $("#dC").attr("style", "display:none;");
//             }
//             if (data.title.key4 != null && data.title.key4 != '') {
//                 $("#dD").attr("style", "display:block;");
//                 $("#kD").html("D." + data.title.key4);
//             } else {
//                 $("#dD").attr("style", "display:none;");
//             }
//
//             if (data.title.picture != null && data.title.picture != '') {
//                 $("#pic").attr("style", "display:block;");
//                 $("#pic").attr("src", data.title.picture);
//             } else {
//                 $("#pic").attr("style", "display:none;");
//             }
//         },
//         //处理失败返回的数据
//         error: function (data) {
//
//         }
//     })
//
// }


function close1(ud) {
    var keyV = "";
    var key = document.getElementsByName("rad");
    for (var i in key) {
        if (key[i].checked) {
            keyV = keyV + key[i].value;
        }
    }

    $.ajax({
        url: "/title/change",
        dataType: "json",
        type: "POST",
        contentType: 'application/x-www-form-urlencoded',
        //向后端传输的数据
        data: {
            id: $("#qid").val(),
            key: keyV,
            ud: ud
        },
        //处理后端返回的数据
        success: function (data) {
            window.location.href = "/title/close";
        },
        //处理失败返回的数据
        error: function (data) {

        }
    })
}