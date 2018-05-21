<%--
  Created by IntelliJ IDEA.
  User: 刘乃杰
  Time:2018/5/7  18:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改成功</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/skins/images/car.ico" media="screen" />
</head>
<body>
<p class="insertCar">成功修改车辆,3秒后会自动跳转到首页</p>
</body>

<script type="text/javascript">
    setTimeout(function () {
        window.location.href = "<%=request.getContextPath()%>/jsp/index.jsp";
    },3000);
</script>
</html>
