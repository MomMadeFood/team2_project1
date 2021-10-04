<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css" />

<div class="container-fluid mt-5">
  <div class="row" style="height: 408px">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
      <div class="row">
        <div class="col-2">
          <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <h4 class="title">신상품</h4>
            <a class="home-content-txt" id="v-pills-new-women-tab" data-toggle="pill" href="#v-pills-new-women" role="tab" aria-controls="v-pills-new-women" aria-selected="true">여성</a>
            <a class="home-content-txt" id="v-pills-new-men-tab" data-toggle="pill" href="#v-pills-new-men" role="tab" aria-controls="v-pills-new-men" aria-selected="false">남성</a>
          </div>
        </div>
        <div class="col-10">
          <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-new-women" role="tabpanel" aria-labelledby="v-pills-new-women-tab">
              <div class="swiper new_women_swiper">
                <div class="swiper-wrapper">
	                <c:forEach items="${newWomenProductList}" var="product">
	                	<div class="swiper-slide">
		                    <div class="item_box">
			                      <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
			                        <img src="${product.img1}" />
			                      </a>
			                      <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
			                        <span class="brand">${product.brand}</span>
			                        <span class="price">
			                        	₩<fmt:formatNumber pattern="#,###" value="${product.price}"/>
			                        </span>
			                      </a>
		                    </div>
	                  </div>
	                </c:forEach>
                </div>
                <div class="swiper-button-next disableButton" style="color:#8f8f8f;" id="new-women-swiper-button-next"></div>
                <div class="swiper-button-prev disableButton" style="color:#8f8f8f;" id="new-women-swiper-button-prev"></div>
              </div>
            </div>
            <div class="tab-pane fade active" id="v-pills-new-men" role="tabpanel" aria-labelledby="v-pills-new-men-tab">
           		<div class="swiper new_men_swiper">
	                <div class="swiper-wrapper">
		                <c:forEach items="${newMenProductList}" var="product">
		                	<div class="swiper-slide">
			                    <div class="item_box">
				                      <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
				                        <img src="${product.img1}" />
				                      </a>
				                      <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
				                        <span class="brand">${product.brand}</span>
				                        <span class="price">
				                        	₩<fmt:formatNumber pattern="#,###" value="${product.price}"/>
				                        </span>
				                      </a>
			                    </div>
		                  </div>
		                </c:forEach>
	                </div>
					<div class="swiper-button-next disableButton3" style="color:#8f8f8f;" id="new-men-swiper-button-next"></div>
					<div class="swiper-button-prev disableButton3" style="color:#8f8f8f;" id="new-men-swiper-button-prev"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-2"></div>
  </div>
</div>
<div class="container-fluid">
  <div class="row" style="height: 408px">
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
    <div class="row">
      <div class="col-2">
        <div class="nav flex-column nav-pills" id="v-pills-tab2" role="tablist" aria-orientation="vertical">
          <h4 class="title">베스트</h4>
          <a class="home-content-txt" id="v-pills-best-men-tab" data-toggle="pill" href="#v-pills-best-men" role="tab" aria-controls="v-pills-best-men"aria-selected="false" >남성</a>
          <a class="home-content-txt" id="v-pills-best-women-tab" data-toggle="pill" href="#v-pills-best-women" role="tab" aria-controls="v-pills-best-women" aria-selected="true">여성</a>
        </div>
      </div>
      <div class="col-10">
        <div class="tab-content" id="v-pills-tabContent">
          <div class="tab-pane fade show active" id="v-pills-best-men" role="tabpanel" aria-labelledby="v-pills-best-men-tab">
            <div class="swiper best_men_swiper">
              <div class="swiper-wrapper">
               <c:forEach items="${bestMenProductList}" var="product">
                 <div class="swiper-slide">
	               <div class="item_box">
		             <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
		               <img src="${product.img1}" />
		             </a>
		             <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
		               <span class="brand">${product.brand}</span>
		               <span class="price">
		               	 ₩<fmt:formatNumber pattern="#,###" value="${product.price}"/>
		               </span>
		             </a>
	               </div>
                  </div>
                </c:forEach>
              </div>
              <div class="swiper-button-next disableButton2" style="color:#8f8f8f;" id="best-men-swiper-button-next"></div>
              <div class="swiper-button-prev disableButton2" style="color:#8f8f8f;" id="best-men-swiper-button-prev"></div>
            </div>
          </div>
          <div class="tab-pane fade active" id="v-pills-best-women" role="tabpanel" aria-labelledby="v-pills-best-women-tab">
            <div class="swiper best_women_swiper">
              <div class="swiper-wrapper">
               <c:forEach items="${bestWomenProductList}" var="product">
                 <div class="swiper-slide">
	               <div class="item_box">
		             <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
		               <img src="${product.img1}" />
		             </a>
		             <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
		               <span class="brand">${product.brand}</span>
		               <span class="price">
		               	 ₩<fmt:formatNumber pattern="#,###" value="${product.price}"/>
		               </span>
		             </a>
	               </div>
                  </div>
                </c:forEach>
              </div>
              <div class="swiper-button-next disableButton4" style="color:#8f8f8f;" id="best-women-swiper-button-next"></div>
              <div class="swiper-button-prev disableButton4" style="color:#8f8f8f;" id="best-women-swiper-button-prev"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-2"></div>
