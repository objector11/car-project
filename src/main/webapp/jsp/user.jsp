<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ytuln
  Date: 2018/4/1
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户页面</title>
    <link rel="shortcut icon" type="image/x-icon" href="../skins/images/car.ico" media="screen" />
    <link rel="stylesheet" type="text/css" href="../skins/css/public/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/dialog.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/autocomplete.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/validform.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/header.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/footer.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/user.css">
</head>
<body>
<%--顶部嵌入顶部信息栏--%>
<jsp:include page="public/header.jsp"></jsp:include>
<%--用户页面，展示用户的相关信息--%>
<%--包括个人基本信息，历史订单等--%>
    <div class="content">

    </div>

<%--底部嵌入底部信息栏--%>
<jsp:include page="public/footer.jsp"></jsp:include>

<%-- 用户模板 --%>
<script type="text/html" id="userResult">
    <div class="userImage">
        <img src="../skins/images/{{userResult.baseInfo.userImage}}" class="img-thumbnail user-image-show" alt="用户头像" title="用户头像"><br>
        <input type="file" class="user-image-upload" style="display:none" onchange="getImgURL(this)" name="userImage">
        <button class="btn btn-primary changeImage">更换头像</button>
        <button class="btn btn-primary save-image"><i class="glyphicon glyphicon-ok"></i>保存</button>
    </div>
    <div class="baseInfo">
        <button class="btn btn-default edit"><i class="glyphicon glyphicon-edit"></i>编辑</button>
        <button class="btn btn-default save"><i class="glyphicon glyphicon-ok"></i>保存</button>
        <form class="userName-form">
            <table class="table table-bordered">
                <tr>
                    <td>用户昵称：</td>
                    <td>
                        <input type="text" class="bottomLine user-name-edit" value="{{userResult.baseInfo.userName}}" readonly>
                    </td>
                </tr>
            </table>
        </form>
        <button type="button" class="btn btn-default change-password">修改密码</button>
        <form class="password-form" onsubmit="return false">
            <table class="table">
                <tr>
                    <td>请输入密码：</td>
                    <td><input type="password" class="password" placeholder="请输入密码" datatype="password"></td>
                </tr>
                <tr>
                    <td>请输入新密码：</td>
                    <td><input type="password" placeholder="请输入新密码" class="newPassword" name="newPassword" datatype="*6-16"></td>
                </tr>
                <tr>
                    <td>请重复输入密码：</td>
                    <td><input type="password" placeholder="请重复输入密码" datatype="*" recheck="newPassword"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="button" class="btn btn-primary upload-password">确定</button>
                        <button type="reset" class="btn btn-default cancel">取消</button>
                    </td>
                </tr>

            </table>
        </form>
    </div>
    <div class="more-info">
        <h3>更多个人信息</h3>
        <table class="table table-bordered">
            <tr>
                <td>登录账号：</td>
                <td>
                    <input type="text" class="bottomLine user-count" value="{{userResult.baseInfo.userCount}}" readonly>
                </td>
            </tr>
            <tr>
                <td>用户邮箱：</td>
                <td>
                    <input type="text" class="bottomLine" value="{{userResult.baseInfo.userEmail}}" readonly>
                </td>
            </tr>
            <tr>
                <td>注册时间：</td>
                <td><input type="text" class="bottomLine" value="{{userResult.baseInfo.userRegistration}}" readonly></td>
            </tr>
            <tr>
                <td>租赁次数：</td>
                <td><input type="text" class="bottomLine" value="{{userResult.baseInfo.rentCount}}" readonly></td>
            </tr>
        </table>
        {{if userResult.orders}}
        <div class="history-rent">
            <h3>租赁记录</h3>
            <table class="table table-bordered">
                <tr>
                    <th>车辆名称</th>
                    <th>商家名称</th>
                    <th>租赁时间</th>
                </tr>
                {{each userResult.orders as order }}
                <tr>
                    <td><a href="detail.jsp?carId={{order.carId}}">{{order.carBrand}}  {{order.carName}}</a></td>
                    <td><a href="detail.jsp?shopId={{order.shopId}}">{{order.shopName}}</a></td>
                    <td>{{order.orderTime}}</td>
                </tr>
                {{/each}}
            </table>

        </div>
        {{/if}}
    </div>
</script>

