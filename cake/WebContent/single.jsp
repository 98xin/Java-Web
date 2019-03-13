<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>single</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<script src="js/imagezoom.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">
	
</script>
<!-- cart -->
<!-- FlexSlider -->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
	});
</script>
<!--//FlexSlider -->
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	<!--//header-->

	<!--//single-page-->
	<div class="single">
		<div class="container">
			<div class="single-grids">
				<c:if test="${not empty cake }">
					<div class="col-md-4 single-grid">
						<div class="flexslider">
							<ul class="slides">
								<li data-thumb="${cake.smallpicture1 }">
									<div class="thumb-image">
										<img src="${cake.smallpicture1 }" data-imagezoom="true"
											class="img-responsive">
									</div>
								</li>
								<li data-thumb="${cake.smallpicture2 }">
									<div class="thumb-image">
										<img src="${cake.smallpicture2 }" data-imagezoom="true"
											class="img-responsive">
									</div>
								</li>
								<li data-thumb="${cake.smallpicture3 }">
									<div class="thumb-image">
										<img src="${cake.smallpicture3 }" data-imagezoom="true"
											class="img-responsive">
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 single-grid simpleCart_shelfItem">
						<h3>Yummy freshly baked Blackforest Cake 1 Kg! with blends of
							chocochips</h3>
						<p>${cake.introduce }</p>
						<ul class="size">
							<h3>Size</h3>
							<li><a href="#">${cake.size } KG</a></li>
						</ul>
						<ul class="size">
							<h3>2-3 Tier Cakes</h3>
							<li><a href="#">1 Step</a></li>
							<li><a href="#">2 Step</a></li>
							<li><a href="#">3 Step</a></li>
						</ul>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">￥${cake.price }</h5>
							</div>
							<div class="rating">
								<!-- 循环五个星星 -->
								<c:forEach begin="1" end="5">
									<span>☆</span>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
						</div>
						<p class="qty">Qty :</p>
						<input min="1" type="number" id="quantity" name="quantity"
							value="1" class="form-control input-small">
						<div class="btn_form">
							<a href="shoppingCart?remark=add&cakeId=${cake.cakeId }" class="add-cart item_add">ADD TO CART</a>
						</div>
						<div class="tag">
							<p>
								Category : <a href="#"> Cakes</a>
							</p>
							<p>
								Tag : <a href="#"> Lorem ipsum </a>
							</p>
						</div>
					</div>
				</c:if>
				<div class="col-md-4 single-grid1">
					<h2>Account</h2>
					<ul>
						<li><a href="#">Offers</a></li>
						<li><a href="CakeByPage">New products</a></li>
						<li><a href="account.jsp">Register</a></li>
						<li><a href="account.jsp">Forgot Your Password</a></li>
						<li><a href="account.jsp">My account</a></li>
						<li><a href="contact.jsp">Address</a></li>
						<li><a href="#">wishlist</a></li>
						<li><a href="#">Order history</a></li>
						<li><a href="#">Downloads</a></li>
						<li><a href="#">Reward points</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- collapse -->
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> Description </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								additional information </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree"> reviews
								(5) </a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour"> help </a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//collapse -->
	<!--related-products-->
	<div class="related-products">
		<div class="container">
			<h3>Related Products</h3>
			<div class="product-model-sec single-product-grids">
				<div class="product-grid single-product">
					<a href="single.jsp">
						<div class="more-product">
							<span> </span>
						</div>
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="images/m1.png" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">
									<button>View</button>
								</h4>
							</div>
						</div>
					</a>
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>Product #1</h4>
							<span class="item_price">$2000</span>
							<div class="ofr">
								<p class="pric1">
									<del>$2300</del>
								</p>
								<p class="disc">[15% Off]</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="product-grid single-product">
					<a href="single.jsp">
						<div class="more-product">
							<span> </span>
						</div>
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="images/m2.png" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">
									<button>View</button>
								</h4>
							</div>
						</div>
					</a>
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>Product #1</h4>
							<span class="item_price">$2000</span>
							<div class="ofr">
								<p class="pric1">
									<del>$2300</del>
								</p>
								<p class="disc">[15% Off]</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="product-grid single-product">
					<a href="single.jsp">
						<div class="more-product">
							<span> </span>
						</div>
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="images/m3.png" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">
									<button>View</button>
								</h4>
							</div>
						</div>
					</a>
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>Product #1</h4>
							<span class="item_price">$2000</span>
							<div class="ofr">
								<p class="pric1">
									<del>$2300</del>
								</p>
								<p class="disc">[15% Off]</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="product-grid single-product">
					<a href="single.jsp">
						<div class="more-product">
							<span> </span>
						</div>
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="images/m4.png" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">
									<button>view</button>
								</h4>
							</div>
						</div>
					</a>
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>Product #1</h4>
							<span class="item_price">$2000</span>
							<div class="ofr">
								<p class="pric1">
									<del>$2300</del>
								</p>
								<p class="disc">[15% Off]</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--related-products-->

	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!-- //footer -->
</html>
