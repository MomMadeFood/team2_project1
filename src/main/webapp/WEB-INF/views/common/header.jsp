<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SpringFramework</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/app.css" />

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/_ui/common/css/footer.css"
  media="all"
/>
</head>
<body>
	<div class="container-fluid" id="header">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-7">
				<ul class="nav nav-pills">
					<li class="nav-item header"><a class="nav-link" href="#">HOME</a>
					</li>
					<li class="nav-item header"><span class="nav-link">로그인
							후 아래 '브랜드' 메뉴에서 좋아하는 브랜드를 ♥해주세요</span></li>
				</ul>
			</div>
			<div class="col-3">
				<ul class="nav nav-pills">
					<li class="nav-item header"><a class="nav-link" href="#">로그인</a>
					</li>
					<li class="nav-item header"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">마이페이지</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">주문조회</a>
						</div></li>
				</ul>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<div class="container-fluid mt-3 mb-5">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 d-flex justify-content-between">
				<div>
					<a href="#"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="HANDSOME"
						class="ml-3" /></a>
				</div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="#">브랜드</a></li>
					<li class="nav-item"><a class="nav-link" href="#">여성</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">남성</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">키즈</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">뷰티</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">라이프스타일</a></li>
				</ul>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="#">기획전</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">THE 매거진</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">편집샵</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">룩북</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">아울렛*</a></li>
				</ul>
				<div></div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>