<%-- 管理员模板 --%>
<script type="text/html" id="adminResult">
    <%-- 首先是个人基本信息 --%>
    <div class="baseInfo-div">
        <div class="userImage">
            <img src="../skins/images/{{adminResult.baseInfo.userImage}}" class="img-thumbnail user-image-show" alt="用户头像" title="用户头像"><br>
            <input type="file" class="user-image-upload" style="display:none" onchange="getImgURL(this)" name="userImage">
            <button class="btn btn-primary changeImage">更换头像</button>
            <button class="btn btn-default save-image"><i class="glyphicon glyphicon-ok"></i>保存</button>
        </div>
        <div class="baseInfo">
            <button class="btn btn-default edit"><i class="glyphicon glyphicon-edit"></i>编辑</button>
            <button class="btn btn-default save"><i class="glyphicon glyphicon-ok"></i>保存</button>
            <form class="userName-form">
                <table class="table">
                    <tr>
                        <td>用户昵称：</td>
                        <td><input type="text" class="bottomLine user-name-edit" value="{{adminResult.baseInfo.userName}}" readonly></td>
                    </tr>
                </table>
            </form>
            <button type="button" class="btn btn-default change-password">修改密码</button>
            <form class="password-form" onsubmit="return false">
                <table class="table">
                    <tr>
                        <td>请输入密码：</td>
                        <td><input type="password" class="password" placeholder="请输入密码" datatype="password"></td>
                    </tr>
                    <tr>
                        <td>请输入新密码：</td>
                        <td><input type="password" placeholder="请输入新密码" class="newPassword" name="newPassword" datatype="*6-16"></td>
                    </tr>
                    <tr>
                        <td>请重复输入密码：</td>
                        <td><input type="password" placeholder="请重复输入密码" datatype="*" recheck="newPassword"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="btn btn-primary upload-password">确定</button>
                            <button type="reset" class="btn btn-default cancel">取消</button>
                        </td>
                    </tr>

                </table>
            </form>
        </div>
    </div>
    <div class="more-info">
        <h3>更多个人信息</h3>
        <table class="table table-bordered">
            <tr>
                <td>登录账号：</td>
                <td>
                    <input type="text" class="bottomLine user-count" value="{{adminResult.baseInfo.userCount}}" readonly>
                </td>
            </tr>
            <tr>
                <td>用户邮箱：</td>
                <td>
                    <input type="text" class="bottomLine" value="{{adminResult.baseInfo.userEmail}}" readonly>
                </td>
            </tr>
            <tr>
                <td>注册时间：</td>
                <td><input type="text" class="bottomLine" value="{{adminResult.baseInfo.userRegistration}}" readonly></td>
            </tr>
        </table>
    </div>
    <a href="car.jsp" class="btn btn-primary upload-car">上传车辆</a>
    <%-- 我更改过的车辆信息，以表格显示，加多选框，可实现删除。名称为超链接点击进入car.jsp并传参车辆id --%>
    <div class="car-info-list">
        <span class="title">我上传过的车辆</span>
        <button class="btn btn-danger delete">删除</button>
        <table class="table table-bordered">
            <tr>
                <th>删除</th>
                <th>品牌</th>
                <th>名称</th>
                <th>价格</th>
                <th>剩余数量</th>
                <th>载人数</th>
                <th>载货量</th>
                <th>车辆介绍</th>
            </tr>
            {{each adminResult.carList as carInfo}}
            <tr>
                <td><input type="checkbox" value="{{carInfo.carId}}" name="car"></td>
                <td>{{carInfo.carBrand}}</td>
                <td><a href="car.jsp?carId={{carInfo.carId}}">{{carInfo.carName}}</a></td>
                <td>{{carInfo.carPrice}}</td>
                <td>{{carInfo.carAmount}}</td>
                <td>{{carInfo.carPeople}}</td>
                <td>{{carInfo.carGood}}</td>
                <td>{{carInfo.carInfo}}</td>
            </tr>
            {{/each}}
        </table>
    </div>
</script>

