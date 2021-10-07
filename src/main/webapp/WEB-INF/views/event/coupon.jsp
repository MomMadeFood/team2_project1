<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coupon.css" />

<script type="text/javascript">
	function issueCoupon(cNo) {
		closeAllAlert();
		$.ajax({
			url: "/event/issueCoupon",
			type: "POST",
			data: {couponNo : cNo},
			success: function(data) {
				console.log(data);
				if(data.result === "success") {
					$("#coupon-message").text("쿠폰이 발급되었습니다.");
					$("#coupon-alert").show();
				} if(data.result === "success-expire") {
					$("#coupon-message").text("쿠폰이 발급되었습니다. 쿠폰 유효기간 내에 사용하시기 바랍니다.");
					$("#coupon-alert").show();
				} else if(data.result === "errer-login") {
					location.href="/member/loginForm";
				} else if(data.result === "error-duplicate") {
					$("#coupon-error-message").text("이미 발급된 쿠폰입니다.");
					$("#coupon-error-alert").show();
				} else if(data.result === "error-end") {
					$("#cart-warn-message").text("종료된 이벤트입니다.");
					$("#cart-warn-alert").show();
				} else if(data.result === "error-stock") {
					$("#cart-warn-message").text("쿠폰 발급 가능 개수가 없습니다.");
					$("#cart-warn-alert").show();
				}
			},
			error: function(request,status,error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}) 
		
	}
	
	function closeAlert() {
		$('#coupon-alert').hide();
	}
	function closeWarnAlert() {
		$('#coupon-warn-alert').hide();
	}
	function closeErrorAlert() {
		$('#coupon-error-alert').hide();
	}
	function closeAllAlert() {
		closeAlert();
		closeWarnAlert();
		closeErrorAlert();
	}
	</script>
		<div class="position-fixed c-div-alert">
		<div class="alert alert-danger alert-dismissible fade show" style="display:none;" id="coupon-error-alert" role="alert">
			 <span id="coupon-error-message"></span>
			  <button type="button" class="close" onclick="closeErrorAlert()">
			  <span aria-hidden="true">&times;</span>
  			</button>
		</div>
		<div class="alert alert-warning alert-dismissible fade show" style="display:none;" id="coupon-warn-alert" role="alert">
			 <span id="coupon-warn-message"></span>
			  <button type="button" class="close" onclick="closeWarnAlert()">
			  <span aria-hidden="true">&times;</span>
  			</button>
		</div>
		<div class="alert alert-dark  alert-dismissible fade show" style="display:none;" id="coupon-alert" role="alert">
			<span id="coupon-message"></span> <button type="button" class="close" onclick="closeAlert();"><span aria-hidden="true">&times;</span></button>
		</div>
	</div>
	
    <div>
      <div style="border-bottom: 1px solid #E5E5E5; height:100px; vertical-align:center;margin-bottom:40px;">
        <div style="margin:auto; padding-top:30px; width:300px; text-align:center; vertical-align:middle;">
          <p style="font-size: 28px;">쿠폰 이벤트</p>
        </div>
        
      </div>
      <div class="container-fluid" style="margin:0px auto; width:990px;">
      	<div>
  		  <ul class="nav nav-tabs coupon-tab" id="myTab" role="tablist" >
		    <li class="nav-item coupon-tab-item" role="presentation">
		      <a class="nav-link active" id="brand-tab" data-toggle="tab" href="#brand" role="tab" aria-controls="home" aria-selected="true"><span>브랜드 쿠폰</span></a>
		    </li>
		    <li class="nav-item coupon-tab-item" role="presentation">
		      <a class="nav-link" id="welcome-tab" data-toggle="tab" href="#welcome" role="tab" aria-controls="profile" aria-selected="false"><span>웰컴 쿠폰</span></a>
		    </li>
		    <li class="nav-item coupon-tab-item" role="presentation">
		      <a class="nav-link" id="event-tab" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false"><span>선착순 쿠폰</span></a>
		    </li>
		  </ul>
		  <div class="tab-content mt-5 d-flex" id="myTabContent">
		      <div class="tab-pane fade show active" id="brand" role="tabpanel" aria-labelledby="brand-coupon-tab" style="width:100%">
		     	<c:forEach items="${brandCouponList}" var="brandCoupon">
		     	  <div class="card coupon-item">
			  	    <img height="142px" src="${brandCoupon.img}" class="card-img-top" alt="...">
				   <div class="card-body">
				      <h5 class="card-title">${brandCoupon.title}</h5>
				      <p class="card-text">
				    	  <b>${brandCoupon.discount}<c:if test="${brandCoupon.discountType==1}">% </c:if><c:if test="${brandCoupon.discountType==2}">만원 </c:if>할인 쿠폰</b> <br/>
				      	  ${brandCoupon.content}
				      </p>
				       <a onclick="issueCoupon('${brandCoupon.couponNo}')" href="#" class="btn btn-dark" style="color:white;">다운받기 <i class="fas fa-download" style="color:white;"></i></a>
				    </div>
				  </div>
				</c:forEach>
			  </div>
		      <div class="tab-pane fade" id="welcome" role="tabpanel" aria-labelledby="welcome-coupon-tab" style="width:100%">
		      	<c:forEach items="${welcomeCouponList}" var="welcomeCoupon">
		     	  <div class="card coupon-item">
			  	    <img height="142px" src="${welcomeCoupon.img}" class="card-img-top" alt="...">
				   <div class="card-body">
				      <h5 class="card-title" style="font-weight:800">${welcomeCoupon.title}</h5>
				      <p class="card-text">
				    	  <b>${welcomeCoupon.discount}<c:if test="${welcomeCoupon.discountType==1}">% </c:if><c:if test="${welcomeCoupon.discountType==2}">만원 </c:if>할인 쿠폰</b> <br/>
				      	  ${welcomeCoupon.content}
				      </p>
				       <a onclick="issueCoupon('${welcomeCoupon.couponNo}')" class="btn btn-dark" style="color:white;">다운받기 <i class="fas fa-download" style="color:white;"></i></a>
				    </div>
				  </div>
				</c:forEach>
			  </div>
		      <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="event-coupon-tab" style="width:100%">
				<c:forEach items="${eventCouponList}" var="eventCoupon">
		     	  <div class="card coupon-item" style="height: 350px;">
			  	    <img height="160px" src="${eventCoupon.img}" class="card-img-top" alt="...">
				   <div class="card-body">
				      <h5 class="card-title" style="font-weight:800">${eventCoupon.title}</h5>
				      <p class="card-text">
				    	  <b>${eventCoupon.discount}<c:if test="${eventCoupon.discountType==1}">% </c:if><c:if test="${eventCoupon.discountType==2}">만원 </c:if>할인 쿠폰</b> <br/>
				      	  ${eventCoupon.content}
				      </p>
				      <a onclick="issueCoupon('${eventCoupon.couponNo}')" class="btn btn-dark" style="color:white;">다운받기 <i class="fas fa-download" style="color:white;"></i></a>
				    </div>
				  </div>
				</c:forEach>
			  </div>
		  </div>
  	    </div>
    </div>
  </div>
  
  <script>

/*     function colorChange(){
      if(document.querySelector("#c2").style.backgroundColor == "white"){
        document.querySelector("#c2").style.backgroundColor = "red";
      }else{
        document.querySelector("#c2").style.backgroundColor = "white";
      }
    }

   
    
    function clickBtn(){
    	alert("쿠폰 획득에 성공했습니다!");
    	let myBtn = document.querySelector("#my-btn");
    	myBtn.className = 'btn btn-primary';
    	myBtn.innerHTML = "성공";
    	$("#my-btn").attr("disabled", true);
    	
    }
    
    $("document").ready(function(){

      let myBtn = document.querySelector("#my-btn");
      var timer = setInterval(colorChange,200);
      var time = 1000;
      let myTime1 = document.querySelector("#my-time1");
      let myTime2 = document.querySelector("#my-time2");
      let myTime3 = document.querySelector("#my-time3");
      let clickBtn = document.querySelector("#cick-btn");
      var stopWatch = setInterval(function(){
        let sec = parseInt(time/100);
        let psec = time%100;
        myTime1.innerHTML = sec;
        myTime2.innerHTML = psec;
        time--;
      },10)
      setTimeout(function(){
    	clearInterval(stopWatch);
        clearInterval(timer);
        myBtn.className = 'btn btn-success';
        myBtn.innerHTML = "Click!!"
        document.querySelector("#c2").style.backgroundColor = "white";
        myTime1.innerHTML = "";
        myTime2.innerHTML = "";
        myTime3.innerHTML = "";
        $("#my-btn").attr("disabled", false);
      },10000);
    })

     */


  </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
