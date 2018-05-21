<%--
  Created by IntelliJ IDEA.
  User: ytuln
  Date: 2018/1/26
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="shortcut icon" type="image/x-icon" href="../skins/images/car.ico" media="screen" />
    <link rel="stylesheet" type="text/css" href="../skins/css/public/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/dialog.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/validform.css" />
    <link rel="stylesheet" type="text/css" href="../skins/css/public/idcode.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/login.css">
</head>

<body>
<div class="content">
    <div class="wraper table-responsive">
        <form class="registform" onsubmit="return false">
            <div class="login-title">个人会员注册</div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>邮箱
                    </span>
                <span class="input-span">
                        <input type="email" name="email" class="inputxt email" datatype="e" ajaxurl="<%=request.getContextPath()%>/service/user/check" nullmsg="请输入" errormsg="邮箱格式不正确" />

                </span>
                <span class="Validform_checktip"></span>
            </div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>用户名
                    </span>
                <span></span>
                <span class="input-span">
                        <input type="text" name="userName" class="inputxt userName" datatype="*" ajaxurl="<%=request.getContextPath()%>/service/user/check" nullmsg="请输入" errormsg="以字母开头，至少为6位" />
                    </span>
                <span class="Validform_checktip"></span>
            </div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>密码:
                    </span>
                <span class="input-span">
                        <input type="password" name="userPassword" class="inputxt userPassword" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！"  />
                    </span>
                <span class="Validform_checktip"></span>
            </div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>确认密码:
                    </span>
                <span class="input-span">
                        <input type="password" name="userPassword2" tip="test" class="inputxt" datatype="*" recheck="userPassword" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！" />
                    </span>
                <span class="Validform_checktip"></span>
            </div>
            <div class="tr-login">
                    <span class="tip-span">
                        <span class="need">*</span>验证码：
                    </span>
                <span class="input-span">
                        <input type="text" id="Txtidcode" class="txtVerification" datatype="idcode" nullmsg="请输入验证码" errormsg="验证码错误"/>
                    </span>
                <span class="Validform_checktip"></span>
                <span id="idcode"></span>
            </div>
            <div class="login-submit-div">
                <button class="btn btn-primary" type="submit" id="regist-submit">注册</button>
                <a href="index.jsp" class="btn btn-default">返回</a>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    var context= "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="../skins/js/public/jquery.js"></script>
<script type="text/javascript" src="../skins/js/public/Validform.js"></script>
<script type="text/javascript" src="../skins/js/public/public.js"></script>
<script type="text/javascript" src="../skins/js/public/dialog.js"></script>
<script type="text/javascript" src="../skins/js/public/idcode.js"></script>
<script type="text/javascript" src="../skins/js/regist.js"></script>
</body>
</html>
