<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            	<a href="<%=basePath%>desk.jsp" target=_blank>© 开发From 2021</a> |
				<a href="<%=basePath%>desk.jsp" target=_blank>本站招聘</a> |
				<a href="<%=basePath%>desk.jsp" target=_blank>联系站长</a> |
				<a href="<%=basePath%>desk.jsp" target=_blank>意见与建议</a> |
				<a href="<%=basePath%>desk.jsp" target=_blank>京ICP备123456号</a> |
				<a href="<%=basePath%>login.jsp" target=_blank>后台登录</a>
            </div>
        </div>
    </div>
</footer>
<!--footer--> 

 


 