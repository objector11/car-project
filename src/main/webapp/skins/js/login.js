$(function(){
	//输入框得到焦点清空
	$(".loginform input").focus(function(){
		$(this).val("");
	});
	$.idcode.setCode();
    $(".loginform").Validform({
        btnSubmit:"#login-submit",       
        tiptype:2,
        showAllError:true,
        datatype:{
            //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
            //后台查询账户是否存在,这里不查询密码，将密码查询放到后台这样安全
            "idcode":function(gets,obj,curform,regxp){
                var IsBy = $.idcode.validateCode();
                if (IsBy==true) {
                    return true;
                }
                return false;    
            },
            "password":function(gets,obj,curform,regxp){
                var userCount=$(".userCount").val();
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
            $("#login-submit").attr({ disabled: "disabled" });
        },
        callback:function(data){
            //用户与管理员登录，后台校验等级 。然后根据等级跳转页面
            var userCount =$(".userCount").val();
            $.ajax({
                url: context + "/service/user/login",
                type: 'POST',
                async: false,
                data:{"userCount":userCount},
                success: function (data) {
                    var level = data.level;
                    if(level===0){
                        window.location.href= context +"/jsp/index.jsp";
                    }else if(level===1){
                        window.location.href= context +"/jsp/user.jsp?userId="+data.userId;;
                    }else if(level===2){
                        window.location.href= context +"/jsp/user.jsp?userId="+data.userId;
                    }
                    setCookie("userImage",data.userImage);
                    setCookie("userId",data.userId);
                    setCookie("userName",data.userName);
                    setCookie("isAdmin",data.level);
                },
                error: function () {
                    alert("error");
                }
            });
        }
    });
});

function setCookie(name,value,day){
    var exp　= new Date();
    exp.setTime(exp.getTime() + day*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()+"; path=/";
};
