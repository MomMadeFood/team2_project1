<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script type="text/javascript"> 
		$(document).ready(function(){
		    $("#checkall").click(function(){
		        if($("#checkall").prop("checked")){
		            $("input[name=cart_ck]").prop("checked",true);
		        }else{
		            $("input[name=cart_ck]").prop("checked",false);
		        }
		    })
		})
	
		function hideOption()  {
			$("#option").css("display","none");
		}
		
		//Option창
		//Color Btn 동적 생성
		//Option창 이미지 변경
		function showOption(index, productNo) {
			console.log(index);
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
						colorTag += "<img class='m-1' src= " + data.colorList[i].colorChip + "  width='30px'>";
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
								sizeTag += "<label class='cart-box-radio-input'><input type='radio' value="+data.sizeList[i].psize + " name='size_option_btn'/><span>"+data.sizeList[i].psize+"</span></label>"; 
								//sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize+"</a>";
							} else {
								//매진 상품
								sizeTag += "<label class='cart-box-radio-input'><input type='radio' name='size_option_btn' value="+data.sizeList[i].psize+" disabled/><span>"+data.sizeList[i].psize+"</span></label>";
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
							sizeTag += "<label class='cart-box-radio-input'><input type='radio' value="+data.sizeList[i].psize + " name='size_option_btn' /><span>"+data.sizeList[i].psize+"</span></label>"; 
							//sizeTag += "<a class='cart_select_btn'>"+data.sizeList[i].psize+"</a>";
						} else {
							//매진 상품
							sizeTag += "<label class='cart-box-radio-input'><input type='radio' name='size_option_btn' value="+data.sizeList[i].psize+" disabled/><span>"+data.sizeList[i].psize+"</span></label>";
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
		
		function reduceSum(index) {
			let amount = parseInt($("#c-input-pamount"+index).val());
			
			if (amount > 1) {
				amount = amount-1;
				
				$("#c-input-pamount"+index).val(amount);
			} else {
				alert("장바구니의 최소 수량은 1입니다")
			}
		}
		
		function increaseSum(index) {
			let amount = parseInt($("#c-input-pamount"+index).val());
			
			$("#c-input-pamount"+index).val(amount + 1);
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
						} else if(data.result === "errer-login") {
							location.href="/member/loginForm";
						}
						updateTotal();
					},
					error: function(request,status,error) {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}) 
			}
		}
		
		function selectRemove() {
			let count = $("input:checkbox[name=cart_ck]:checked").length;
			let result = confirm("선택하신 "+count+"개의 상품을 삭제하시겠습니까?");
			if(result) {
				//JSON 변환
				let cartList = new Array();
				$("input:checkbox[name=cart_ck]:checked").each(function(){
					let cart = new Object();
					let str =  $(this).attr('value');
					let strArray = str.split("_");
			
					cart.productDetailNo = strArray[0] + "_" + strArray[1];
					cart.psize = strArray[2];
					
					cartList.push(cart);
				});
				let jsonData = JSON.stringify(cartList);
				console.log(jsonData);
				
				$.ajax({
					url: "/cart/deleteCarts",
					type: "POST",
					data: jsonData,
					dataType : "json",
					contentType: 'application/json',
					success: function(data) {
						if(data.result === "success") {
							let list = $("input:checkbox[name=cart_ck]:checked").each(function(){
								//삭제 성공하면, checked되어있던 tr은 삭제
								$(this).parent().parent().remove();
							});
							updateTotal();
						} else if(data.result === "errer-login") {
							location.href="/member/loginForm";
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
			closeAllAlert();
			//UPDATE를 위한 JSON 변환
			//기존의 pdi와 color와
			//새로운 pdid와 color코드를 생성
			let cartData = new Object();
			let orgIndex = $("#option-open-index").text();
			
			let orgProductId = $("#c-input-pid"+orgIndex).val();
			cartData.productDetailNo = $("#c-input-pdid"+orgIndex).val();
			cartData.psize = $("#c-span-psize" + orgIndex).text();
			
			cartData.newProductDetailNo = orgProductId + "_" + $("#c-span-ocolor").text();
			cartData.newPsize = $("#c-span-osize").text();
			
			cartData.amount = $("#c-input-pamount" + orgIndex).val();
			
			let jsonData = JSON.stringify(cartData);
			console.log(jsonData);
			
			let price = parseInt($("#c-input-price"+orgIndex).val());
			
			$.ajax({
				url: "/cart/updateCart",
				type: "POST",
				data: jsonData,
				dataType : "json",
				contentType: 'application/json',
				success: function(data) {
					if(data.result === "error-duplicate") {
						$("#cart-error-message").text("카트에 중복된 상품이 존재합니다.");
						$("#cart-error-alert").show();
					} else if(data.result === "warn-stock") {
						$("#cart-warn-message").text("상품의 재고가 부족합니다. 최대 구매 가능 수량은 " + data.amount + "개입니다.");
						//재고 수량 view 변경
						$("#c-input-pamount"+orgIndex).val(data.amount);
						$("#c-span-totalprice"+orgIndex).text(data.amount * price);
						//상품 view 변경
						$("#product-img-"+orgIndex).attr("src", $("#option-img").attr("src"));
						 $("#c-span-pcolor"+orgIndex).text(data.colorCode);
						 $("#c-span-psize"+orgIndex).text(data.psize); 
						//hidden 값 수정
						 $("#c-input-psize"+orgIndex).val(data.psize);
						 $("#c-input-pdid"+orgIndex).val(data.productDetailNo);
						 //checkbox 값 수정
						 $("#c-checkbox-pdsid"+orgIndex).val(data.productDetailNo + "_" + data.psize);
						console.log($("#c-checkbox-pdsid"+orgIndex).val());
						updateTotal();
						$("#cart-warn-alert").show();
					} else if(data.result === "errer-login") {
						location.href="/member/loginForm";
					} else if(data.result === "error-same") {
						$("#cart-error-message").text("옵션을 변경해주세요.");
						$("#cart-error-alert").show();
					} else { //성공
						//성공시 태그들의 정보를 바꿔준다
						//view 수정
						 $("#product-img-"+orgIndex).attr("src", $("#option-img").attr("src"));
						 $("#c-span-pcolor"+orgIndex).text(data.colorCode);
						 $("#c-span-psize"+orgIndex).text(data.psize); 
						 //hidden 값 수정
						 $("#c-input-psize"+orgIndex).val(data.psize);
						 $("#c-input-pdid"+orgIndex).val(data.productDetailNo);
						//checkbox 값 수정
						 $("#c-checkbox-pdsid"+orgIndex).val(data.productDetailNo + "_" + data.psize);
						console.log($("#c-checkbox-pdsid"+orgIndex).val());
						 hideOption();
						 updateTotal();
					}
				},
				error: function(request,status,error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}); 
		 }
		 
		 function updateAmount(index) {
			closeAllAlert();
			let cartData = new Object();
			cartData.productDetailNo = $("#c-input-pdid"+index).val();
			cartData.psize = $("#c-span-psize" + index).text();
			cartData.amount = $("#c-input-pamount"+index).val();
			let price = parseInt($("#c-input-price"+index).val());
			
			let jsonData = JSON.stringify(cartData);
			console.log(jsonData);
			 
			 $.ajax({
					url: "/cart/updateAmount",
					type: "POST",
					data: jsonData,
					dataType : "json",
					contentType: 'application/json',
					success: function(data) {
						console.log(data);
						if(data.result === "success") {
							$("#c-span-totalprice"+index).text(data.amount * price);
							updateTotal();
						} else if(data.result === "warn-stock") {
							$("#cart-warn-message").text("상품의 재고가 부족합니다. " + data.amount + "개의 상품만 담깁니다.");
							$("#c-input-pamount"+index).val(data.amount);
							$("#c-span-totalprice"+index).text(data.amount * price);
							updateTotal();
							$("#cart-warn-alert").show();
						} else if(data.result === "errer-login") {
							location.href="/member/loginForm";
						}
					},
					error: function(request,status,error) {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}); 
		 }
		 
		 function updateTotal() {
			 let sum = 0;
			 $(".c-span-totalprice").each(function(){
					sum = sum + parseInt($(this).text());
			 });
			 
			 $("#cart-total-productprice").text(sum);
			 let total = $(".cart-tr-product").length;
			 $("#cart-total-amount").text(total); 
		 }
		 
			function closeErrorAlert() {
				$('#cart-error-alert').hide();
			}	 
			function closeWarnAlert() {
				$('#cart-warn-alert').hide();
			}	
			
			function closeAllAlert() {
				closeErrorAlert();
				closeWarnAlert();
			}
			//금액에서 ,을 제거해주는 함수
			function convertNum(price){
				let temp = "";
				for (var i = 0; i < price.length; i++) {
					if (price.charAt(i) != ',') {
						temp = temp + price.charAt(i);
					}
				}
				temp = parseInt(temp);
				return temp;
			}
			
			//숫자에 ,을 추가해주는 함수
			function convertPrice(num){
				num = String(num);
				let ans = "";
				let cnt = 0;
				for (var i = num.length - 1; i >= 0; i--) {
					cnt++;
					ans = num.charAt(i) + ans;
					if (i > 0 && cnt % 3 == 0) {
						ans = "," + ans;
					}
				}
				return ans;
			}
	</script>
	
	<div class="position-fixed c-div-alert">
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

	<!--content-->
	<div class="container-fluid c-div-content">
		
	    <div style="width: 990px; margin:0px auto;">
			<div class="m-5">
				<h3 class="center">쇼핑백</h3>
			</div>
			<form:form commandName="cartDTO" id="cart-form"  onsubmit="checkData(this)" action="cart/orderForm">
			<div>
				<table class="table table-bordered cart-table">
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
								<input type="checkbox" id="checkall">
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
							<!-- !!!!!!!!!지우면 Form 전송시 오류 발생!!!!!!!! -->
							<input type="hidden" id="c-input-pid${status.index}" value="${cart.productNo}"/>
							<input type="hidden" id="c-input-pdid${status.index}" name="cartDTOList[${status.index}].productDetailNo" value="${cart.productDetailNo}"/>
							<input type="hidden" id="c-input-psize${status.index}" name="cartDTOList[${status.index}].psize" value="${cart.psize}"/>
						<!-- //Form 전송 데이터 -->
						<tr class="cart-tr-product" id="cart-tr-${status.index}">
							<td>
									<!-- 선택 상품 -->
								
								<input type="checkbox" name="cart_ck" id="c-checkbox-pdsid${status.index}" value="${cart.productDetailNo}_${cart.psize}" checked>
							</td>
							<td class="c-td-product">
								<!-- pt_list_all -->
								<div>
									<!--상품 정보-->
									<div class="product-info d-flex justify-content-start">
											<div>
												<a href="${pageContext.request.contextPath}/product/productDetail?no=${cart.productDetailNo}">
												<img id="product-img-${status.index}" src="${cart.img1}" alt="" class="cart_product_img" />
												</a>
											</div>
											<div class="cart_product mt-2" style="width:350px;" >
												<a href="${pageContext.request.contextPath}/product/productDetail?no=${cart.productDetailNo}">
													<span class="cart_product_link" id="c-span-pbrand${status.index}">
														${cart.brand}
													</span>
													<span class="cart_product_link" id="c-span-pname${status.index}">
														${cart.name}
													</span>
												</a>
												<div class="cart_product_link mt-5" >
													color : <span id="c-span-pcolor${status.index}">${cart.colorCode}</span><span>/</span> size : <span id="c-span-psize${status.index}">${cart.psize}</span>
												</div>
												<span class="cart_product_link d-flex flex-row-reverse bd-highlight" >
													<a class="cart-option" onclick="showOption(${status.index},'${cart.productNo}')">옵션변경</a>
												</span>
											</div>
								<!--옵션-->
									</div>
								</div>
								<!-- //pt_list_all-->
							</td>
							<td style="vertical-align:middle;  text-align: center;">
								<!-- 장바구니 수량 업데이트 -->
									<!-- qty_sel -->
								<div class="justify-content-center">
									<div class="center ">
										<button class="qty_left" type="button" onclick="reduceSum(${status.index})">-</button>
										<input type="text" class="qty_input" id="c-input-pamount${status.index}" name="cartDTOList[${status.index}].amount" value="${cart.amount}" size="3">
										<button class="qty_right" type="button" onclick="increaseSum(${status.index})">+</button>
									</div>
									<div style="text-align:center;">
										<a class="qty_change" onclick="updateAmount(${status.index});">변경</a>
									</div>
								</div>
								
							</td>
							<td style="vertical-align:middle;  text-align: center;">
								<!-- 가격 -->
								<div>
									<input type="hidden" value="${cart.price}" id="c-input-price${status.index}"/>
									<span class="pd-text">₩<span class="c-span-totalprice" id="c-span-totalprice${status.index}">${cart.price * cart.amount}</span></span> 
								</div> 
							</td>
							<td style="vertical-align:middle;  text-align: center;">
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
							<td class="c-td-option">
								<div class="product-info d-flex justify-content-start">
									<div>
										<img src="${cart.img1}" alt="" class="cart_product_img" id="option-img" />
									</div>
									<input type="hidden" id="option-open-index">
									<div class="cart_product mt-3"  >
											<span class="cart_product_link" id="c-span-obrand">
												${cart.brand}
											</span>
											<span class="cart_product_link" id="c-span-oname">
												${cart.name}
											</span>
											<span class="cart_product_link mt-5" >
												color : <span id="c-span-ocolor"></span><span>/</span> size : <span id="c-span-osize"></span>
											</span>
									</div>
								</div>
							</td>
							<td colspan="2" class="c-td-option"  style="vertical-align:middle;">
								<div class="ml-4">
									<div>
										<span class="mr-2">color</span>  <span id="color_span"></span>
									</div>
									<div class="mt-4">
										<span class="mr-3 ">size</span>  <span id="size_span"></span>
									</div>
								</div>
							</td>
							<td style="vertical-align:middle;">
								<!-- btns -->
								<div style="margin-top : -10px;">
									<a class="cart_button_wt" onclick="updateCart()">변경</a>
									<a class="cart_button_wt" onclick="hideOption()">취소</a>
								</div>
								<!-- //btns -->
							</td>
						</tr>
						
						
						<tr class="cart-table-total">
							<td colspan="2"></td>
							<td >
								<span class="cart_span"> 총 <span id="cart-total-amount"></span>개 상품 </span>
							</td>
							<td>
								<span class="cart_span" > 상품 합계 </span>
							</td>
							<td colspan="2" class="text-right">
								<span class="cart_span" id="cart-total-productprice" > </span>
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
	
			<div class="center mb-5 mt-5" style="width:290px">
				<a class="cart_lg_btn_wt" onclick="selectRemove();"> 선택상품제거 </a>
				<input class="cart_lg_btn_gr ml-2" style="width:40%" type="submit" value="선택상품주문">
			</div>
			</form:form>
	          
		</div>
	</div>

	<script>
       updateTotal();
    </script>

	

	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>