<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<!--content-->
    <div style="width: 990px; margin:0px auto;">
		<div class="m-5">
			<h3 class="center">쇼핑백</h3>
		</div>

		<!-- Option -->
		<script type="text/javascript">
		function hideOption()  {
			  const row = document.getElementById('pid-option');
			  row.style.display = 'none';
			}
	
			function showOption()  {
			  const row = document.getElementById('pid-option');
			  row.style.display = '';
			}
	
		</script>

		<div>
			<table class="table table-bordered cart-table">
				<colgroup>
					<col style="width: 10px;" />
					<col />
					<col style="width: 120px" />
					<col style="width: 105px" />
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
						<th scope="col">적립율</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
								<!-- 선택 상품 -->
							<input type="checkbox" value="1">
						</td>
						<td class="c-td-product">
							<!-- pt_list_all -->
							<div>
								<!--상품 정보-->
								<div>
									<a href="#" > 
										<img src="http://newmedia.thehandsome.com/YN/2B/FW/YN2B9KTO939N_LP_S01.jpg" alt="" class="cart_product_img" />
										<span class="cart_product" >
											<span class="cart_product_link">
												FOURM THE STORE
											</span>
											<span class="cart_product_link">
												[palette] 자카드 니트 탑
											</span>
										</span>
									</a>
							<!--옵션-->
									<div class="d-flex justify-content-between">
										<p> color : LIGHT PINK<span>/</span> size : 90</p>
										<a class="cart-option" onclick="showOption()">옵션변경</a>
									</div>
								</div>
							</div>
							<!-- //pt_list_all-->
						</td>
						<td>
							<!-- 장바구니 수량 업데이트 -->
							<form>
								<!-- qty_sel -->
								<div class="justify-content-center">
									<div class="center">
										<button class="qty_left">-</button> 
										<input type="text" value="1" size="1" maxlength="2" class="qty_input"/>
										<button class="qty_right">+</button>
									</div>
									<!-- //qty_sel -->
									<div>
										<a href="#" class="cart_button_wt">변경</a>
									</div>
								</div>
							</form>
						</td>
						<td>
							<!-- 가격 -->
							<div>
								<span class="cart_span text-center" >₩158,000</span>
							</div> 
						</td>
						<td>
								<!-- 적립율 -->
								<span class="cart_span text-center" >5% (한섬마일리지)
								<br>            
								0.1% (H.Point)</span>            
						</td>
						<td>
							<div>
								<!-- 위시리스트 등록 -->
								<a class="cart_button_wt" href="#">위시리스트</a>
								<!-- 삭제 -->
								<a class="cart_button_wt" href="">삭제</a>
							</div> 
						</td>
					</tr>
					
					<!-- Option -->
					
					<tr class="cart-table-option" id="pid-option" style="display:none;">
						<td></td>
						<td colspan="4" class="c-td-option" >
							<div>
								<a href="#">
									<img src="http://newmedia.thehandsome.com/YN/2B/FW/YN2B9KTO939N_LP_S01.jpg" alt="" class="cart_product_img" />
									<span class="cart_product" >
										<span class="cart_product_link">
											FOURM THE STORE
										</span>
										<span class="cart_product_link">
											[palette] 자카드 니트 탑
										</span>
									</span>
								</a>
								<div class="mt-2">
									<div>
										<span class="mr-2">color</span>  <a class="cart_select_btn">CREAM</a>
									</div>
									<div>
										<span class="mr-3">size</span>  <a class="cart_select_btn">100</a><a class="cart_select_btn">110</a>
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
			<a href="${pageContext.request.contextPath}/order/orderForm" class="cart_lg_btn_gr" style="width:40%">선택상품주문</a>
		</div>
	</div>
	

	

	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>