<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SpringFramework</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css/">
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />

<!-- 사진 swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/90405714d1.js" crossorigin="anonymous"></script>

<!-- header -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>

</head>
<body>
	<div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>


      <header class="site-navbar js-sticky-header site-navbar-target mb-5" role="banner" style="background-color:#F5F5F5">

        <div class="container">
          <div class="row position-relative">


            <div class="mt-4">
              <a href="/" class="text-black"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="HANDSOME" class="ml-3" /></a>
            </div>

            <div style="width:60%;">
              <nav class="site-navigation text-center ml-auto " role="navigation">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">

                  <li class="has-children">
                    <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO" class="nav-link h-a-lg" style="font-size:13pt;">WOMEN</a>
                    <ul class="dropdown arrow-top">
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO01">OUTER</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO02">DRESS</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO03">SKIRT</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO04">TOP</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO05">PANTS</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO10">SPECIAL SHOP</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=WO11">FASHION ACC</a>
                      </li>
                    </ul>
                  </li>
                  <li class="has-children">
                    <a href="${pageContext.request.contextPath}/product/productList?categoryId=ME" class="nav-link" style="font-size:13pt;">MEN</a>
                    <ul class="dropdown arrow-top">
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=ME01">OUTER</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=ME04">TOP</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=ME05">PANTS</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=ME10">SPECIAL SHOP</a>
                      </li>
                    </ul>
                  </li>
                  
                  <li class="has-children">
                    <a href="${pageContext.request.contextPath}/product/productList?categoryId=KI" class="nav-link h-a-lg" style="font-size:13pt;">KIDS</a>
                    <ul class="dropdown arrow-top">
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=KI06">CLOTHING</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=KI08">KIDS ACC</a>
                      </li>
                    </ul>
                  </li>
                  
                  <li class="has-children">
                    <a href="${pageContext.request.contextPath}/product/productList?categoryId=LI" class="nav-link h-a-lg" style="font-size:13pt;">LIFE</a>
                    <ul class="dropdown arrow-top">
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=LI07">BATH</a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath}/product/productList?categoryId=LI09">HOME</a>
                      </li>
                    </ul>
                  </li>
                  
                  <li><a href="${pageContext.request.contextPath}/event/coupon" class="nav-link h-a-lg" style="font-size:13pt;">EVENT</a></li>
                </ul>
              </nav>

            </div>
            
            <div class="mt-1" style="width:20%;">
              <nav class="site-navigation text-center ml-auto " role="navigation">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
           			<li>
           			 <a href="${pageContext.request.contextPath}/cart" class=""><i class="fas fa-shopping-cart fa-lg"></i></a>
					</li>
					<li>
           			 <a href="${pageContext.request.contextPath}/order/orderList" class=""><i class="fas fa-clipboard-list fa-lg"></i></a>
					</li>
					<sec:authorize access="isAnonymous()">
						<li>
		           			 <a href="${pageContext.request.contextPath}/member/loginForm" class=""><i class="fas fa-sign-in-alt fa-lg" style="color:#8db5ff;"></i></a>
						</li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li style="padding: 12px;">
							<form method="post" action="${pageContext.request.contextPath}/logout" class="d-inline-block">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button type="submit" style="border: none; background-color:transparent;"><i class="fas fa-sign-out-alt fa-lg" style="color:#ff7a7a;"></i></button> 
							</form>
						</li>
					</sec:authorize>
                </ul>   
              </nav>
            </div>
          </div>
        </div>

      </header>
