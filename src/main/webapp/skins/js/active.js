$(function () {
    var url = window.location.href;
    var params = url.indexOf("?");
    //是否带参
    if (!(params == -1)) {
        var userId = url.substring(params + 1);
        $.ajax({
            url: context + "/service/user/active",
            type: 'GET',
            async: false,
            data:userId,
            success: function (data) {
                if("n"===data.status){
                    $(".content").empty().html(data.info);
                }else if("y"===data.status){
                    $(".content").empty().html(data.info);
                    setTimeout(function () {
                        window.location.href= context +"/jsp/login.jsp";
                    },3000);
                }
            },
            error: function () {
                alert("error");

            }
        });
    }else {
        $(".content").text("输入参数不正确，请重试");
    }});