</div>
      <script>
        var newWomenSwiper = new Swiper(".new_women_swiper", {
          slidesPerView: 4,
          slidesPerGroup: 1,
          loopFillGroupWithBlank: false,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          allowTouchMove: false,
        });
        
        var newMenSwiper = new Swiper(".new_men_swiper", {
           slidesPerView: 4,
           slidesPerGroup: 1,
           loopFillGroupWithBlank: false,
           navigation: {
             nextEl: ".swiper-button-next",
             prevEl: ".swiper-button-prev",
           },
           allowTouchMove: false,
         });
        
        var bestMenSwiper= new Swiper(".best_men_swiper", {
          slidesPerView: 4,
          slidesPerGroup: 1,
          loopFillGroupWithBlank: false,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          allowTouchMove: false,
        });
        
        var bestWomenSwiper= new Swiper(".best_women_swiper", {
            slidesPerView: 4,
            slidesPerGroup: 1,
            loopFillGroupWithBlank: false,
            navigation: {
              nextEl: ".swiper-button-next",
              prevEl: ".swiper-button-prev",
            },
            allowTouchMove: false,
          });
        
		$(document).ready(function () {
			
			if (newWomenSwiper.isBeginning) {
				$("#new-women-swiper-button-prev").hide();
			}
			if (newMenSwiper.isBeginning) {
				$("#new-men-swiper-button-prev").hide();
			}
			if (bestMenSwiper.isBeginning) {
		     	$("#best-men-swiper-button-prev").hide();
		    }
			
			if (bestWomenSwiper.isBeginning) {
		     	$("#best-women-swiper-button-prev").hide();
		    }
	         
			$(".disableButton").on("click", function () {
				if (newWomenSwiper.isBeginning) {
					$("#new-women-swiper-button-prev").hide();
				} else if (newWomenSwiper.isEnd) {
					$("#new-women-swiper-button-next").hide();
				} else {
					$("#new-women-swiper-button-prev").show();
					$("#new-women-swiper-button-next").show();
				}
			});
			
			
			$(".disableButton3").on("click", function () {
				if (newMenSwiper.isBeginning) {
					$("#new-men-swiper-button-prev").hide();
				} else if (newMenSwiper.isEnd) {
					$("#new-men-swiper-button-next").hide();
				} else {
					$("#new-men-swiper-button-prev").show();
					$("#new-men-swiper-button-next").show();
				}
			});
         
         
          $(".disableButton2").on("click", function () {
            if (bestMenSwiper.isBeginning) {
              $("#best-men-swiper-button-prev").hide();
            } else if (bestMenSwiper.isEnd) {
              $("#best-men-swiper-button-next").hide();
            } else {
              $("#best-men-swiper-button-prev").show();
              $("#best-men-swiper-button-next").show();
            }
          });
        });
		
        $(".disableButton4").on("click", function () {
            if (bestWomenSwiper.isBeginning) {
              $("#best-women-swiper-button-prev").hide();
            } else if (bestWomenSwiper.isEnd) {
              $("#best-women-swiper-button-next").hide();
            } else {
              $("#best-women-swiper-button-prev").show();
              $("#best-women-swiper-button-next").show();
            }
          });
		
      </script>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
