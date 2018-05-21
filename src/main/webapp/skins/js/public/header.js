$(function () {
    judgeLogin();
    //注销操作
    $("#SignOut").click(function () {
        clearAllCookie();
        changeLogin();
    });

    $("#search").on("keyup", function (e) {
        var value =$(this).val();
        if(value){
            setTimeout(function () {
                var keyword =$("#search").val();
                $.ajax({
                    url: context + "/service/car/autoComplete",
                    type: 'GET',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    data:{"keyword":keyword},
                    success: function (data) {
                        if (!data.length > 0) {
                            var nonHint = $("<div class='none-hint'>找不到匹配项目</div>");
                            $("#search-div").append(nonHint).show();
                        }else {
                            $("#search").AutoComplete({
                                'data': data,
                                "maxItems": 15,
                                'listStyle': 'custom',
                                'width': 200,
                                'itemHeight':26,
                                'createItemHandler': function(index, data){
                                    var div = $("<div></div>");
                                    var type =data.type;
                                    if(type=="car"){
                                        $("<a href='"+context +"/jsp/detail.jsp?carId=" +data.id +"'>"
                                            +data.value+
                                            "</a>").appendTo(div);
                                    }else if(type=="shop"){
                                        $("<a href='"+context+"/jsp/detail.jsp?shopId=" +data.id +"'>"
                                            +data.value+
                                            "</a>").appendTo(div);
                                    }
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

});

//读取cookies，判断用户是否登录，登录后展示用户头像和昵称，点击后进入用户页面
function judgeLogin() {
  var userName =  getCookie("userName");
  var userId =  getCookie("userId");
  var userImage =  getCookie("userImage");
  if (userName != undefined && userName != null && userId!=undefined && userId!=null && userImage!=undefined && userImage!=null ){
      changeUser(userImage,userId,userName);
  }
}

//改变登录注册按钮，改成用户头像加昵称
//传参为用户头像和昵称
function changeUser(image,id , userName) {
    var content = "<a href="+context+"/jsp/user.jsp?userId="+id+"><img src="+context+"/skins/images/"+image+" class='user-image'><span class='header-user-name'>"+ userName +"</span></a>" +
                    "<a id='SignOut'>注销</a>";
    $(".login-regist").html(content);
};

//注销后，或者退出登录后
function changeLogin() {
   var content = "<a id=\"login\" href=\"login.jsp\" target=\"_self\">登录</a>\n" +
        "<a id=\"regist\" href=\"regist.jsp\" target=\"_self\">注册</a>";

    $(".login-regist").html(content);
    window.location.href= context +"/jsp/login.jsp";
}

