<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script type="text/javascript"> 
			function hideOption()  {
				$("#option").css("display","none");
			}
			
			//Option창
			//Color Btn 동적 생성
			//Option창 이미지 변경
			function showOption(index, productNo) {
				$("#cart-tr-"+index).after($("#option")); // 누른 tr 다음에 option tr 넣기
				$("#option").css("display","");
				
				//옵션 이미지/상품정보를 초기화
				$("#option-img").attr("src", $("#product-img-"+index).attr("src")); 
				$("#c-span-obrand").text($("#c-span-pbrand"+ index).text());
				$("#c-span-oname").text($("#c-span-pname"+index).text() );
				$("#c-span-ocolor").text($("#c-span-pcolor"+index).text() );
				$("#c-span-osize").text($("#c-span-psize"+index).text() );
				
				//cart 수정을 위해 hidden에 index정보저장
				$("#option-open-index").text(index);
				
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
									sizeTag += "<label><input type='radio' value="+data.sizeList[i].psize + " name='size_option_btn'/><span>"+data.sizeList[i].psize+"</span></label>"; 
									//sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize+"</a>";
								} else {
									//매진 상품
									sizeTag += "<label><input type='radio' name='size_option_btn' value="+data.sizeList[i].psize+" disabled/><span>"+data.sizeList[i].psize+"</span></label>";
									//sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize +  +"</a>";
								}
							}
							$("#size_span").html(sizeTag);
						}
					});
				});
			}
			
			//Color Option 버튼
			//동적할당 태그 이벤트 처리
			//Color별 사이즈 버튼 제공
			$(document).on("click","a[name='color_option_btn']",function readSize() {
				let strArray = $(this).attr('value').split("_");
				$("#c-span-ocolor").text(strArray[1]);
				$("#c-option-pdid").text(strArray[0] + "_" + strArray[1]);
				let productDetailNo = $(this).attr('value');
				$.ajax({
					url: "cart/optionSizePdno",
					data: {pdno : productDetailNo},
					success: function(data) {
						var sizeTag = "";
						for(var i=0; i<data.sizeList.length; i++) {
							if(data.sizeList[i].amount > 0) {
								sizeTag += "<label><input type='radio' value="+data.sizeList[i].psize + " name='size_option_btn' /><span>"+data.sizeList[i].psize+"</span></label>"; 
								//sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize+"</a>";
							} else {
								//매진 상품
								sizeTag += "<label><input type='radio' name='size_option_btn' value="+data.sizeList[i].psize+" disabled/><span>"+data.sizeList[i].psize+"</span></label>";
								//sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize +  +"</a>";
							}
						}
						$("#size_span").html(sizeTag);
						
						$("#option-img").attr("src", data.img); 
					}
				});
			});
			
			//Size Option 버튼
			//동적할당 태그 이벤트 처리
			$(document).on("click","input[name='size_option_btn']",function clickSize() {
				$("#c-span-osize").text($(this).attr('value'));
			});
				
			
			function cartInit () {
				let sell_price = document.getElementById('pid_price').value;
				let amount = document.getElementById('pid_amount');
				document.getElementById('pid_sum').value =  parseInt(sell_price) * parseInt(amount.value);
				change();
			}
			
			function reduceSum(index) {
				let sum = parseInt($("input[name=cartDTOList["+index+"].amount]").val());
				let total = document.querySelector(".pd-price span").innerHTML
						.substr(1);
				if (sum > 1) {
					sum = sum - 1;
				}
				$("input[name=cartDTOList["+index+"].amount]").val(sum);
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
				document.querySelector("#totalPrice"+index).innerHTML = "₩" + ans;
			}
			
			function increaseSum(index) {
				let sum = parseInt($("input[name=cartDTOList["+index+"].amount]").val());
				let total = document.querySelector(".pd-price span").innerHTML
						.substr(1);
				sum = sum + 1;
				$("input[name=cartDTOList["+index+"].amount]").val(sum);
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
				document.querySelector("#totalPrice"+index).innerHTML = "₩" + ans;
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
			
			function delCart(index, productDetailNo, psize) {
				let result = confirm("삭제하시겠습니까?");
				if(result) {
					$.ajax({
						url: "/cart/deleteOneCart",
						type: "POST",
						data: {pdno : productDetailNo, size : psize},
						success: function(data) {
							if(data.result === "success") {
								$("#cart-tr-"+index).remove();
							}
						},
						error: function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					}) 
				}
			}
			
			function selectRemove() {
					let result = confirm("삭제하시겠습니까?");
					if(result) {
						//JSON 변환
						let pdsnoList = new Array();
						let list = $("input:checkbox[name=cart_ck]:checked").each(function(){
							let p = new Object();
							p.pdsno = $(this).val();
							pdsnoList.push(p);
						});
						let jsonData = JSON.stringify(pdsnoList);
						
						$.ajax({
							url: "/cart/deleteCarts",
							type: "POST",
							data: jsonData,
							dataType : "json",
							success: function(data) {
								if(data.result === "success") {
									$("#cart-tr-"+index).remove();
								}
							},
							error: function(request,status,error) {
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
						
					}
	         }
			
			 function checkData(form) {
	        	   //form의 제출 기능 off
	        	   event.preventDefault();
	        	   
	        	   //유효성 검사 결과 변수
	        	   let checkResult = true;
	        	   
	        	   //check box 갯수 체크
	        	   if($('input[name=cart_ck]:checked').length == 0) {
	        		   alert("결제하실 상품을 선택하세요");
	        		   checkResult = false;
	        	   }
	        	   
	        	   //서버로 제출할지 말지 결정
	        	   if(checkResult) {
	        		   form.submit();
	        	   }
	           }
			 
			 function updateCart() {
				//UPDATE를 위한 JSON 변환
				//기존의 pdi와 color와
				//새로운 pdid와 color코드를 생성
				let cartData = new Object();
				let orgIndex = $("#option-open-index").text();
				let orgProductId = $("#c-input-pid"+orgIndex).val();
				cartData.productDetailNo = $("#c-input-pdid"+orgIndex).val();
				cartData.newProductDetailNo = orgProductId + "_" + $("#c-span-ocolor").text();
				cartData.psize = $("#c-input-psize" + orgIndex).val();
				cartData.newPsize = $("#c-span-osize").text();
				
				let jsonData = JSON.stringify(cartData);
				console.log(jsonData);
				
				 $.ajax({
						url: "/cart/updateCart",
						type: "POST",
						data: jsonData,
						dataType : "json",
						contentType: 'application/json',
						success: function(data) {
							if(data.result === "success") {
								//상품 이미지/상품정보를 초기화
								 $("#product-img-"+orgIndex).attr("src", $("#option-img").attr("src"));
								 $("#c-span-pcolor"+orgIndex).text($("#c-span-ocolor").text());
								 $("#c-span-psize"+orgIndex).text($("#c-span-osize").text()); 
								 
								 hideOption();
							}
						},
						error: function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					}); 
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
						
						<input type="hidden" id="c-input-pid${status.index}" value="${cart.productNo}"/>
						<input type="hidden" id="c-input-pdid${status.index}" name="cartDTOList[${status.index}].productDetailNo" value="${cart.productDetailNo}"/>
						<input type="hidden" id="c-input-psize${status.index}" name="cartDTOList[${status.index}].psize" value="${cart.psize}"/>
						<!-- //Form 전송 데이터 -->
						
					<tr id="cart-tr-${status.index}">
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
										<img id="product-img-${status.index}" src="${cart.img1}" alt="" class="cart_product_img" style="width:98px; height:98px;" />
										<span class="cart_product" >
											<span class="cart_product_link" id="c-span-pbrand${status.index}">
												${cart.brand}
											</span>
											<span class="cart_product_link" id="c-span-pname${status.index}">
												${cart.name}
											</span>
											<span class="cart_product_link" >
												color : <span id="c-span-pcolor${status.index}">${cart.colorCode}</span><span>/</span> size : <span id="c-span-psize${status.index}">${cart.psize}</span>
											</span>
										</span>
									</a>
							<!--옵션-->
									<div class="d-flex justify-content-between">
										
										<a class="cart-option" onclick="showOption(${status.index},'${cart.productNo}')">옵션변경</a>
										
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
									<button class="qty_left" type="button" onclick="reduceSum(${status.index})">-</button>
									<input type="text" name="cartDTOList[${status.index}].amount" value="${cart.amount}" size="3" onchange="change();">
									<button class="qty_right" type="button" onclick="increaseSum(${status.index})">+</button>
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
								<span class="cart_span text-center" >₩${cart.price} </span>
								<span class="pd-text" id="totalPrice${status.index}">₩${cart.price}</span> 
							</div> 
						</td>
						<td>
							<div>
								<!-- 삭제 -->
								<a class="cart_button_wt" onclick="delCart(${status.index},'${cart.productDetailNo}', '${cart.psize}')">삭제</a>
							</div> 
						</td>
					</tr>
					
					
					
					</c:forEach>
					
					<!-- Option -->
					
					<tr class="cart-table-option" id="option" style="display:none;">
						<td></td>
						<td colspan="3" class="c-td-option" >
							<div>
								<a href="#">
									<img src="${cart.img1}" alt="" class="cart_product_img" id="option-img" />
									<input type="hidden" id="option-open-index">
									<span class="cart_product" >
											<span class="cart_product_link" id="c-span-obrand">
												${cart.brand}
											</span>
											<span class="cart_product_link" id="c-span-oname">
												${cart.name}
											</span>
											<span class="cart_product_link" >
												color : <span id="c-span-ocolor"></span><span>/</span> size : <span id="c-span-osize"></span>
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
								<a class="cart_button_wt" onclick="updateCart()">변경</a>
								<a class="cart_button_wt" onclick="hideOption()">취소</a>
							</div>
							<!-- //btns -->
						</td>
					</tr>
					
					
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
			<a class="cart_lg_btn_wt" onclick="selectRemove();"> 선택상품제거 </a>
			<input class="cart_lg_btn_gr" style="width:40%" type="submit" value="선택상품주문">
		</div>
		</form:form>
          
           
           
           
           
		
		
	</div>
	
	
	
	
	

	

	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>