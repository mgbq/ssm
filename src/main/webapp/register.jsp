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
<title>注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	function register() {
		var username = document.getElementById("username").value;
		if (username == "") {
			$(".error").html("<div style='color:red'>请输入用户名</div>");
			return;
		}
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/registeryz',
			data : 'username=' + username,
			success : function(date) {
				if (date.length > 0) {
					$(".error").html("<div style='color:red'>用户名存在</div>");
				} else {
					$(".error").html("<div style='color:green'>用户名可以注册</div>");
				}
			},
			error : function(date) {
				alert("ajax失败");
			}
		});
	};
	function zcff() {
		var onepword = $(".oneclasspw").val();
		var twoclaspw = $(".twoclasspw").val();
		var sexclass = $(".sexclass").val();
		alert(onepword + "" + twoclaspw);
		if (onepword == "" || twoclaspw == "" || sexclass=="") {
			$(".errorpwd").html("<div style='color:red'>请输入密码或者性别</div>");
		} else {
			if (onepword == twoclaspw) {
				alert("success");
				$(".errorpwd").html("<div style='color:green'>两次密码输入一致</div>");
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/user/register',
					data : {
						username : $("#username").val(),
						sex : $(".sexclass").val(),
						userpassword : $(".oneclasspw").val()
					},
					success : function(date) {
					alert(date);
						if(date.length > 0) {
							alert("注册成功");
							location.href ="${pageContext.request.contextPath}/login.jsp";
						} else {
							alert("注册失败");
						}
					},
					error : function(date) {
						alert("ajax注册失败");
					}
				});
			} else {
				$(".errorpwd").html("<div style='color:red'>两次密码输入不一致</div>");
			}
		}
	}
</script>
<body>
	请输入用户名
	<input type="text" id="username" onblur="register()" />
	<div class="error"></div>
	<br /> 请输入密码
	<input type="password" class="oneclasspw" /> 请确认密码
	<input type="password" class="twoclasspw" />
	
	<br />请输入性别
	<input type="text" class="sexclass" />
	<div class="errorpwd"></div>
	<input type="button" value="注册" onclick="zcff()" />
	<br />
</body>
</html>


