/**
 * 车辆信息页面，上传车辆和编辑车辆用同一个页面，根据参数判别。如果后面带carId则为编辑车辆
 */
$(function () {
    //检查权限，普通用户无权限，管理员商家固定，超级管理员无限制
    checkAdmin();
    //上传图片
    $(".upload-image").click(uploadImage);

    //表单校验，
    $(".message").Validform({
        btnSubmit:".submit",
        tiptype:2,
        showAllError:true,
        beforeSubmit:function(curform){
            $(".submit").attr({ "disabled": "disabled" });
            $("form").append("<input name='userId' value='"+getCookie("userId")+"' style='display: none'>");
            var oldPath="";
            $(".old-image-par").each(function () {

                oldPath += $(this).attr("imagePath")+",";
            });
            var newPath= oldPath.substring(0,oldPath.length-1);
            $("form").append("<input name='oldPath' value='"+newPath+"' style='display: none'>");
            var url = window.location.href;
            var params = url.indexOf("?");
            //是否带参
            if (!(params === -1)) {
                var canshu = url.substring(params + 1);
                var index = canshu.indexOf("=");
                if (index !== -1) {
                    //参数id
                    var id = canshu.substring(index + 1);
                    if(id){
                        $("form").append("<input name='carId' value='"+id+"' style='display: none'>");
                    }
                }
            }

        }
    });
});


//上传图片按钮，点击后添加一个input，并设置最多上传6张。
function uploadImage() {
    var images = $("input[name='files']").length;
    var oldImages = $(".old-image-par").length;
    var imageCount = images+oldImages;
    if(imageCount==6){
        if($(".file-images:last").val()){
            alert("最多只能上传6张图片");
        }else {
            $(".file-images:last").click();
        }
    }else if(imageCount<6){
        $(".images-td").append("<input type='file' class='file-images' name='files' style='display: none' onchange='getImgURL(this)'>");
        $(".file-images:last").click();
    }else {
        alert("最多只能上传6张图片");
    }
}

// 删除图片，同时删除该图片的input
function deleteImage(that) {
    var index = $(that).parent().index();
    $(".file-images").eq(index).remove();
    $(that).parent().remove();
}

function deleteOldImage(that) {
    $(that).parent().remove();
}

//检查是管理员还是超级管理员
function checkAdmin() {
    var isAdmin =  getCookie("isAdmin");
    //管理员，先判断是否为编辑车辆，然后获取该管理员的商家名称，设置为不可编辑
    if(isAdmin == 1 ){
       getCarId();
        var userId =getCookie("userId");
        $.ajax({
            url: context + "/service/user/selectShopNameByUserId",
            type: 'GET',
            async: false,
            contentType: "application/json;charset=utf-8",
            data: {"userId": userId},
            success: function (data) {
                $(".shopName").val(data).attr({ disabled: "disabled" });
            },
            error: function () {
                alert("error");
            }
        });
    //超级管理员
    }else if(isAdmin == 2){
        getCarId();
    }else {
        $(".content").empty().text("对不起，您没有上传车辆的权限");
    }
}

//根据参数查看是否为编辑车辆，获取车辆id，将车辆信息填入模板
function getCarId() {
    var url = window.location.href;
    var params = url.indexOf("?");
    //是否带参
    if (!(params === -1)) {
        var canshu = url.substring(params + 1);
        var index = canshu.indexOf("=");
        if (index !== -1) {
            var param = canshu.substring(0,index);
            //参数id
            var id = canshu.substring(index+1);
            if(param === "carId"){
                $.ajax({
                    url: context + "/service/car/id",
                    type: 'GET',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    data:{"id":id},
                    success: function (data) {
                        var temp = template("resultList", {
                            "result": data.info
                        });
                        $(".content").empty().append(temp);
                    }
                })
            }
        }
    }
}



