<%--
  Created by IntelliJ IDEA.
  User: ytuln
  Date: 2018/1/24
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>页面飞走了</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skins/css/public/404.css">
</head>
<body>
    <div class="code">
        <p>ERROR 404</p>
    </div>
    <div class="road">
        <div class="shadow">
            <div class="shelt">
                <div class="head">
                    <div class="eyes">
                        <div class="lefteye">
                            <div class="eyeball"></div>
                            <div class="eyebrow"></div>
                        </div>
                        <div class="righteye">
                            <div class="eyeball"></div>
                            <div class="eyebrow"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hat"></div>
            <div class="bubble">
                <a href="<%=request.getContextPath()%>/jsp/index.jsp">回到首页?</a>
            </div>
        </div>
        <p>PAGE NOT FOUND</p>
    </div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/404.js"></script>
</html>
