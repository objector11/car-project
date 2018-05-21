<%--底部栏--%>
<%--包括 版权，设计者，网站联系方式，备案号等信息--%>
<%--同时将微信小程序二维码展示出来--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="cn.lnj.project.car.util.Count" %>
<%
    Count CountFileHandler=new Count();
    int count=0;
    if(application.getAttribute("count")==null){
        //文件位置在同文件夹下的count.txt,读取文件获取数据赋给count
        count=CountFileHandler.readFile(request.getRealPath("/")+"count.txt");
        application.setAttribute("count",new Integer(count));
    }
    count=(Integer)application.getAttribute("count");
    if(session.isNew()){
        ++count;
    }
    application.setAttribute("count",count);
    CountFileHandler.writeFile(request.getRealPath("/")+"count.txt",count);//更新文件记录
%>
<footer>
    <div class="footer">
        <div class="footer_content">
            <p>已有&nbsp;<span class="count"><%=count %></span>&nbsp;人次访问 </p>
            <p>
                Designed and developed &copy; by <a href="mailto:ytulnj@163.com">LiuNaiJie</a>
                &nbsp;&nbsp;All Rights Reserved
            </p>
            <p>
                毕业项目，感谢每一位帮助过我的老师和同学。
            </p>
            <p>
                所以图片均为网络资源，如果涉及侵权，请联系<a href="mailto:ytulnj@163.com">ytulnj@163.com</a>
            </p>
        </div>
    </div>
</footer>
