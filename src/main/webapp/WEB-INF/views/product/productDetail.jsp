<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style type="text/css">
	@import url("/resources/css/productDetail.css");
</style>


<div class="container-fluid">
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
		
		function colorchipChange(){
			console.log(event);
			var tgId = event.currentTarget.id;
			let col1 = document.querySelector("#customRadioInline1");
			let col2 = document.querySelector("#customRadioInline2");
			console.log($("#customRadioInline1").hasClass("color-selected"));
			console.log($("#customRadioInline2").hasClass("color-selected"));
			console.log(tgId);
			
			if($("#customRadioInline1").hasClass("color-selected")&&tgId=="customRadioInline2"){
				$("#customRadioInline2").addClass("color-selected");
				$("#customRadioInline1").removeClass("color-selected");
				console.log("1");
			}else  if($("#customRadioInline2").hasClass&&tgId=="customRadioInline1"){
				$("#customRadioInline1").addClass("color-selected");
				$("#customRadioInline2").removeClass("color-selected");
				console.log("2");
			}
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
									<a class= "pd_a" href="http://www.thehandsome.com/ko/c/br45/br45"></a>
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
										<p class="pd_p description">${productDetail.content}</p>
									</div>      
                                </div>
                               </div>
                                <div class="info_sect">
                                    <ul class="pd_ul">
                                        <li class="pd_li li_sect">
                                            <span class="pd-title">배송비</span>
                                            <span class="pd-text">30,000원 이상 무료배송 (실결제 기준)</span>
                                            <br/>
                                            <span class="pd-text">30,000원 미만 배송비 2,500원</span>
                                            <br/>
                                        </li>
                                    </ul>
                                </div>
                                

                                    
                                    
                                <div class="pd-info">
                                	<ul>
                                 		<li style="display:flex" class="pd-colors">
                           					<span class="product-subtitle mr-3">색상</span>
                           					<c:forEach items="${productDetailMap}" var="i" >
                           						<div >
                                 					<a href="${pageContext.request.contextPath}/product/productDetail?no=${i.key}">
                                 					<img src= "${i.value}"  width="20px">
                             						</a>
												</div>
                   							</c:forEach>
                   						</li>
                           			<%-- 		<c:forEach items="${colorChipList}" begin="1" var="colorChip" varStatus="status">
                           						<div onClick="colorchipChange() " id="customRadioInline${status.count+1}">
                                 					<a href="${pageContext.request.contextPath}/product/productDetail?no=${productDetailNoList.productDetailNo}">
                                 					<img src= "${colorChip}"  width="20px">
                             						</a>
												</div>
                   							</c:forEach> --%>
                           					
                                   	
                                   		
                                 		 <li class="pd-size">
                                    	 		<span class="product-subtitle">사이즈</span>
                                    	 		<c:forEach items="${sizeList}" var="size">
                                    	 			<label><input type="radio" name="size" value="${size}"/><span>${size}</span></label>
                                   	 			</c:forEach>	                                      
                                   		</li>
                                   
                                 		<li>
                                 			<span class="product-subtitle">남은 수량</span>
                                 			<span style="mr-2">${productSizePrice.amount}</span> <!-- 나중에 ajax이용  -->
                                 		</li>
                                     	<li>
                                     		<span class="product-subtitle">수량</span>
                                             <button class="qty_left" type="button" onclick="reduceSum()">-</button>
                                             <input type="text" name="pop_out" value="1" class="qty_input" />
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
                                 <a href="${pageContext.request.contextPath}/cart/cart" class="go-cart float-left pd_a" style="width:250px">쇼핑백 담기</a>
	                        </div>
	                    </div>
	                </div>
            	</div>
        	</div>  
     	</div>
       	<div style="width: 10%"></div>
	</div>   

	

<%@ include file="/WEB-INF/views/common/footer.jsp"%>