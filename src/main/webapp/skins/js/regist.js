$(function(){
    $.idcode.setCode();
	$(".registform").Validform({
        btnSubmit:"#regist-submit",
		tiptype:2,
        showAllError:true,
        datatype:{
            "username":function(gets,obj,curform,regxp){
                //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
                var reg1=/^[a-zA-z]{1,}/;     
                if(reg1.test(gets)){return true;}
                return false;
            },
            "idcode":function(gets,obj,curform,regxp){
                var IsBy = $.idcode.validateCode();
                if (IsBy==true) {
                    return true;
                }
                return false;    
            }
        },
        beforeSubmit:function(curform){
            //在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
            //这里明确return false的话表单将不会提交;
            $("#regist-submit").attr({ disabled: "disabled" });
        },
        callback:function(data){
            var d = dialog({
                title:'注册成功',
                content: '请前往邮箱进行激活！',
                okValue: '确定',
                ok: function () {
                    window.location.href = context +"/jsp/login.jsp";
                },
                cancelValue: '取消',
                cancel: function () {}
            });
            d.show();
            $.ajax({
                type: 'POST',
                url: context + "/service/user/insert",
                async:true,
                data:$(".registform").serialize(),
                success: function (data) {
                },
                error: function () {
                    console.log("error");
                }
            });
        }
	});

    //输入框得到焦点清空
    $(".registform input").focus(function(){
        $(this).val("");
    });

    $("#regist-submit").click(function () {

    })
});