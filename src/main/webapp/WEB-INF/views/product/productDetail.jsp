<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style type="text/css">
	@import url("/resources/css/productDetail.css");
</style>
<script type="text/javascript">
	
		function reduceSum() {
			let sum = parseInt($(".qty_input").val());
			let total = document.querySelector(".pd-price span").innerHTML
					.substr(1);
			if (sum > 1) {
				sum = sum - 1;
			}
			$(".qty_input").val(sum);
			let temp = "";
			for (var i = 0; i < total.length; i++) {
				if (total.charAt(i) != ',') {
					temp = temp + total.charAt(i);
				}
			}
			temp = parseInt(temp);
			temp = temp * sum;
			let price = String(temp);
			let ans = "";
			let cnt = 0;
			for (var i = price.length - 1; i >= 0; i--) {
				cnt++;
				ans = price.charAt(i) + ans;
				if (i > 0 && cnt % 3 == 0) {
					ans = "," + ans;
				}
			}
			document.querySelector("#totalPrice").innerHTML = "₩" + ans;
		}
		function increaseSum() {
			let sum = parseInt($(".qty_input").val());
			let total = document.querySelector(".pd-price span").innerHTML
					.substr(1);
			sum = sum + 1;
			$(".qty_input").val(sum);
			let temp = "";
			for (var i = 0; i < total.length; i++) {
				if (total.charAt(i) != ',') {
					temp = temp + total.charAt(i);
				}
			}
			temp = parseInt(temp);
			temp = temp * sum;
			let price = String(temp);
			let ans = "";
			let cnt = 0;
			for (var i = price.length - 1; i >= 0; i--) {
				cnt++;
				ans = price.charAt(i) + ans;
				if (i > 0 && cnt % 3 == 0) {
					ans = "," + ans;
				}
			}
			document.querySelector("#totalPrice").innerHTML = "₩" + ans;
		}
		
		function putCart() {
			closeAllAlert();
			if($("input[name=psize]:checked").length === 0) {
				$("#cart-warn-message").html("사이즈를 선택해주세요<button type='button' class='close' onclick='closeWarnAlert();''><span aria-hidden='true'>&times;</span>");
				$("#cart-warn-alert").show();
			} else {
				let cartData = new Object();
				cartData.productDetailNo = $("input[name=productDetailNo]").val();
				cartData.amount = $("input[name=amount]").val();
				cartData.psize = $("input[name=psize]:checked").val();
				
				let jsonData = JSON.stringify(cartData);
				console.log(jsonData);
				
				$.ajax({
					url: "putCart",
					type: "POST",
					data: jsonData,
					dataType : "json",
					contentType: 'application/json',
					success: function(data) {
						if(data.result === "success") {
							$('#cart-alert').show();
						} else if(data.result === "errer-login") {
							location.href="/member/loginForm";
						} else if(data.result === "error-stock") {
							$("#cart-error-message").text("매진된 상품입니다. <button type='button' class='close' onclick='closeErrorAlert();''><span aria-hidden='true'>&times;</span>");
							$("#cart-error-alert").show();
						} else if(data.result === "warn-stock") {
							$("#cart-warn-message").html("상품의 재고가 부족합니다. 최대 구매 가능 수량은 " + data.amount + "개입니다. <a href='/cart' class='alert-link'>장바구니 바로가기</a><button type='button' class='close' onclick='closeWarnAlert();''><span aria-hidden='true'>&times;</span>");
							$("#cart-warn-alert").show();
							
						} else if(data.result === "warn-add") {
							$("#cart-warn-message").html("이미 담겨있는 상품입니다. 총 " + data.amount + "개의 상품이 장바구니에 담겼습니다. <a href='/cart' class='alert-link'>장바구니 바로가기</a><button type='button' class='close' onclick='closeWarnAlert();''><span aria-hidden='true'>&times;</span> ");
							$("#cart-warn-alert").show();
							
						}
					},
					error: function(request,status,error) {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		 }
		
		function closeAlert() {
			$('#cart-alert').hide();
		}
		function closeWarnAlert() {
			$('#cart-warn-alert').hide();
		}
		function closeErrorAlert() {
			$('#cart-error-alert').hide();
		}
		function closeAllAlert() {
			closeAlert();
			closeWarnAlert();
			closeErrorAlert();
		}
		
	
	</script>	
	
		<div class="position-fixed c-div-alert">
			<div class="alert alert-dark  alert-dismissible fade show" style="display:none;" id="cart-alert" role="alert">
				  장바구니에 상품이 담겼습니다. <a href="/cart" class="alert-link">장바구니 바로가기</a><button type="button" class="close" onclick="closeAlert();"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="alert alert-danger alert-dismissible fade show" style="display:none;" id="cart-error-alert" role="alert">
				 <span id="cart-error-message"></span>
				  <button type="button" class="close" onclick="closeErrorAlert()">
				  <span aria-hidden="true">&times;</span>
	  			</button>
			</div>
			<div class="alert alert-warning alert-dismissible fade show" style="display:none;" id="cart-warn-alert" role="alert">
				 <span id="cart-warn-message"></span>
				  <button type="button" class="close" onclick="closeWarnAlert()">
				  <span aria-hidden="true">&times;</span>
	  			</button>
			</div>
	</div>


<div class="container-fluid c-div-content">
	
	<div class="row" style="margin-top: 20px; width: 990px; margin:0px auto;">
		<div style="width: 10%;"></div>
		<div style="width: 80%;">
			<div class="row">
				<div style="width: 55%;"> 
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						  <ol class="carousel-indicators">
						    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						  </ol>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="${productDetail.img1}" class="d-block w-100 img-fluid" >
						    </div>
						    <div class="carousel-item">
						    	<img src="${productDetail.img2} "class="d-block w-100 img-fluid" >
						    </div>
						    <div class="carousel-item">
						    	<img src="${productDetail.img3} "class="d-block w-100 img-fluid" >
						    </div>
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>		
				</div>
				<div style="width: 5%;">
				</div>
				<div style="width: 40%;">
					<div class="pd_item_detail_info float_right" id="contentDiv">
						<div class="info">
							<div class="info_sect">
								<div class="brand-name">
									<span class= "pd-name">${productDetail.brand }</span>
								</div>
								<h4 class="item_name">
									<span class="pd-name">${productDetail.name}</span> 
								</h4>
								<p class="pd-price">
									<span>₩${productDetail.price}</span>
								</p>
								<div class="prod-detail-con-box">
									<strong class="number-code mt-2">상품품번 &#58; <span>${productDetail.productDetailNo}</span></strong>
									<div class="pd-round-style"
										style="border-radius: 20px; background-color: #F5F5F5; color: #555555">
										<p class="pd_p description mb-4">${productDetail.content}</p>
									</div>      
                                </div>
                               </div>
                                <%-- <form:form commandName="cartDTO" id="cart-form"  onsubmit="checkData(this)" action="cart"> --%>
                                	<input type="hidden" name="productDetailNo" value="${productDetail.productDetailNo}">
                                <div class="pd-info">
                                	<ul>
                                 		<li style="display:flex" class="pd-colors">
                           					<span class="product-subtitle mr-3">색상</span>
                           					<c:forEach items="${productDetailMap}" var="i" >
                               					<a href="${pageContext.request.contextPath}/product/productDetail?no=${i.key}" style="margin-top: 5px;">
                               						<img src= "${i.value}"  width="30px">
                           						</a>
                   							</c:forEach>
                   						</li>
                                   		
                                 		 <li class="pd-size">
                                    	 		<span class="product-subtitle">사이즈</span>
                                    	 		<c:forEach items="${sizeList}" var="size">
                                    	 			<label><input type="radio" name="psize" value="${size}"/><span>${size}</span></label>
                                   	 			</c:forEach>	                                      
                                   		</li>
                                   
                                 		<li>
                                 			<span class="product-subtitle">남은 수량</span>
                                 			<span style="mr-2">${productSizePrice.amount}</span> <!-- 나중에 ajax이용  -->
                                 		</li>
                                     	<li>
                                     		<span class="product-subtitle">수량</span>
                                             <button class="qty_left" type="button" onclick="reduceSum()">-</button>
                                             <input type="text" name="amount" value="1" class="qty_input" />
                                             <button class="qty_right" type="button" onclick="increaseSum()">+</button>
                                         </li>
                                     </ul>
                                     <ul>
                                     	<li>
                                     		<span class="pd-title">총 합계</span>
                                     		<span class="pd-text" id="totalPrice">₩${productDetail.price}</span> 
                                     	</li>
                                     </ul>	
                                </div>
                                 <button class="cart_lg_btn_wt" style="width:300px" onclick="putCart()">쇼핑백 담기</button>
                                
	                        </div>
	                    </div>
	                    <div id="pd-div-putCartResult">
                                	
                        </div>
	                </div>
            	</div>
        	</div>  
     	</div>
       	<div style="width: 10%;"></div>
	</div>   

	

<%@ include file="/WEB-INF/views/common/footer.jsp"%>