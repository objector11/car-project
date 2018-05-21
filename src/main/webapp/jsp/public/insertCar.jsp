<%--
  Created by IntelliJ IDEA.
  User: 刘乃杰
  Time:2018/5/3  21:21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传成功</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/skins/images/car.ico" media="screen" />
</head>
<body>
<p class="insertCar">成功上传车辆，如需继续上传请点击<a href="<%=request.getContextPath()%>/jsp/car.jsp">继续上传</a>，否则3秒后会自动跳转到首页</p>
</body>

<script type="text/javascript">
    setTimeout(function () {
        window.location.href = "<%=request.getContextPath()%>/jsp/index.jsp";
    },3000);
</script>
</html>
