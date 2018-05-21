$(function () {
    onLoad();
    $(".edit,.save").click(editBaseInfo);

    $(".delete").click(deleteMessage);

    $(".set-admin").click(setAdmin);

    $(".input-admin").on("keyup", function (e) {
        var keyword =$(this).val();
        if(keyword){
            setTimeout(function () {
                $.ajax({
                    url: context + "/service/user/autoComplete",
                    type: 'GET',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    data:{"keyword":keyword},
                    success: function (data) {
                        if (!data.length > 0) {

                        }else {
                            $("#input-admin").AutoComplete({
                                'data': data,
                                "maxItems": 15,
                                'listStyle': 'custom',
                                'width': 300,
                                'itemHeight':26,
                                'createItemHandler': function(index, data){
                                    var div = $("<div></div>");
                                    $("<p class='user-count'><img src="+context+"/skins/images/"+data.image+">"+data.value+"</p><p>注册时间："+data.time+"</p>").appendTo(div);
                                    return div;
                                }
                            }).AutoComplete('show');
                        }
                    },
                    error:function () {
                        alert("error");
                    }
                });
            }, 800)
        }
    })

    $(".input-shop").on("keyup", function (e) {
        var keyword =$(this).val();
        if(keyword){
            setTimeout(function () {
                $.ajax({
                    url: context + "/service/shop/autoComplete",
                    type: 'GET',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    data:{"keyword":keyword},
                    success: function (data) {
                        if (!data.length > 0) {

                        }else {
                            $("#input-shop").AutoComplete({
                                'data': data,
                                "maxItems": 15,
                                'listStyle': 'custom',
                                'width': 300,
                                'itemHeight':26,
                                'createItemHandler': function(index, data){
                                    var div = $("<div></div>");
                                        $("<span class='shop-name'>"+data.value+"</span>").appendTo(div);
                                    return div;
                                }
                            }).AutoComplete('show');
                        }
                    },
                    error:function () {
                        alert("error");
                    }
                });
            }, 800)
        }
    });

    $(".changeImage").click(function () {
        $(".save-image").show();
        $(".user-image-upload").click();
    });

    $(".save-image").click(function () {
        var file = $(".user-image-upload")[0].files,
            fileName = file[0].name,
            fileType = getExpandedName(fileName);
        if(checkType(fileType)){
            $(this).hide();
            uploadImage(file[0]);
        }else {
            alert("类型错误");
        }
    });

    $(".delete-admin").click(deleteAdmin);

    $(".change-password").click(function () {
        $(".password-form").show();
    });

    $(".cancel").click(function () {
        $(".password-form").hide();
    });

    $(".password-form").Validform({
        btnSubmit:".upload-password",
        tiptype:3,
        showAllError:true,
        datatype:{
            //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
            //后台查询账户是否存在,这里不查询密码，将密码查询放到后台这样安全
            "password":function(gets,obj,curform,regxp){
                var userCount=$(".user-count").val();
                var password=$(".password").val();
                var res=false;
                if(password){
                    $.ajax({
                        url: context + "/service/user/checkPassword",
                        type: 'get',
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        data:{"userCount":userCount,"password":password},
                        success: function (data) {
                            if(data.status==="y"){
                                res=data.status==='y'
                            }
                        },
                        error:function () {
                            alert("error");
                        }

                    });
                }
                return res;
            }
        },
        beforeSubmit:function(curform){
            //在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
            //这里明确return false的话表单将不会提交;
            $(".upload-password").attr({ disabled: "disabled" });
        },
        callback:function(data){
            //修改密码
            var userId=getCookie("userId");
            var password=$(".newPassword").val();
            $.ajax({
                url: context + "/service/user/updatePassword",
                type: 'POST',
                async: false,
                data:{"userId":userId,"userPassword":password},
                success: function (data) {
                    //密码完成修改，跳转到登录页面，重新登录
                    alert("修改成功，请重新登录");
                    clearAllCookie();
                    window.location.href= context + "/jsp/login.jsp";
                },
                error:function () {
                    alert("error");
                }
            });

        }
    });

    $(".save").click(saveName);

});


function saveName() {
    var userId=getCookie("userId");
    var userName=$(".user-name-edit").val();
    $.ajax({
        url: context + "/service/user/updateName",
        type: 'GET',
        async: false,
        contentType: "application/json;charset=utf-8",
        data:{"userId":userId,"userName":userName},
        success: function (data) {
            setCookie("userName",userName);
            $(".header-user-name").text(userName);
        },
        error: function () {
            alert("error");
        }
    });
}

function uploadImage(file) {
    var form_data = new FormData();
    var userId=getCookie("userId");
    form_data.append("userId",userId);
    form_data.append("userImage",file);
    $.ajax({
        type: 'POST',
        url: context + "/service/user/saveUserImage",
        async: false,
        processData: false,
        contentType: false,
        data:form_data,
        success:function (data) {
            setCookie("userImage",data);
            $(".user-image").attr({ src: context+"/skins/images/"+getCookie("userImage")});
        },
        error:function (data) {
            alert("error");
        }
    });
}