<%-- 超级管理员模板 --%>
<script type="text/html" id="superAdminResult">
    <%-- 设置管理员， --%>
    <div class="set-admin-div">
        <p class="set-title">设置管理员</p>
        <div class="input-admin-div">
            <input type="text" class="input-admin" id="input-admin" placeholder="请输入要设置的管理员账号">
        </div>
        <div class="input-shop-div">
            <input type="text" class="input-shop" id="input-shop" placeholder="请输入商家名称">
        </div>
        <button class="btn btn-default set-admin"><i class="glyphicon glyphicon-wrench"></i>设置</button>
        <p class="set-title">管理员列表</p>
        <button class="btn btn-danger delete-admin">删除管理员</button>
        <table class="table table-bordered admin-list">
            <tr>
                <th>删除</th>
                <th>用户名称</th>
                <th>用户账号</th>
                <th>商家名称</th>
                <th>创建时间</th>
            </tr>
        {{each superAdminResult.shopList as shop }}
            {{each shop.adminList as admin}}
                <tr>
                    <td>
                        <input type="checkbox" value="{{admin.userId}}" name="admin">
                    </td>
                    <td>
                        <img src="<%=request.getContextPath()%>/skins/images/{{admin.userImage}}">
                        {{admin.userName}}
                    </td>
                    <td>
                        {{admin.userCount}}
                    </td>
                    <td>
                        {{admin.shopName}}
                    </td>
                    <td>
                        {{admin.userTime}}
                    </td>
                </tr>
            {{/each}}
        {{/each}}
        </table>
    </div>

    <%-- 新建商家，查询商家，删除商家，更新商家 --%>
    <div class="shop-message">
        <a href="shop.jsp" class="btn btn-primary add-shop">新建商家</a>
        <p class="title">商家列表</p>
        <button class="btn btn-danger delete">删除</button>
        <table class="table table-bordered">
            <tr>
                <th>删除</th>
                <th>商家名称</th>
                <th>商家位置</th>
                <th>商家电话</th>
            </tr>
            {{each superAdminResult.shopList as shop }}
            <tr>
                <td><input type="checkbox" value="{{shop.shopId}}" name="shop"></td>
                <td><a href="shop.jsp?shopId={{shop.shopId}}">{{shop.shopName}}</a></td>
                <td>{{shop.shopLocation}}</td>
                <td>{{shop.shopPhone}}</td>
            </tr>
            {{/each}}
        </table>
    </div>
    <%-- 上传车辆，查询车辆，删除车辆，更新车辆 --%>
    <div class="car-message">
        <a href="car.jsp" class="btn btn-primary add-car">上传车辆</a>
    </div>

</script>

</body>

<script type="text/javascript">
    var imgurl = "";

    function getImgURL(node) {
        var imgURL = "";
        try{
            var file = null;
            if(node.files && node.files[0] ){
                file = node.files[0];
            }else if(node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
            //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
            try{
                //Firefox7.0
                imgURL =  file.getAsDataURL();
                //alert("//Firefox7.0"+imgRUL);
            }catch(e){
                //Firefox8.0以上
                imgRUL = window.URL.createObjectURL(file);
                //alert("//Firefox8.0以上"+imgRUL);
            }
        }catch(e){      //这里不知道怎么处理了，如果是遨游的话会报这个异常
            //支持html5的浏览器,比如高版本的firefox、chrome、ie10
            if (node.files && node.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgURL = e.target.result;
                };
                reader.readAsDataURL(node.files[0]);
            }
        }
        //imgurl = imgURL;
        creatImg(imgRUL);
        return imgURL;
    }

    function creatImg(imgRUL){   //根据指定URL创建一个Img对象
       /* var textHtml = "<img src='"+imgRUL+"'/>";
        $(".userImage").prepend(textHtml);*/
        $(".user-image-show").attr({ src: imgRUL });
    }
</script>

<script type="text/javascript">
    var context = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="../skins/js/public/jquery.js"></script>
<script type="text/javascript" src="../skins/js/public/bootstrap.js"></script>
<script type="text/javascript" src="../skins/js/public/public.js"></script>
<script type="text/javascript" src="../skins/js/public/header.js"></script>
<script type="text/javascript" src="../skins/js/public/arttemplate.js"></script>
<script type="text/javascript" src="../skins/js/public/autocomplete.js"></script>
<script type="text/javascript" src="../skins/js/public/Validform.js"></script>
<script type="text/javascript" src="../skins/js/public/dialog.js"></script>
<script type="text/javascript" src="../skins/js/user.js"></script>
</html>
