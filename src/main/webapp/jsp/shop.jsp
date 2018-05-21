<%--
  Created by IntelliJ IDEA.
  User: ytuln
  Date: 2018/4/21
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传商家</title>
    <link rel="shortcut icon" type="image/x-icon" href="../skins/images/car.ico" media="screen"/>
    <link rel="stylesheet" type="text/css" href="../skins/css/public/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/validform.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/dialog.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/autocomplete.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/header.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/footer.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/shop.css">
</head>
<body>
<%-- 上传商家，与编辑商家 --%>
<!--Import the head.jsp -->
<jsp:include page="public/header.jsp"></jsp:include>

<div class="content">
    <form class="shop-message" onsubmit="return false">
        <table class="table table-bordered">
            <tr>
                <td>商家名称</td>
                <td>
                    <input type="text" name="shopName" datatype="*" ajaxurl="<%=request.getContextPath()%>/service/shop/check" placeholder="请输入商家名称">
                </td>
            </tr>
            <tr>
                <td>商家联系方式</td>
                <td>
                    <input type="number" name="shopPhone" datatype="n" ajaxurl="<%=request.getContextPath()%>/service/shop/check" placeholder="请输入商家联系方式">
                </td>
            </tr>
            <tr>
                <td>商家邮箱</td>
                <td>
                    <input type="email" name="shopEmail" datatype="*" ajaxurl="<%=request.getContextPath()%>/service/shop/check" placeholder="请输入商家邮箱">
                </td>
            </tr>
            <tr>
                <td>商家位置</td>
                <td>
                    <input type="text" name="shopLocation" datatype="*" ajaxurl="<%=request.getContextPath()%>/service/shop/check" placeholder="请输入商家位置">
                </td>
            </tr>
            <tr>
                <td>商家位置经纬度</td>
                <td>
                    <input type="text" name="jingdu" placeholder="请输入经度" datatype="*">
                    <input type="text" name="weidu" placeholder="请输入纬度" datatype="*">
                </td>
            </tr>
            <tr class="login-submit-div">
                <td colspan="2">
                    <button type="button" class="btn btn-default submit">提交</button>
                    <button type="reset" class="btn btn-default reset">重置</button>
                </td>
            </tr>
        </table>
    </form>
</div>

<!--Import the footer.jsp -->
<jsp:include page="public/footer.jsp"></jsp:include>

<%-- 商家信息模板 --%>
<script type="text/html" id="shopResult">
    <button class="btn btn-default edit"><i class="glyphicon glyphicon-edit"></i>编辑</button>
    <button class="btn btn-default save"><i class="glyphicon glyphicon-ok"></i>保存</button>
    <form class="shop-message" onsubmit="return false">
        <table class="table table-bordered shopMessage">
            <tr>
                <td>商家名称：</td>
                <td><input type="text" class="bottomLine" name="shopName" value="{{shopResult.shopName}}" datatype="*" readonly></td>
            </tr>
            <tr>
                <td>联系方式：</td>
                <td><input type="text" class="bottomLine" name="shopPhone" value="{{shopResult.shopPhone}}" datatype="*" readonly></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><input type="email" class="bottomLine" name="shopEmail" value="{{shopResult.shopEmail}}" datatype="*" readonly></td>
            </tr>
            <tr>
                <td>商家位置：</td>
                <td><input type="text" class="bottomLine" name="shopLocation" value="{{shopResult.shopLocation}}" datatype="*" readonly></td>
            </tr>
            <tr>
                <td>商家经纬度：</td>
                <td><input type="text" class="bottomLine" name="jingdu" value="{{shopResult.shopJingDu}}" readonly>
                    <input type="text" class="bottomLine" name="weidu"  value="{{shopResult.shopWeiDu}}" readonly>
                </td>
            </tr>
            <tr class="login-submit-div">
                <td colspan="2">
                    <button type="button" class="btn btn-default submit">提交</button>
                    <button type="reset" class="btn btn-default reset">重置</button>
                </td>
            </tr>
        </table>
    </form>
</script>
</body>
<script type="text/javascript">
    var context = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="../skins/js/public/jquery.js"></script>
<script type="text/javascript" src="../skins/js/public/bootstrap.js"></script>
<script type="text/javascript" src="../skins/js/public/public.js"></script>
<script type="text/javascript" src="../skins/js/public/Validform.js"></script>
<script type="text/javascript" src="../skins/js/public/dialog.js"></script>
<script type="text/javascript" src="../skins/js/public/autocomplete.js"></script>
<script type="text/javascript" src="../skins/js/public/header.js"></script>
<script type="text/javascript" src="../skins/js/public/arttemplate.js"></script>
<script type="text/javascript" src="../skins/js/shop.js"></script>
</html>
