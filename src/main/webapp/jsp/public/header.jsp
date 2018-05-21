<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<header>
    <div class="header">
        <div class="logo-div">
            <a href="<%=request.getContextPath()%>/jsp/index.jsp"><img src="<%=request.getContextPath()%>/skins/images/logo.jpg" alt="logo" title="滴滴租车"></a>
        </div>
        <div class="header-word">
            滴滴租车，一个快捷的租车平台！
        </div>
        <div class="search-div">
            <input type="text" placeholder="搜索" id="search">
        </div>
        <div class="login-regist">
            <a id="login" href="<%=request.getContextPath()%>/jsp/login.jsp" target="_self">登录</a>
            <a id="regist" href="<%=request.getContextPath()%>/jsp/regist.jsp" target="_self">注册</a>
        </div>
    </div>
</header>


