$(function () {

    checkAdmin();

    $(".edit,.save").click(editBaseInfo);

    $(".shop-message").Validform({
        btnSubmit:".submit",
        tiptype:3,
        showAllError:true,
        beforeSubmit:function(curform){
            $(".submit").attr({ disabled: "disabled" });
        },
        callback:function(data){
            var url = window.location.href;
            var params = url.indexOf("?");
            //判断是编辑还是上传
            //编辑
            if (!(params === -1)) {
                var canshu = url.substring(params + 1);
                var index = canshu.indexOf("=");
                if (index !== -1) {
                    var param = canshu.substring(0, index);
                    //参数id
                    var id = canshu.substring(index + 1);
                    update(id);
                }
            }
            //新建
            else {
                insertShop();
            }
        }
    });
});

//
function insertShop() {
    var d = dialog({
        title:'创建成功',
        content: '该商家已成功创建！',
        okValue: '回到首页',
        ok: function () {
            window.location.href = context +"/jsp/index.jsp";
        },
        cancelValue: '继续创建',
        cancel: function () {
            location.reload();
        }
    });
    d.show();
    $.ajax({
        type: 'POST',
        url: context + "/service/shop/insert",
        async:false,
        data:$(".shop-message").serialize(),
        success: function (data) {
        },
        error: function () {
            alert("error");
        }
    });
}

function update(shopId) {
    $(".shop-message").append("<input type='text' name='shopId' value='"+shopId+"' style='display: none'>");
    $.ajax({
        type: 'POST',
        url: context + "/service/shop/update",
        async:false,
        data:$(".shop-message").serialize(),
        success: function (data) {
            var d = dialog({
                title:'修改成功',
                content: '该商家已成功修改！',
                okValue: '回到首页',
                ok: function () {
                    window.location.href = context +"/jsp/index.jsp";
                },
                cancelValue: '继续上传',
                cancel: function () {
                    location.reload();
                }
            });
            d.show();
        },
        error: function () {
            alert("error");
        }
    });
}

//检查是否为超级管理员
function checkAdmin() {
    var isAdmin =  getCookie("isAdmin");
    if (isAdmin == 2){
        checkEdit();
    }else {
        $(".content").empty().text("您没有该权限");
    }
}

//检查是否为编辑商家

function checkEdit() {
    var url = window.location.href;
    var params = url.indexOf("?");
    //是否带参
    if (!(params === -1)) {
        var canshu = url.substring(params + 1);
        var index = canshu.indexOf("=");
        if (index !== -1) {
            var param = canshu.substring(0, index);
            //参数id
            var id = canshu.substring(index + 1);
            if (param === "shopId") {
                $.ajax({
                    url: context + "/service/shop/id",
                    type: 'GET',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    data:{"id":id},
                    success: function (data) {
                        var info =data.info;
                        var temp = template("shopResult", {
                            "shopResult": info
                        });
                        $(".content").empty().append(temp);
                    }
                })
            }

        }
    }
}

function editBaseInfo() {

    var editStatus =$(".edit").is(":hidden");
    if(editStatus){
        $(".shop-message input").attr("readonly","readonly");
        $(".shop-message input").removeClass("input-border");
        $(".save").hide();
        $(".edit").show();
    }else {
        $(".shop-message input").removeAttr("readonly");
        $(".shop-message input").addClass("input-border");
        $(".save").show();
        $(".edit").hide();
    }

}
