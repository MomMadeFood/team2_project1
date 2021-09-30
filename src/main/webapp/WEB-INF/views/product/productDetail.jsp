<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container-fluid">
	<script type="text/javascript">
		function reduceSum() {
			let sum = parseInt($(".qty_input").val());
			let total = document.querySelector(".price span").innerHTML
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
			let total = document.querySelector(".price span").innerHTML
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
	</script>
	<div class="row" style="margin-top: 20px; width: 990px; margin:0px auto;">
		<div style="width: 10%;"></div>
		<div style="width: 80%">
			<div class="row">
				<div style="width: 55%"> 
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						  <ol class="carousel-indicators">
						    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
						  </ol>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_CR_W01.jpg/dims/resize/684x1032" class="d-block w-100 img-fluid" >
						    </div>
						    <div class="carousel-item">
						      <img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_CR_W02.jpg/dims/resize/684x1032" class="d-block w-100 img-fluid" >
						    </div>
						    <div class="carousel-item">
						      <img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_CR_W03.jpg/dims/resize/684x1032" class="d-block w-100 img-fluid" >
						    </div>
   						    <div class="carousel-item">
						      <img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_BK_W01.jpg/dims/resize/684x1032/" class="d-block w-100 img-fluid">
						    </div>
   						    <div class="carousel-item">
						      <img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_BK_W02.jpg/dims/resize/684x1032/" class="d-block w-100 img-fluid">
						    </div>
   						    <div class="carousel-item">
						      <img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_BK_W03.jpg/dims/resize/684x1032/" class="d-block w-100 img-fluid">
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
					<div class="item_detail_info float_right" id="contentDiv">
						<div class="info">
							<div class="info_sect">
								<div class="brand-name">
									<a href="http://www.thehandsome.com/ko/c/br45/br45">O'2nd</a>
								</div>
								<h4 class="item_name">
									<span class="name ko_fir_spel"> 펄 돌먼 점퍼</span> 
								</h4>
								<p class="price">
									<span>₩598,000</span>
								</p>
								<div class="prod-detail-con-box">
									<strong class="number-code mt-2">상품품번 &#58; <span>O22B9ROT502W_CR</span></strong>
									<div class="round-style"
										style="border-radius: 20px; background-color: #F5F5F5; color: #555555">
										<p class="description">여밈 부분을 따라 이어지는 펄 비즈가 특징으로 양쪽을 서로
											언밸런스하게 매치하여 한층 색다른 느낌을 주었습니다. 암홀 라인이 여유로운 돌먼 소매 디자인으로 착용감과
											디자인을 모두 살렸으며, 부드럽고 고급스러운 터치감이 돋보이는 퀄리티 높은 소재를 사용하였습니다.</p>
									</div>      
                                </div>
                               </div>
                                <div class="info_sect">
                                    <ul class="point_delivery">
                                        <li>
                                            <span class="product-subtitle">배송비</span>
                                            <span class="txt">30,000원 이상 무료배송 (실결제 기준)</span>
                                            <br/>
                                            <span class="txt">30,000원 미만 배송비 2,500원</span>
                                            <br/>
                                        </li>
                                    </ul>
                                </div>
                                    
                                <table>
                                	<colgroup>
										<col style="width: 20%" />
										<col style="width: 60%" />
										<col style="width: 20%" />
									</colgroup>
                                	<tr>
                                 		<td>
                                 			<span class="product-subtitle">색상</span>
                                 		</td>
                                 		<td> 
	                                      <div class="custom-control custom-radio custom-control-inline">
	                                          <input type="radio"
											id="customRadioInline1" name="color"
											class="custom-control-input">
	                                          <label class="custom-control-label" for="customRadioInline1"><img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_BK_C01.jpg" width="20px;"></label>
	                                      </div>
                                      		<div class="custom-control custom-radio custom-control-inline">
		                                          <input type="radio"
												id="customRadioInline2" name="color"
												class="custom-control-input">
		                                          <label class="custom-control-label" for="customRadioInline2"><img src="http://newmedia.thehandsome.com/O2/2B/FW/O22B9ROT502W_CR_C01.jpg" width="20px;"></label>
		                                      </div>
                                     	</td>
                                 	</tr>
                                 	<tr>
                                 		 <td>
                                    	 	<span class="product-subtitle">사이즈</span>
                                    	 </td>
                                    	 <td>
		                                      <div class="custom-control custom-radio custom-control-inline">
		                                        <input type="radio" id="customRadioInline3" name="size" class="custom-control-input">
		                                        <label class="custom-control-label" for="customRadioInline3">76(44)</label>
		                                      </div>
		                                      <div class="custom-control custom-radio custom-control-inline">
		                                          <input type="radio" id="customRadioInline4" name="size" class="custom-control-input">
		                                          <label class="custom-control-label" for="customRadioInline4">82(55)</label>
		                                      </div>
		                                      <div class="custom-control custom-radio custom-control-inline">
		                                          <input type="radio" id="customRadioInline5" name="size" class="custom-control-input">
		                                          <label class="custom-control-label" for="customRadioInline5">88(66)</label>
		                                      </div>
                                     	</td>
                                 	 </tr>
                                  	 <tr>
                                 		<td>
                                 			<span class="product-subtitle">남은 수량</span>
                                 		</td>
                                 		<td>
                                 			<span>99</span>
                                 		</td>
                                     <tr>
                                     	<td>
                                     		<span class="product-subtitle">수량</span>
                                     	</td>
                                         <td style="margin-top:10px;">
                                             <button class="qty_left" type="button" onclick="reduceSum()">-</button>
                                             <input type="text" name="pop_out" value="1" class="qty_input" />
                                             <button class="qty_right" type="button" onclick="increaseSum()">+</button>
                                         </td>
                                     </tr>
                                     <tr>
                                     	<td>
                                     		<span class="product-subtitle">총 합계</span>
                                     	</td>
                                     	<td>
                                     		<span id="totalPrice">₩598,000</span> 
                                     	</td>
                                     </tr>						
                                </table>
                                 <a href="${pageContext.request.contextPath}/cart/cart" class="go-cart float-left" style="width:100%">쇼핑백 담기</a>
	                        </div>
	                    </div>
	                </div>
            	</div>
        	</div>  
     	</div>
       	<div style="width: 10%"></div>
	</div>   


<%@ include file="/WEB-INF/views/common/footer.jsp"%>