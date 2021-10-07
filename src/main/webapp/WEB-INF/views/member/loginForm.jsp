<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css/">
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm.css" />
<script src="https://kit.fontawesome.com/90405714d1.js" crossorigin="anonymous"></script>

<div class="container-fluid" style="margin-top:200px">
	<div class="row mb-5">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 d-flex justify-content-center">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="HANDSOME" class="ml-3" />
		</div>
		<div class="col-sm-2"></div>
	</div>

</div>


<div style="width:440px; margin: 0px auto;">
	<div class="login-box">
		<div class="mt-4">
			<div class="title_wrap member-text">로그인</div>
		</div>
		<div class="pl-5 pr-5 mb-4">
			<form method="post" action="${pageContext.request.contextPath}/login">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="loginForm-container mt-3" style="width:100%">
					<div>
					    <div class="loginForm-item" style="width:10%;">
							<i class="fas fa-user fa-lg mr-2" style="margin-top:7px;"></i>
						</div>
					    <div class="loginForm-item" style="width:90%;">
							<input style="width:100%;" id="id" name="id" type="text">
						</div>
					</div>
				</div>
				<div class="loginForm-container mt-3" style="width:100%">
					<div style="">
					    <div class="loginForm-item" style="width:10%; ">
							<i class="fas fa-lock fa-lg mr-2" style="margin-top:7px;"></i>
						</div>
					    <div class="loginForm-item" style="width:90%;">
							<input style="width:100%;" id="password" name="password" type="password">
						</div>
					</div>
				</div>
				<div class="mt-1">
					<input id="save_id" name="save_id" type="checkbox" class="mt-3">
					<label for="save_id" class="join_txt2">아이디 저장</label>
				</div>
				<c:if test="${loginFailMsg !=null}">
					<div class="alert alert-danger" role="alert" style="padding: 6; font-size: 12;">
						${loginFailMsg}
					</div>
				</c:if>
				<div class="mt-3">
					<button type="submit" class="btn btn-lg btn-dark btn-block btn-join">로그인</button>
				</div>
			</form>
			
		</div>
	</div>
</div>
