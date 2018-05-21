/**
 * 将公用的js方法，提取出来
 */

// 获取文件后缀名
function getExpandedName(fileName) {
    var index1 =fileName.lastIndexOf("."),
        index2 = fileName.length;
    return fileName.substring(index1+1,index2);
}

// 检查文件类型
function checkType(type) {
    var result = false;
    var images = "jpg,png,jpeg";
    if(images.indexOf(type)>0){
        result = true;
    }
    return result;
}

// 设置cookie
function setCookie(name,value,day){
    var exp　= new Date();
    exp.setTime(exp.getTime() + day*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()+"; path=/";
}

// 获取指定Cookie值
function getCookie(name){
    /*
    *--------------- getCookie(name) -----------------
    * getCookie(name)
    * 功能:取得变量name的值
    * 参数:name,字符串.
    * 实例:alert(getCookie("baobao"));
    *--------------- getCookie(name) -----------------
    */
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if(arr !=null)
        return unescape(arr[2]);
}

// 清除全部的cookie
function clearAllCookie() {
    var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
    if(keys) {
        for(var i = keys.length; i--;)
            document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()+"; path=/";
    }
}