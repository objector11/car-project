$(function () {

    //轮播图间隔时间
    carouselTime();

    //重置按钮事件
    resetButton();
    resetClick();
    showLine();
    //后台读取部分车辆信息展示
    getCarList();

    $(".brand-select a").click(clickBrandChoose);
    $(".type-select a").click(clickTypeChoose);
    $(".price-select a").click(clickPriceChoose);
    $(".conform-price").click(inputPriceChoose);

    //车辆宫格移入添加边框,点击跳转
    $(".carInfo").hover(function () {
        $(this).toggleClass("mouseEnter");
    });

    $(".brand-select").hover(carBrandIn,carBrandOut);

});

function carBrandIn() {
    $(".hideBrand").show().attr({ "style": "display: inline-block;" });
    $(".select_title>i").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
}

function carBrandOut() {
    $(".hideBrand").attr({ "style": "display: none;" }).hide();
    $(".select_title>i").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
}

function carouselTime() {
     $("#image-around").carousel({
         interval:2000
     });
}

function resetButton() {
    brandResetButton();
    typeResetButton();
    priceResetButton();
}

function brandResetButton() {
    if($(".brand").text()){
        $(".brand-reset").show();
    }else {
        $(".brand-reset").hide();
    }
}

function typeResetButton() {
    if($(".type").text()){
        $(".type-reset").show();
    }else {
        $(".type-reset").hide();
    }
}

function priceResetButton() {
    if($(".startPrice").text()){
        $(".price-reset").show();
    }else {
        $(".price-reset").hide();
    }
}

function resetClick() {
    $(".brand-reset").click(function () {
        $(".brand").empty();
        $(this).hide();
        getCarList();
    });
    $(".type-reset").click(function () {
        $(".type").empty();
        $(this).hide();
        getCarList();
    });
    $(".price-reset").click(function () {
        $(".startPrice").empty();
        $(".endPrice").empty();
        $(".input-startPrice").val("");
        $(".input-endPrice").val("");
        $(this).hide();
        showLine();
        getCarList();
    });
}

//选项点击事件
function clickBrandChoose() {
    var value =$(this).text();
    $(".brand").empty().text(value);
    resetButton();
    getCarList();
}
function clickTypeChoose() {
    var value =$(this).text();
    $(".type").empty().text(value);
    resetButton();
    getCarList();

}
function clickPriceChoose() {
    var startPrice =$(this).attr("startPrice");
    var endPrice =$(this).attr("endPrice");
    $(".startPrice").empty().text(startPrice);
    $(".endPrice").empty().text(endPrice);
    showLine();
    priceResetButton();
    getCarList();
}
function inputPriceChoose() {
    var startPrice =$(".input-startPrice").val();
    var endPrice =$(".input-endPrice").val();
    if(startPrice){
        if(endPrice){
            $(".startPrice").empty().text(startPrice);
            $(".endPrice").empty().text(endPrice);
            showLine();
            priceResetButton();
            getCarList();
        }
    }

}

function showLine() {
    if($(".startPrice").is(':hidden')){
        $(".connection").hide();
    }else {
        $(".connection").show();
    }
}

//模板传值
function getCarList() {
    var data = {"carBrand":$(".brand").text().trim(),"carType":$(".type").text().trim(),"startPrice":$(".startPrice").text().trim(),"endPrice":$(".endPrice").text().trim()};
    $.ajax({
        type: 'POST',
        url: context + "/service/car/infoAll",
        contentType: "application/json;charset=utf-8",
        async:false,
        dataType: "JSON",
        data:JSON.stringify(data),
        success: function (data) {
            var result = data;
            if (result.length > 0) {
                var temp = template("resultList", {
                    "resultSet": data
                });
                $(".carInfo-list").empty().append(temp);
            }else {
                $(".carInfo-list").html("<h3>该条件下暂无内容，请重新搜索</h3>");
            }

        },
        error: function () {
            alert("error");
        }
    });
    
}





