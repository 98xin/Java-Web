<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.ShoppingCartBean"  %>
<%@ page import="dao.ShoppingCartDao"  %>
<%@ page import="dao.ShoppingCartDetailDao"  %>
<%@ page import="bean.UserBean"  %>
<%@ page import="java.util.List"  %>
<%@ page import="bean.ShoppingCartDetailBean"  %>
<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a  href="index.jsp">Yummy</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp" class="active">Home</a></li>
						<c:forEach items="${caketypes}" var="caketype1">
							<c:if test="${caketype1.pId==0}">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">${caketype1.typeName }<b class="caret"></b></a>
									<ul class="dropdown-menu multi-column columns-4" style="width:20px">
										<c:forEach items="${caketypes}" var="caketype2">
											<c:if test="${caketype2.pId==caketype1.typeId }">
												<li class="menu_header"><a href="CakeByPage">${caketype2.typeName }</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:if>	
						</c:forEach>							
					</ul> 
				</div>
				<!--//navbar-header-->
				
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>				
					<div class="search">
						<form class="navbar-form" action="CakeByPage">
							<input type="text" class="form-control">
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								Search
							</button>
						</form>
					</div>	
				</div>
				<div class="header-right login">
					<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					<div id="loginBox">
					    <!-- 判断是否已经登录过 -->
					<c:if test="${not empty user }">
						<div id=loginForm style='color: red; font-size: 24px'>欢迎您！${user.username }</div>
					</c:if>   
					<c:if test="${empty user }">         
						<form id="loginForm">
						<span id="checkLogin" style="color: red; font-size: 14px"></span>
							<fieldset id="body">
								<fieldset>
									<label for="username">Username</label>
									<input type="text" name="username" id="username" onblur="checkUserName(this.value);">
									<span id="checkUserNameResult" style="font-size : 10px "></span>
								</fieldset>
								<fieldset>
									<label for="password">Password</label>
									<input type="password" name="password" id="password" onblur="checkPassword(this.value);">
									<span id="checkPasswordResult" style="color: red "></span>
								</fieldset>
								<!-- <input type="submit" id="login" value="Sign in"> -->
								<input type="button" id="login" onclick="checkLogin();" value="Sign in" /> 
								<label for="checkbox"><input type="checkbox" id="checkbox" name="checkbox"> <i>Remember me</i></label>
							</fieldset>
							<p>New User ? <a class="sign" href="account.jsp">Sign Up</a> <span><a href="#">Forgot your password?</a></span></p>
						</form>
						</c:if>
					</div>
				</div>
				<div class="header-right cart">
					<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
					<div class="cart-box">
						<h4><a href="shoppingCart?remark=select">
						<c:if test="${empty user }">
						<span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>) 
						</c:if>  
						
						<c:if test="${not empty user }">
						<%
						UserBean user = (UserBean) session.getAttribute("user");
						int userId = user.getUserId();
						ShoppingCartBean shoppingCart = new ShoppingCartBean();
						ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
						shoppingCart = shoppingCartDao.getShoppingCartByUserId(userId);
						int shoppingCartId = shoppingCart.getShoppingCartId();
						List<ShoppingCartDetailBean> shoppingCartDetailList = new ShoppingCartDetailDao().getShoppingCartDetailByShoppingCartId(shoppingCartId);
						int num = shoppingCartDetailList.size();
						session.setAttribute("num", num);
						%>
						
						<span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> num </span>) 
						</c:if>  
						
						</a></h4>
						<p><a href="shoppingCart?remark=select" class="simpleCart_empty">查看订单</a></p>
						<p><a href="javascript:;" class="simpleCart_empty">Empty cart</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->
	<!-- 用户名不为空 -->
	<script type="text/javascript">
        function checkUserName(obj){
            var username = obj;
        	var checkUserNameResult = document.getElementById("checkUserNameResult");  
            if(username.trim().length==0){
                  checkUserNameResult.innerHTML = "用户名不能为空";  
                  obj.focus();
            }else{
            	 checkUserNameResult.innerHTML = "";  
            }
        }
    </script>
 <!-- 密码不为空 -->
    <script type="text/javascript">
        function checkPassword(obj){
            var password = obj;
			var checkPasswordResult = document.getElementById("checkPasswordResult"); 
            if(password.trim().length==0){
                checkPasswordResult.innerHTML = "密码不能为空";  
                obj.focus();
            }else{
            	 checkPasswordResult.innerHTML = "";  
            }
        }
 
    </script>
  <script type="text/javascript">
	/* 判断用户名密码是否正确 */
	function checkLogin() {
		var username = $("#username").val();
		var pwd = $("#password").val();
		if (username == "" || pwd == "") {
			$("#checkLogin").text("用户名或密码为空");
		} else {
			$
					.ajax({
						url : "check?username=" + username + "&password="
								+ pwd,
						async : true,
						type : "POST",
						success : function(res) {
							var msg = eval("(" + res + ")");
							if (msg.result == "ok") {
								$("#loginForm").remove();
								var node = "<div id=loginForm style='color: red; font-size: 24px'>欢迎您！"
										+ msg.username + "</div>"
								$("#loginBox").append(node);
							} else {
								$("#checkLogin").text("用户名或密码错误");
							}
						}
					});
		}
	}
</script>  

