<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script type="text/javascript">
			

			function hideOption()  {
			  const row = document.getElementById('pid-option');
			  row.style.display = 'none';
			}
			
			
			//Option창
			//Color Btn 동적 생성
			//Option창 이미지 변경
			function showOption(productNo) {
				const row = document.getElementById('pid-option');
				row.style.display = '';
				
				$.ajax({
					url: "cart/optionColor",
					data: { pno : productNo },
					success: function(data) {
						var colorTag = "";
						for(var i=0; i<data.colorList.length; i++) {
							colorTag += "<a name='color_option_btn' value="+productNo+"_"+data.colorList[i].colorCode+">";
							colorTag += "<img src= " + data.colorList[i].colorChip + "  width='30px'>";
							colorTag += "</a>";
						}
						$("#color_span").html(colorTag);
					}
				})
				.done((data) => {
					$.ajax({
						url: "cart/optionSizePno",
						data: {pno : productNo, color:data.colorList[0].colorCode},
						success: function(data) {
							var sizeTag = "";
							for(var i=0; i<data.sizeList.length; i++) {
								if(data.sizeList[i].amount > 0) {
									sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize+"</a>";
								} else {
									sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize + 매진 +"</a>";
								}
							}
							$("#size_span").html(sizeTag);
						}
					})
					.done((data) => {
						
					});
				});
			}
			
			//Color Option 버튼
			//동적할당 태그 이벤트 처리
			//Color별 사이즈 버튼 제공
			$(document).on("click","a[name='color_option_btn']",function readSize() {
				let productDetailNo = $(this).attr('value');
				$.ajax({
					url: "cart/optionSizePdno",
					data: {pdno : productDetailNo},
					success: function(data) {
						console.log(data);
						var sizeTag = "";
						for(var i=0; i<data.sizeList.length; i++) {
							if(data.sizeList[i].amount > 0) {
								sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize+"</a>";
							} else {
								sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize + 매진 +"</a>";
							}
						}
						$("#size_span").html(sizeTag);
						
						$("#option-img").attr("src", data.img); 
					}
				})
				.done((data) => {
					
				});
			});
			
			
				
			
			function cartInit () {
				let sell_price = document.getElementById('pid_price').value;
				let amount = document.getElementById('pid_amount');
				document.getElementById('pid_sum').value =  parseInt(sell_price) * parseInt(amount.value);
				change();
			}
			

			function add () {
				let sell_price = document.getElementById('pid_price').value;
				let amount = document.getElementById('pid_amount');
				let sum = document.getElementById('pid_sum');
				amount.value ++ ;

				sum.value = parseInt(amount) * parseInt(sell_price);
			}

			function del () {
				let sell_price = document.getElementById('pid_price').value;
				let amount = document.getElementById('pid_amount');
				let sum = document.getElementById('pid_sum');
					if (amount.value > 1) {
						amount.value -- ;
						sum.value = parseInt(amount) *  parseInt(sell_price);
					}
			}

			function change () {
				let sell_price = document.getElementById('pid_price').value;
				let amount = document.getElementById('pid_amount');
				let sum = document.getElementById('pid_sum');

					if (amount.value < 0) {
						amount.value = 0;
					}
				sum.value = parseInt(amount) *  parseInt(sell_price);
			}  
	
	</script>
	
	<!--content-->
    <div style="width: 990px; margin:0px auto;">
		<div class="m-5">
			<h3 class="center">쇼핑백</h3>
		</div>
		<form:form commandName="cartDTO" id="cart-form"  onsubmit="checkData(this)" action="cart/orderForm">
		<div>
			<table class="table table-bordered cart-table" onload="cartInit()">
				<colgroup>
					<col style="width: 10px;" />
					<col />
					<col style="width: 225px" />
					<col style="width: 140px" />
					<col style="width: 110px" />
				</colgroup>
				<thead >
					<tr class="center cart-table-head">
						<th scope="col">
							<!--전체 상품 선택-->
							<input type="checkbox">
						</th>
						<th scope="col">상품정보</th>
						<th scope="col">수량</th>
						<th scope="col">판매가</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody>
					<!-- cartList -->
					
					<c:forEach var="cart" items="${cartList}" varStatus="status">
						<!-- Form 전송 hidden 데이터 -->
						<input type="hidden" name="cartDTOList[${status.index}].productDetailNo" value="${cart.productDetailNo}"/>
						<input type="hidden" name="cartDTOList[${status.index}].psize" value="${cart.psize}"/>
						<!-- //Form 전송 데이터 -->
						
					<tr>
						<td>
								<!-- 선택 상품 -->
							
							<input type="checkbox" name="cart_ck" value="${cart.productDetailNo}_${cart.psize}">
						</td>
						<td class="c-td-product">
							<!-- pt_list_all -->
							<div>
								<!--상품 정보-->
								<div>
									<a href="#" > 
										<img src="${cart.img1}" alt="" class="cart_product_img" style="width:98px; height:98px;" />
										<span class="cart_product" >
											<span class="cart_product_link">
												${cart.brand}
											</span>
											<span class="cart_product_link">
												${cart.name}
											</span>
										</span>
									</a>
							<!--옵션-->
									<div class="d-flex justify-content-between">
										
										<p> color : ${cart.colorCode}<span>/</span> size : ${cart.psize}</p>
										<a class="cart-option" onclick="javascript:showOption('${cart.productNo}')">옵션변경</a>
										
									</div>
								</div>
							</div>
							<!-- //pt_list_all-->
						</td>
						<td>
							<!-- 장바구니 수량 업데이트 -->
								<!-- qty_sel -->
							<div class="justify-content-center">
								<div class="center">
									<input type="button" value=" - " onclick="del();">
									<input type="text" name="cartDTOList[${status.index}].amount" value="1" size="3" onchange="change();">
									<input type="button" value=" + " onclick="add();">
								</div>
								<!-- //qty_sel -->
								<div class="center">
									<button type="submit" class="cart_button_wt">변경</button>
								</div>
							</div>
						</td>
						<td>
							<!-- 가격 -->
							<div>
								<span class="cart_span text-center" >₩${cart.price} 
								
								<br><input type="text" id="pid_sum" size="11" readonly></span>
							</div> 
						</td>
						<td>
							<div>
								<!-- 삭제 -->
								<a class="cart_button_wt" href="">삭제</a>
							</div> 
						</td>
					</tr>
					
					<!-- Option -->
					
					<tr class="cart-table-option" id="pid-option" style="display:none;">
						<td></td>
						<td colspan="3" class="c-td-option" >
							<div>
								<a href="#">
									<img src="${cart.img1}" alt="" class="cart_product_img" id="option-img" />
									<span class="cart_product" >
										<span class="cart_product_link">
											${cart.brand}
										</span>
										<span class="cart_product_link">
											${cart.name }
										</span>
									</span>
								</a>
								<div class="mt-2">
									<div>
										<span class="mr-2">color</span>  <span id="color_span"></span>
									</div>
									<div>
										<span class="mr-3">size</span>  <span id="size_span"></span>
									</div>
								</div>
							</div>
						</td>
						<td>
							<!-- btns -->
							<div>
								<a class="cart_button_wt" href="#">변경</a>
								<a class="cart_button_wt" onclick="hideOption()">취소</a>
							</div>
							<!-- //btns -->
						</td>
					</tr>
					
					</c:forEach>
					
					
					<tr class="cart-table-total">
						<td colspan="2"></td>
						<td >
							<span class="cart_span" > 총 1개 상품 </span>
						</td>
						<td>
							<span class="cart_span" > 상품 합계 </span>
							<span class="cart_span" > 배송비 </span>
							<span class="cart_span mt-3" > 합계 </span>
						</td>
						<td colspan="2" class="text-right">
							<span class="cart_span" > 0 </span>
							<span class="cart_span" > 0 </span>
							<span class="cart_span mt-3" > 0 </span>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>

		<div class="center mb-5" style="width:290px">
			<a class="cart_lg_btn_wt">선택상품삭제</a>
			<input class="cart_lg_btn_gr" style="width:40%" type="submit" value="선택상품주문">
		</div>
		</form:form>
		<script>
           function checkData(form) {
        	   //form의 제출 기능 off
        	   event.preventDefault();
        	   
        	   //유효성 검사 결과 변수
        	   let checkResult = true;
        	   
        	   //check box 갯수 체크
        	   if($('input[name=cart_ck]:checked').length == 0) {
        		   checkResult = false;
        	   }
        	   
        	   //서버로 제출할지 말지 결정
        	   if(checkResult) {
        		   form.submit();
        	   }
           }
	        </script>
		
		
	</div>
	
	
	
	
	

	

	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>