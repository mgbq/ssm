<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<title>首页</title>
<script type="text/javascript">
	function updateUser() {
		$("input[type='text']").each(function() {
			if ($(this).val() == "") {
				alert("不能为空！");
				$(".xgsubmit").attr("disabled", true);
				$("input").focus(function() {
					$(".xgsubmit").attr("disabled", false);
				});
			}
		});
	}
	function delUser(){
	if(confirm("确认删除吗")){
	$.ajax({
	type:'POST',
	url:'${pageContext.request.contextPath}/user/delUser',
	data:'userid='+$(".userid").val(),
	success: function(){
	alert("已经删除成功");
	location.href ="${pageContext.request.contextPath}/login.jsp";
	}
	});
	}else{
	alert("已经取消删除");
	return;
	}
	}
</script>
<body>
<h2>Hello World!  ${user1.username} 你好</h2>
<form action="updateUser" method="post">
<input type="hidden" class="userid" value="${user1.userid}" name="userid"> 
用户名<input type="text" value="${user1.username}" name="username"> 
密码<input type="text" value="${user1.userpassword}" name="userpassword">
性别<input type="text" value="${user1.sex}" name="sex">
<input type="submit" onclick="updateUser()" class="xgsubmit" value="修改"> 
<input type="button" onclick="delUser()" class="xgsubmit" value="注销">
</form>
</body>
</html>
