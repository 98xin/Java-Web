<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Products</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
<!-- //the jScrollPane script -->
<script type="text/javascript">
	/* 页面刷新时的状态 */
	$(document).ready(
			function() {
				var type = $.cookie('type');
				$(":radio[name='radio'][value='" + type + "']").prop("checked",
						"checked");
				var size = $.cookie('size');
				$('input[type=text]').val(size);
				console.log("radio:" + type);
				console.log("size:" + size);
			});

	/* 搜索满足类型条件的蛋糕 */
	$(function() {
		$(":radio")
				.click(
						function() {
							var radio = $(this).val();
							console.log("radio:" + radio);
							//得到搜索框的值
							var search_word = document
									.getElementById("search_text").value;
							location.href = "CakeByPage?pageNum=1" + "&type="
									+ radio + "&search_word=" + search_word;
						});
	});

	function search_word() {
		var type = $("input[name='radio']:checked").val();
		var search_word = $("#search_text").val();
		location.href = "CakeByPage?pageNum=1" + "&type=" + type
				+ "&search_word=" + search_word;
	}
</script>
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin -->		
</head>
<body>
	<%@ include file="header.jsp" %>
	<!--products-->
	<div class="products">	 
		<div class="container">
			<h2>Our Products</h2>			
			<div class="col-md-9 product-model-sec">
			<!-- 展示商品 -->
				<c:forEach var="cake" items="${subcakeList }">
					<div class="product-grid">
						<a href="SeeSingle?id=${cake.cakeId }"><!-- single.jsp -->
						
							<div class="more-product"><span> </span></div>						
							<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="${cake.path }" class="img-responsive" alt="">
							<div class="b-wrapper">
							<h4 class="b-animate b-from-left  b-delay03">							
							<button> View </button>
							</h4>
							</div>
							</div>
						</a>				
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>${cake.cakeName } #1</h4>								
							<span class="item_price">￥${cake.price }</span>
							<div class="ofr">
								<p class="pric1"><del>￥${cake.price/0.8 }</del></p>
								<p class="disc">[20% Off]</p>
							</div>
							<input type="text" class="item_quantity" value="1" />
							<!-- <input type="button" class="item_add items" value="Add"> -->
							<a href="shoppingCart?remark=add&cakeId=${cake.cakeId }" class="item_add items">Add</a>
							<!-- ${cake.cakeId} -->
							<div class="clearfix"> </div>
						</div>							
					</div>
				</div>
				</c:forEach>
			</div>	
			<div class="col-md-3 rsidebar span_1_of_left">
				<section  class="sky-form">
					<div class="product_right">
						<h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories</h4>
						<div class="tab1">
							<ul class="place">								
								<li class="sort">Regular Cakes</li>
								<li class="by"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></li>								
							</ul>
							<div class="clearfix"> </div>
							<div class="single-bottom">						
								<a href="#"><p>Cassata</p></a>
								<a href="#"><p>Cheesecake</p></a>
								<a href="#"><p>Coconut cake</p></a>
								<a href="#"><p>Cupcake</p></a>
						    </div>
					    </div>						  
						<div class="tab2">
							<ul class="place">								
								<li class="sort">Special Cakes</li>
								<li class="by"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></li>
							</ul>
							<div class="clearfix"> </div>
							<div class="single-bottom">						
								<a href="#"><p>Delicious Cakes</p></a>
								<a href="#"><p>Gingerbread</p></a>									
						    </div>
					    </div>
						<div class="tab3">
							<ul class="place">								
								<li class="sort">Eggless Cake</li>
								<li class="by"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></li>
							</ul>
							<div class="clearfix"> </div>
							<div class="single-bottom">						
								<a href="#"><p>Milk Cakes</p></a>
								<a href="#"><p>Fruits Cakes</p></a>
						    </div>
					    </div>
						<div class="tab4">
							<ul class="place">								
								<li class="sort">2-3 Tier Cakes</li>
								<li class="by"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></li>
							</ul>
							<div class="clearfix"> </div>
							<div class="single-bottom">						
								<a href="#"><p>Twist 4 tier</p></a>
								<a href="#"><p>Floral Tier</p></a>
								<a href="#"><p>Double Heartshape</p></a>
						    </div>
					    </div>
						<!--script-->
						<script>
							$(document).ready(function(){
								$(".tab1 .single-bottom").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab3 .single-bottom").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .single-bottom").hide();
								
								$(".tab1 ul").click(function(){
									$(".tab1 .single-bottom").slideToggle(300);
									$(".tab2 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
								})
								$(".tab2 ul").click(function(){
									$(".tab2 .single-bottom").slideToggle(300);
									$(".tab1 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
								})
								$(".tab3 ul").click(function(){
									$(".tab3 .single-bottom").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})
								$(".tab4 ul").click(function(){
									$(".tab4 .single-bottom").slideToggle(300);
									$(".tab5 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
								$(".tab5 ul").click(function(){
									$(".tab5 .single-bottom").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
							});
						</script>
						<!--//script -->	
					</div>
				</section>
				<!-- 按分类搜索 -->
				<section class="sky-form">
					<h4>
						<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>BY
						TYPE

					</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<input type="radio" name="radio" value="Friend" />Friend
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Lover">Lover
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Sister">Sister
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Brother">Brother
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Kids">Kids
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Parents">Parents
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Chocolate">Chocolate
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="HeartShaped">HeartShaped
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="RoundShape">RoundShape
						</div>
					</div>
				</section>			 
				<!-- 按大小搜索 -->
				<section class="sky-form">
					<h4>
						<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
						SEARCH BY SIZE
					</h4>
					<div>size:2~7</div>
					<input type="text" id="search_text" name="search"> <input
						type="button" class="search_sub" value="Search"
						onclick="search_word();">
				</section>
				<!---->
				<script type="text/javascript" src="js/jquery-ui.min.js"></script>
				<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
					<script type='text/javascript'>//<![CDATA[ 
						$(window).load(function(){
						 $( "#slider-range" ).slider({
									range: true,
									min: 0,
									max: 100000,
									values: [ 500, 100000 ],
									slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
									}
						 });
						$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

						});//]]> 
					</script>
				<!--按口味分类-->
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>By Flavour</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Vanilla</label>			
						</div>
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Chocolate</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Butterscotch</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Strawberry</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Black Forest</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Mixed Fruit</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Honey</label>
						</div>
					</div>
				</section>
				<!-- 按颜色分类 -->
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Color</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>White</label>
						</div>
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Pink</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Gold</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Silver</label>
						</div>
					</div>
				</section>			 
			</div>
			<div class="clearfix"> </div>
		</div>
		
		<div class="clearfix"></div>
		<div class="page">
			第${page.currentPage }页，共有${page.totalCount }条数据，一共${page.totalPage }页
			<a href="CakeByPage?currentPage=1&type=${type }&search_word=${size }">首页</a>
			<c:if test="${page.currentPage >1 }">
				<a href="CakeByPage?currentPage=${page.currentPage-1 }">上一页</a>
			</c:if>
			<c:if test="${page.currentPage < page.totalPage }">
				<a href="CakeByPage?currentPage=${page.currentPage+1 }">下一页</a>
			</c:if>
				<a href="CakeByPage?currentPage=${page.totalPage }&type=${type }&search_word=${size }">末页</a>
		</div>
	</div>
	<!--//products-->
	<%@ include file="footer.jsp" %>
</body>
</html>
