<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>注册</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
<script type="text/javascript">
	/*******判断昵称是否被占用*******/
	function checkName(n) {
		var f = false;
		var username = $("#Username").val();
		if (username == "") {
			$("#checkName").text("Can't be empty");
			f = false;
		} else {
			$.ajax({
				url : "CheckNameServlet?username=" + username,
				async : n,
				type : "POST",
				success : function(s) {
					if (s == "Success") {
						$("#checkName").text("Success");
						f = true;
					} else {
						$("#checkName").text("Have been occupied");
						f = false;
					}
				}
			});
		}
		return f;
	}

	/*******判断邮箱是否被占用 *******/
	function checkEmail(n) {
		var f = false;
		var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
		var email = $("#Email").val();
		if (email == "") {
			$("#checkEmail").text("Can't be empty");
			f = false;
		}else if(!reg.test(email) ){
			$("#checkEmail").text("The format is incorrect");
			f = false;
			
		} else {
			$("#checkEmail").text("Success");
		}
		return f;
	}
	
	/*******判断密码是否为空  *******/
	function judgePwd1() {
		var pass = $("#password1").val();
		if (pass == "") {
			$("#judgePwd1").text("Can't be empty");
			return false;
		} else {
			$("#judgePwd1").text("Success");
			return true;
		}
	}

</script>

</head>
<body>
	<%@ include file="header.jsp" %>
	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
			<div class="register-but">		
		
				<!-- 注册 -->
				<form action="RegisterServlet" method="post"> 
					<div class="register-top-grid">
					<div class="register-bottom-grid">
					
						<h3>Register information</h3>
						<div class="input">
							<span>UserName<label>*</label></span>
							<input type="text" name="username" id="Username" onblur="checkName(true);"> 
							<h5 id="checkName"></h5>
						</div>
						<div class="input">
							<span>password<label>*</label></span>
							<input type="password" name="password" id="password1" onblur="judgePwd1();"> 
							<h5 id="judgePwd1"></h5>
						</div>
						<div class="input">
							<span>Email<label>*</label></span>
							<input type="text" name="email" id="Email" onblur="checkEmail(true);"> 
							<h5 id="checkEmail"></h5>
						</div>
					</div>
					</div>
						<div class="clearfix"> </div>						 
					   <!-- <input type="submit" value="sign up">	 -->	
					   <input type="submit" value="sign up"/>	   
				
				</form>
				</div>
			</div>
	    </div>
	</div>
	<!--//account-->
	<%@ include file="footer.jsp" %>
</body>
</html>