//判断是否带参，然后ajax通过用户id查询该用户
function onLoad() {
    var url = window.location.href;
    var params = url.indexOf("?");
    //是否带参
    if (!(params == -1)) {
        var id = url.substring(params + 1);
        //ajax,success返回调用checkAdmin();
        $.ajax({
            url: context + "/service/user/id",
            type: 'GET',
            async: false,
            contentType: "application/json;charset=utf-8",
            data:id,
            success: function (data) {
                checkAdmin(data);
            },
            error: function () {
                alert("error");
            }
        });
    }else {
        $(".content").empty().html("<h4>输入参数不完整，请重试！</h4>");
    }
}

//通过cookie检查用户是否为管理员
function checkAdmin(data) {
    var isAdmin = getCookie("isAdmin");
    if(isAdmin == "0"){
        //不是管理员，只能修改自己信息
        var temp = template("userResult", {
            "userResult": data
        });
        $(".content").empty().append(temp);
    }else if(isAdmin == "1"){
        //是管理员，可以增删改车辆，修改自己信息。
        var temp = template("adminResult", {
            "adminResult": data
        });
        $(".content").empty().append(temp);
    }else if(isAdmin == "2"){
        //超级管理员，可以新建商家，增删改商家，增删改车辆，设置管理员
        var temp = template("superAdminResult", {
            "superAdminResult": data
        });
        $(".content").empty().append(temp);
    }
}

function editBaseInfo() {
    var editStatus =$(".edit").is(":hidden");
    if(editStatus){
        $(".userName-form input").attr("readonly","readonly");
        $(".userName-form input").removeClass("input-border");
        $(".save").hide();
        $(".edit").show();
    }else {
        $(".userName-form input").removeAttr("readonly");
        $(".userName-form input").addClass("input-border");
        $(".save").show();
        $(".edit").hide();
    }

}


function deleteAdmin() {
    var checkAdmin = $("input[name='admin']");
    var checkBoxValue = "";
    var SelectFalse=false;
    for(var i = 0; i < checkAdmin.length; i++) {
        if(checkAdmin[i].checked)//如果有1个被选中时
        {
            SelectFalse = true;
            checkBoxValue += checkAdmin[i].value+",";
        }
    }
    var data = checkBoxValue.substring(0,checkBoxValue.length-1);
    if(!SelectFalse) {
        alert("未选择！");
    }else {
        alertMessage("删除管理员？","删除管理员会删除管理员下的所以车辆！","user",data)
    }
}

function deleteMessage() {
    var checkShops = $("input[name='shop']");
    var checkCars = $("input[name='car']");
    var checkBoxValue = "";
    var SelectFalse=false;
    for(var i = 0; i < checkShops.length; i++) {
        if(checkShops[i].checked)//如果有1个被选中时
        {
            SelectFalse = true;
            checkBoxValue += checkShops[i].value+",";
        }
    }
    for (var j=0;j<checkCars.length;j++){
        if(checkCars[j].checked)//如果有1个被选中时
        {
            SelectFalse = true;
            checkBoxValue +=checkCars[j].value+","
        }
    }
    var data = checkBoxValue.substring(0,checkBoxValue.length-1);
    if(!SelectFalse) {
        alert("未选择！");
    }else {
        if(checkShops.length>0){
            alertMessage("删除商家？","删除商家将删除商家下的所有车辆！","shop",data)
        }else if(checkCars.length>0){
            alertMessage("确定删除？","确定删除车辆？","car",data)
        }
    }
}

function alertMessage(title,content,type,data) {
    var d = dialog({
        title:title,
        content: content,
        okValue: '确定',
        ok: function () {
            deleteAjax(type,data);
        },
        cancelValue: '取消',
        cancel: function () {}
    });
    d.show();
}

function deleteAjax(type,data) {
    $.ajax({
        url: context + "/service/"+type+"/delete",
        type: 'GET',
        contentType: "application/json;charset=utf-8",
        data:{"ids":data},
        success: function (data) {
            var d = dialog({
                content: "成功删除！",
                okValue: '确定',
                ok: function () {
                    location.reload();
                },
                cancelValue: '回到首页',
                cancel: function () {
                    window.location.href = context +"/jsp/index.jsp";
                }
            });
            d.show();
        },
        error: function () {
            alert("error");
        }
    });
}

function setAdmin() {
    var userCount = $(".input-admin").val();
    var shopName = $(".input-shop").val();
    if(userCount&&shopName){
        $.ajax({
            type: 'GET',
            url: context + "/service/user/setAdmin",
            contentType: "application/json;charset=utf-8",
            async:false,
            dataType: "JSON",
            data: {"userCount":userCount,"shopName":shopName},
            success: function (data) {
                var status = data.status;
                var info = data.info;
                if(status == 'n'){
                    var d = dialog({
                        title:"创建失败！",
                        content: info
                    });
                    d.show();
                }else if(status == 'y'){
                    var d = dialog({
                        title:"创建成功！",
                        content: info,
                        okValue: '确定',
                        ok: function () {
                            location.reload();
                        },
                        cancelValue: '回到首页',
                        cancel: function () {
                            window.location.href = context +"/jsp/index.jsp";
                        }
                    });
                    d.show();
                }
            },
            error:function (data) {
                alert("error");
            }
        });
    }
}

