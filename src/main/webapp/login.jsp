<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<title>登陆</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	function login() {
		$("input[type='text']").each(function() {
			if ($(this).val() == "") {
				alert("不能为空！");
				$(".dlsubmit").attr("disabled", true);
				$("input").focus(function() {
					$(".dlsubmit").attr("disabled", false);
				});
			}
		});
	}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/user/login"
		method="post">
		用户名<input type="text" class="yhm" name="username"/> 密码<input
			type="password" class="yhmpw" name="sex" /> 登陆 <input
			type="submit" onclick="login()" class="dlsubmit" value="登陆" />
	</form>
</body>
</html>
