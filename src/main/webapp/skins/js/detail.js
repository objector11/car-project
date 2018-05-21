$(function () {
    /*
    首先判断路径，是否带参。如果不带参，则显示参数不完整
    带参之后判别参数是车辆id还是商家id。然后传入不同后台
    返回数据后返回给不同模板
    */
    onLoad();

    //设置轮播图播放时间
   carouselTime();

    $(".carInfo").hover(function () {
        $(this).toggleClass("mouseEnter");
    }).click(function () {
        var href = $(this).attr("href");
        window.location.href = context + "/jsp/detail.jsp?carId="+href;
    });

    $(".confirm-form").Validform({
        btnSubmit:"#rentConfirm",
        tiptype:3,
        datatype:{
            //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
            //后台查询账户是否存在,这里不查询密码，将密码查询放到后台这样安全
            "amount":function(gets,obj,curform,regxp){
                var amount =parseInt($(".car-amount").text());
                if(gets>0&&gets<=amount){
                    return true;
                }
                return false;
            }
        },
        callback:function(data){
            rentConfirm();
        }
    });

});


function onLoad() {
    var url = window.location.href;
    var params = url.indexOf("?");
    //是否带参
    if (!(params == -1)) {
        var canshu = url.substring(params + 1);
        var index = canshu.indexOf("=");
        if (index != -1){
            //参数类型
            var param = canshu.substring(0,index);
            //参数id
            var id = canshu.substring(index+1);
            //判断是车辆还是商家
            if(param == "carId"){
                ajaxFUN("car",id);
                addActive();
            }else if(param == "shopId"){
                ajaxFUN("shop",id);
            }
        }else {
            $("html").empty().html("<h4>输入参数不完整，请重试！</h4>");
        }
    }else {
        $("html").empty().html("<h4>输入参数不完整，请重试！</h4>");
    }
}

function ajaxFUN(type,id) {
    $.ajax({
        url: context + "/service/"+type+"/id",
        type: 'GET',
        async: false,
        contentType: "application/json;charset=utf-8",
        data:"id="+id,
        success: function (data) {
            var infoType = data.infoType;
            var info = data.info;
            if(info){
                if(infoType=="car"){
                    $("title").html(info.carBrand + info.carName+"详情页");
                    var temp = template("carResult", {
                        "carResult": info
                    });
                    $(".content").empty().append(temp);
                    var jingdu = info.shopJingDu;
                    var weidu = info.shopWeiDu;
                    setPotin(jingdu,weidu);
                }else if(infoType=="shop"){
                    $("title").html(info.shopName+"详情页");
                    var temp = template("shopResult", {
                        "shopResult": info
                    });
                    $(".content").empty().append(temp);
                    var jingdu = info.shopJingDu;
                    var weidu = info.shopWeiDu;
                    setPotin(jingdu,weidu);
                }
            }else {
                $(".content").empty().html("<a href='index.jsp'>对不起，该车辆已下架，请重新选择车辆吧。</a>2秒后自动跳转到首页");
                setTimeout(function () {
                   window.location.href=context+"/jsp/index.jsp";
                },2000);
            }

        },
        error: function () {
            alert("error");
        }
    });
}

function carouselTime() {
    $("#image-around").carousel({
        interval:2000
    });
}

//给车辆模板中的轮播图第一个添加 active 样式
function addActive() {
    $("#image-around>.carousel-inner>.item").eq(0).addClass("active");
}

//TODO 将导航结果进行展示
//百度地图初始化和传参
function setPotin(jingdu,weidu) {
    var shopPoint = new BMap.Point(jingdu,weidu);
    var map = new BMap.Map("allmap");
    map.centerAndZoom(shopPoint, 15);
    map.addControl(new BMap.NavigationControl());

    //添加gps marker和label
    var markerShopPoint = new BMap.Marker(shopPoint);
    map.addOverlay(markerShopPoint); //添加GPS marker
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    var userJingdu;
    var userWeidu;
    var driving = new BMap.DrivingRoute(map, {
        renderOptions: {
            map: map,
            panel : "results",
            autoViewport: true
        }
    });
    var geolocation = new BMap.Geolocation();
    // 开启SDK辅助定位
    //geolocation.enableSDKLocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
            userJingdu = r.point.lng;
            userWeidu = r.point.lat;
            var userPoint = new BMap.Point(userJingdu,userWeidu);
            driving.search(userPoint, shopPoint);
        }
        else {
            alert('failed'+this.getStatus());
        }
    });

}

function rentConfirm() {
    var  user = getCookie("userName");
    var carBrand = $(".car-brand").text();
    var carName = $(".car-name").text();
    var day =$(".day").val();
    var count =$(".count").val();
    var price = $(".price").text();
    var allPrice = price*count*day;
    if(user){
        var d = dialog({
            title:"结算信息",
            content: '您选择了'+carBrand +'  '+carName+',' +
                    day+'天，'+count+'辆'+
                    '共'+allPrice+'元！',
            okValue: '结算',
            ok: function () {
                window.location.href = context +"/jsp/index.jsp";
                rent(carBrand,carName,day,count,allPrice);
            },
            cancelValue: '取消',
            cancel: function () {}
        });
        d.show();
    }else {
        var d = dialog({
            content: '请登录后再选择！',
            okValue: '确定',
            ok: function () {
                window.location.href = context +"/jsp/login.jsp";
            },
            cancelValue: '取消',
            cancel: function () {}
        });
        d.show();
    }
}

function rent(carBrand ,carName,day,count,price) {
    var url = window.location.href;
    var params = url.indexOf("=");
    //是否带参
    if (!(params == -1)) {
        var carId = url.substring(params + 1);
    }
    var userId=getCookie("userId");
    var shopId=$(".shopId").attr("value");
    $.ajax({
        url: context + "/service/order/insert",
        type: 'GET',
        async: true,
        contentType: "application/json;charset=utf-8",
        data:{"carId":carId,"userId":userId,"shopId":shopId,"price":price,"count":count},
        success: function (data) {
        }
    });
    window.location.href = context +"/jsp/index.jsp";
}


