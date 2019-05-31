<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ytuln
  Date: 2018/1/26
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <title>详情页</title>
    <link rel="shortcut icon" type="image/x-icon" href="../skins/images/car.ico" media="screen" />
    <link rel="stylesheet" type="text/css" href="../skins/css/public/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/validform.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/dialog.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/autocomplete.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/header.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/public/footer.css">
    <link rel="stylesheet" type="text/css" href="../skins/css/detail.css">
</head>
<body>
<%--顶部嵌入顶部信息栏--%>
<jsp:include page="public/header.jsp"></jsp:include>

    <div class="content">

    </div>
<%--商家或个人位置，并且展示地图并进行标点--%>

<%--底部栏--%>
<jsp:include page="public/footer.jsp"></jsp:include>

<%-- 车辆信息模板 --%>
<script type="text/html" id="carResult">
    <div class="carousel slide" id="image-around">
        <ol class="carousel-indicators">
            {{each carResult.carImages as image}}
            <li data-target="#image-around" data-slide-to="{{carResult.carImages.length}}"></li>
            {{/each}}
        </ol>
        <div class="carousel-inner">
            {{each carResult.carImages as image}}
                <div class="item">
                    <img src="../skins/images/{{image}}">
                </div>
            {{/each}}
        </div>
        <a class="carousel-control left" href="#image-around"
           data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#image-around"
           data-slide="next">&rsaquo;</a>
    </div>
    <div class="rent-message">
        <form class="confirm-form" onsubmit="return false">
            <table class="table table-bordered">
                <tr>
                    <td>租赁天数：/天</td>
                    <td> <input type="number" class="day" datatype="n" nullmsg="请输入天数" placeholder="请输入租赁天数">
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td>租赁数量：/辆</td>
                    <td><input type="number" class="count" datatype="amount" nullmsg="请输入车辆数" placeholder="请输入租赁数量" errormsg="数量错误">
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="confirm">
                        <button class="btn btn-primary" id="rentConfirm">确定</button>
                        <%--<button class="btn btn-success addShop">加入购物车</button>--%>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <tr>
            <td>车辆品牌</td>
            <td class="car-brand">{{carResult.carBrand}}</td>
        </tr>
        <tr>
            <td>车辆名称</td>
            <td class="car-name">{{carResult.carName}}</td>
        </tr>
        <tr>
            <td>车辆类型</td>
            <td>{{carResult.carType}}</td>
        </tr>
        <tr>
            <td>价格/元</td>
            <td class="price">{{carResult.carPrice}}</td>
        </tr>
        <tr>
            <td>剩余数量</td>
            <td class="car-amount">{{carResult.carAmount}}</td>
        </tr>
        <tr>
            <td>载人数</td>
            <td>{{carResult.carPeople}}</td>
        </tr>
        <tr>
            <td>载货量</td>
            <td>{{carResult.carGood}}</td>
        </tr>
        <tr>
            <td>租赁次数</td>
            <td>{{carResult.rentCount}}</td>
        </tr>
        <tr>
            <td>里程数</td>
            <td>{{carResult.carMilage}}</td>
        </tr>
        <tr>
            <td>购买时间</td>
            <td>{{carResult.carTime}}</td>
        </tr>
        <tr>
            <td>上传者姓名</td>
            <td>{{carResult.carUserName}}</td>
        </tr>
        <tr>
            <td>车辆描述</td>
            <td>{{carResult.carInfo}}</td>
        </tr>
    </table>

    <hr>
    <h3>所属商家信息</h3>
    <table class="table table-bordered table-hover shopMessage">
        <tr>
            <td>商家名称：</td>
            <td><a href="detail.jsp?shopId={{carResult.shopId}}" class="shopId" value="{{carResult.shopId}}">{{carResult.shopName}}</a></td>
        </tr>
        <tr>
            <td>商家位置：</td>
            <td>{{carResult.shopLocation}}</td>
        </tr>
        <tr>
            <td>联系方式：</td>
            <td>{{carResult.shopPhone}}</td>
        </tr>
    </table>
    <div id="allmap">

    </div>
    <div class="row shopInfo">

        <h3 class="carList-title">类似车辆：</h3>
        <%-- 相同类型的车辆展示  --%>
        {{each carResult.likeCarList as searchData}}
        <div href="{{searchData.carId}}" class="col-md-3 carInfo">
            <img src="../skins/images/{{searchData.carImage}}">
            <div>
                <p>
                    <span class="car-price">￥{{searchData.carPrice}}</span>
                    <span class="car-rent-count">租赁次数：{{searchData.rentCount}}</span>
                </p>
                <p>
                    剩余车辆：{{searchData.carAmount}}
                </p>
                <p>
                    <span>{{searchData.carBrand}}&nbsp;&nbsp;{{searchData.carName}}</span>
                </p>
                <a href="detail.jsp?shopId={{searchData.shopId}}">{{searchData.shopName}}</a>
            </div>
        </div>
        {{/each}}
    </div>
</script>

<%-- 商家信息模板 --%>
<script type="text/html" id="shopResult">
    <table class="table table-bordered table-hover shopMessage">
        <tr>
            <td>商家名称：</td>
            <td>{{shopResult.shopName}}</td>
        </tr>
        <tr>
            <td>商家位置：</td>
            <td>{{shopResult.shopLocation}}</td>
        </tr>
        <tr>
            <td>联系方式：</td>
            <td>{{shopResult.shopPhone}}</td>
        </tr>
        <tr>
            <td>商家车辆总数：</td>
            <td>{{shopResult.carCount}}</td>
        </tr>
    </table>
    <div id="allmap">

    </div>
    <div class="row shopInfo">
        <h3 class="carList-title">该商家下的车辆：</h3>
    <%-- 商家下的车辆展示  --%>
        {{each shopResult.carList as searchData}}
        <div href="{{searchData.carId}}" class="col-md-3 carInfo">
            <img src="../skins/images/{{searchData.carImage}}">
            <div>
                <p>
                    <span class="car-price">￥{{searchData.carPrice}}</span>
                    <span class="car-rent-count">租赁次数：{{searchData.rentCount}}</span>
                </p>
                <p>
                    剩余车辆：{{searchData.carAmount}}
                </p>
                <p>
                    <span>{{searchData.carBrand}}&nbsp;&nbsp;{{searchData.carName}}</span>
                </p>
                <a href="detail.jsp?shopId={{searchData.shopId}}">{{searchData.shopName}}</a>
            </div>
        </div>
        {{/each}}
    </div>
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=************"></script>
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
<script type="text/javascript" src="../skins/js/detail.js"></script>

</html>
