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
    <title>滴滴租车</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/skins/images/car.ico" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skins/css/public/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skins/css/public/autocomplete.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skins/css/public/header.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skins/css/public/footer.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skins/css/index.css">
</head>
<body>
<!--Import the head.jsp -->
<jsp:include page="public/header.jsp"></jsp:include>
<div class="content">
    <!-- 轮播图 -->
    <div id="image-around" class="carousel slide">
        <ol class="carousel-indicators">
            <li data-target="#image-around" data-slide-to="0" class="active"></li>
            <li data-target="#image-around" data-slide-to="1"></li>
            <li data-target="#image-around" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img src="<%=request.getContextPath()%>/skins/images/1234.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/skins/images/2345.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/skins/images/3456.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control left" href="#image-around"
           data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#image-around"
           data-slide="next">&rsaquo;</a>
    </div>
    <!-- 选择框  显示部分的选项，当鼠标移入时出现全部选项，当点击选项后，下面会更新车辆 -->

    <div class="select row">
        <!-- 品牌选择框 -->
        <div class="col-md-4 item-select brand-select">
            <p class="select_title">品牌
                <i class="glyphicon glyphicon-chevron-down"></i>
                <span class="badge brand"></span>
                <button class="brand-reset">重置</button>
            </p>
            <div class="item-message">
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/bieke.png">
                    <span>别克</span>
                    </a>
                </div>
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/bentian.png">
                    <span>本田</span>
                    </a>
                </div>
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/dazhong.png">
                    <span>大众</span>
                    </a>
                </div>
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/fute.png">
                    <span>福特</span>
                    </a>
                </div>
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/richan.png">
                    <span>日产</span>
                    </a>
                </div>
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/biaozhi.png">
                    <span>标致</span>
                    </a>
                </div>
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/jeep.png">
                    <span>Jeep</span>
                    </a>
                </div>
                <div class="car-brand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/baoma.png">
                    <span>宝马</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/mazida.png">
                    <span>马自达</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/woerwo.png">
                    <span>沃尔沃</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/aerfa.png">
                    <span>阿尔法罗密欧</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/aodi.png">
                    <span>奥迪</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/benchi.png">
                    <span>奔驰</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/benteng.png">
                    <span>奔腾</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/byd.png">
                    <span>比亚迪</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/dongfeng.png">
                    <span>东风</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                    <img src="<%=request.getContextPath()%>/skins/images/dongfengfengxing.png">
                    <span>东风风行</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/dongfengfengshen.png">
                        <span>东风风神</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/fengtian.png">
                        <span>丰田</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/jianghuai.png">
                        <span>江淮</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/leinuo.png">
                        <span>雷诺</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/linken.png">
                        <span>林肯</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/luhu.png">
                        <span>路虎</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/mashaladi.png">
                        <span>玛莎拉蒂</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/qiya.png">
                        <span>起亚</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/rongwei.png">
                        <span>荣威</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/sanling.png">
                        <span>三菱</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/tesila.png">
                        <span>特斯拉</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/woerwo.png">
                        <span>沃尔沃</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/yingfeinidi.png">
                        <span>英菲尼迪</span>
                    </a>
                </div>
                <div class="car-brand hideBrand">
                    <a>
                        <img src="<%=request.getContextPath()%>/skins/images/zhongtai.png">
                        <span>众泰</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- 车型选择框 -->
        <div class="col-md-4 item-select type-select">
            <p class="select_title">车型
                <span class="badge type"></span>
                <button class="type-reset">重置</button>
            </p>
            <div class="item-message">
                <a>
                    <img src="<%=request.getContextPath()%>/skins/images/SUV.png">
                    <span>SUV</span>
                </a>
                <a>
                    <img src="<%=request.getContextPath()%>/skins/images/xiaoche.png">
                    <span>紧凑型车</span>
                </a>
                <a>
                    <img src="<%=request.getContextPath()%>/skins/images/kache.png">
                    <span>卡车</span>
                </a>
                <a>
                    <img src="<%=request.getContextPath()%>/skins/images/pika.png">
                    <span>皮卡</span>
                </a>
                <a>
                    <img src="<%=request.getContextPath()%>/skins/images/huoche.png">
                    <span>货车</span>
                </a>
                <a>
                    <img src="<%=request.getContextPath()%>/skins/images/MPV.png">
                    <span>MPV</span>
                </a>
                <a>
                    <img src="<%=request.getContextPath()%>/skins/images/paoche.png">
                    <span>跑车</span>
                </a>
            </div>
        </div>
        <!-- 价格选择框 -->
        <div class="col-md-4 item-select price-select">
            <p class="select_title">价格/天
                <span class="badge startPrice"></span>
                <span class="connection"> - </span>
                <span class="badge endPrice"></span>
                <button class="price-reset">重置</button>
            </p>
            <div class="item-message">
                <a startPrice="0" endPrice="100">
                    0-100
                </a>
                <a startPrice="100" endPrice="300">
                    100-300
                </a>
                <a startPrice="300" endPrice="500">
                    300-500
                </a>
                <a startPrice="500" endPrice="1000">
                    500-1000
                </a>
                <br>
                <span>请输入价格区间</span><br>
                <input type="number" class="input-startPrice" placeholder="请输入起始金额">
                <input type="number" class="input-endPrice" placeholder="请输入结束金额">
                <button class="conform-price">确定</button>
            </div>

        </div>
    </div>

    <!-- 车辆 -->
    <%-- 开始展示一部分，经过上面筛选之后这里的车辆会改变 --%>
    <div class="row carInfo-list">

    </div>
</div>
<!--Import the head.jsp -->
<jsp:include page="public/footer.jsp"></jsp:include>

<%-- 车辆模板 --%>
<script type="text/html" id="resultList">
    {{each resultSet as searchData}}
    <div href="{{searchData.carId}}" class="col-md-3 carInfo">
        <a href="<%=request.getContextPath()%>/jsp/detail.jsp?carId={{searchData.carId}}">
        <img src="<%=request.getContextPath()%>/skins/images/{{searchData.carImage}}">
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
            <a href="<%=request.getContextPath()%>/jsp/detail.jsp?shopId={{searchData.shopId}}">{{searchData.shopName}}</a>
        </div>
        </a>
    </div>
    {{/each}}
</script>
</body>
<script type="text/javascript">
    var context = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/public.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/autocomplete.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/header.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/public/arttemplate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/index.js"></script>
</html>
