<%--
  Created by IntelliJ IDEA.
  User: ytuln
  Date: 2018/1/26
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link rel="shortcut icon" type="image/x-icon" href="../skins/images/car.ico" media="screen" />
    <link rel="stylesheet" type="text/css" href="../skins/css/public/bootstrap.css">
    <link rel="stylesheet" href="../skins/css/public/validform.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="../skins/css/public/idcode.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/login.css">
</head>

<body>
<div class="content">
    <div class="wraper table-responsive">
        <form class="loginform" onsubmit="return false">
            <div class="login-title">个人会员登录</div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>账号
                    </span>
                <span class="input-span">
                        <input type="text" name="userCount" class="inputxt userCount" placeholder="请输入邮箱账号" ajaxurl="<%=request.getContextPath()%>/service/user/check" datatype="*" nullmsg="请输入" errormsg="格式不正确或账户不存在" />
                    </span>
                <span class="Validform_checktip"></span>
            </div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>密码:
                    </span>
                <span class="input-span">
                        <input type="password" name="userPassword" class="inputxt password" placeholder="请输入密码" datatype="password" nullmsg="密码不能为空！" errormsg="密码错误！" />
                </span>
                <span class="Validform_checktip"></span>
            </div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>验证码：
                    </span>
                <span class="input-span">
                        <input type="text" id="Txtidcode" class="txtVerification" placeholder="请输入验证码" datatype="idcode" errormsg="验证码错误" nullmsg="请填写验证码"/>
                    </span>
                <span class="Validform_checktip"></span>
                <span id="idcode"></span>
            </div>
            <div class="login-submit-div">
                <button class="btn btn-primary" type="submit" id="login-submit">登录</button>
                <a href="index.jsp" class="btn btn-default">返回</a>
            </div>
        </form>
    </div>
</div>

</body>
<script type="text/javascript">
    var context = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="../skins/js/public/jquery.js"></script>
<script type="text/javascript" src="../skins/js/public/public.js"></script>
<script type="text/javascript" src="../skins/js/public/Validform.js"></script>
<script type="text/javascript" src="../skins/js/login.js"></script>
<script type="text/javascript" src="../skins/js/public/idcode.js"></script>
</html>

