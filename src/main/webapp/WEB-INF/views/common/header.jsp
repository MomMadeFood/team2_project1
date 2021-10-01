<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />


<!-- 사진 swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/_ui/common/css/footer.css" media="all"/>
<script src="https://kit.fontawesome.com/90405714d1.js" crossorigin="anonymous"></script>

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


      <div class="top-bar">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <a href="#" class=""><span class="mr-2 "></span> <span class="d-none d-md-inline-block">HOME</span></a>
              <span class="mx-md-2 d-inline-block"></span>
           
              <div class="float-right">


                <a href="#" class=""><span class="mr-2 "></span> <span class="d-none d-md-inline-block">MyPage</span></a>

              </div>

            </div>

          </div>

        </div>
      </div>

      <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">


            <div class="site-logo">
              <a href="index.html" class="text-black"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="HANDSOME" class="ml-3" /></a>
            </div>

            <div class="col-12">
              <nav class="site-navigation text-center ml-auto " role="navigation">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">

                  <li class="has-children">
                    <a href="#about-section" class="nav-link">대분류</a>
                    <ul class="dropdown arrow-top">
                      <li class="has-children">
                        <a href="#">중분류</a>
                        <ul class="dropdown">
                          <li><a href="#">소분류</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li class="has-children">
                    <a href="#about-section" class="nav-link">대분류</a>
                    <ul class="dropdown arrow-top">
                      <li class="has-children">
                        <a href="#">중분류</a>
                        <ul class="dropdown">
                          <li><a href="#">소분류</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  
                  <li class="has-children">
                    <a href="#about-section" class="nav-link">대분류</a>
                    <ul class="dropdown arrow-top">
                      <li class="has-children">
                        <a href="#">중분류</a>
                        <ul class="dropdown">
                          <li><a href="#">소분류</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  
                  <li><a href="#why-us-section" class="nav-link">이벤트</a></li>
                </ul>
              </nav>

            </div>

            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>
        </div>

      </header>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
		