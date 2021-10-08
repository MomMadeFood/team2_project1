<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

	
    <style>
   	 .arrow-btn {
		  text-decoration: none;
		  display: inline-block;
		  padding: 8px 16px;
		}
		
	.arrow-btn:hover {
		  background-color: #ddd;
		  color: white;
		}
      p{
        padding: 0px;
        margin: 0px;
      }
      
     .previous {
	  background-color: #f1f1f1;
	  color: black;
	}
	
	.next {
	  background-color: #f1f1f1;
	  color: black;
	}
	
	.round {
	  border-radius: 50%;
	}
    </style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


	function callAddrAPi(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#addr").val(data.address);
	        	$("#zipcode").val(data.zonecode);
	        }       
	    }).open();
	}

</script>
<div>
	<div id="memberIdDiv" style="display:none">${memberDTO.id}</div>
	<div
		style="border-bottom: 1px solid #E5E5E5; margin-bottom: 60px; height: 100px; vertical-align: center;">
		<div
			style="margin: auto; padding-top: 30px; width: 300px; text-align: center; vertical-align: middle">
			<p style="font-size: 28px;">배송&결제정보 입력</p>
		</div>
	</div>
		<div>
			<div style="margin: 0px auto; width: 1000px;display:flex">
				<div style="width:68%">
					<table id="orderTable" class="table .txt" style="border-bottom: 1px solid #E5E5E5;">
						<colgroup>
							<col width="51%" />
							<col width="9%" />
							<col width="22%" />
							<col width="12%" />
						</colgroup>
						<thead style="background-color: #F5F5F5;">
							<tr style="text-align: center; height: 47px; font-size: 15px;">
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">판매가</th>
								<th scope="col">쿠폰</th>
							</tr>
						</thead>
						<tbody>
            	  <c:forEach var="product" items="${productList}" varStatus="status">
	             				<tr style="text-align: center; height: 132px;">
									<td class="detail-id" style="display:none">${product.productDetailNo}</td>
									<td class="d-flex"><img src="${product.img1}" alt=""
										style="width: 98px; height: 98px;">
										<div style="text-align: left; margin-left: 20px;">
											<a style="color: black;" href="#">${product.brand}<br/> ${product.name}
											</a>
											<div style="display:flex">
											 	<p style="margin-top: 10px;font-size:12px;color:#CCC7CD" class="detail-color">color :  <img src="${product.colorChip}" alt="" width="20px" height="20px"> / size :<span class="detail-size">${product.psize}</span></p>
											</div>
										</div>
                 </td>

									<td class="detail-amount" style="border-left: 1px solid #E5E5E5; border-right: 1px solid #E5E5E5; vertical-align: middle;">${product.amount}</td>
									<td class="priceList" style="vertical-align: middle;">
										<div style="display:none; color:#c9bc30" class="originBox">₩<span class="originPrice" style="text-decoration:line-through; color:#c9bc30; "><fmt:formatNumber value="${product.price}" pattern="#,###"/></span></div>
										<div>₩<span class="detail-price"  ><fmt:formatNumber value="${product.price}" pattern="#,###"/></span></div>
										<div style="display:none" class="appliedPoint">-<span class="pointAmount">0</span>P</div>
										<div style="display:none" class="appliedCoupon">0</div>
									</td>
                  <td style="vertical-align: middle;"><button class="btn btn-sm btn-outline-secondary btn-search" onclick="couponSelect(${product.price/product.amount},'${product.brand}')">적용</button>	</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="margin-top: 40px;">
						<div style="float: left; margin-bottom: 15px">
	
							<h4>주문자 정보</h4>
						</div>
						<table class="table"
							style="border-bottom: 1px solid #E5E5E5; border-top:">
							<colgroup>
								<col style="width: 140px;" />
								<col>
							</colgroup>
							<tbody>
								<sec:authorize access="isAuthenticated()">
									<sec:authentication property="principal.username" var="user_id"/>
									<tr ><div class="member-id" style="display:none">${user_id}</div></tr>
								</sec:authorize>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">주문자</td>
									<td>${memberDTO.name}</td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">휴대폰</td>
									<td>${memberDTO.phone}</td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">E-mail</td>
									<td>${memberDTO.email}</td>
								</tr>
							</tbody>
						</table>
					</div>
	
					<div style="margin-top: 40px;">
						<div style="float: left; display: flex; margin-bottom: 15px">
	
							<h4>배송지 정보</h4>
							<p style="margin-left: 20px;" class="reqd_txt none">
								<strong style="color: #c59c6c">*</strong> 표시는 필수항목입니다.
							</p>
						</div>
						<table class="table" style="border-bottom: 1px solid #E5E5E5;">
							<colgroup>
								<col style="width: 140px;" />
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space"><strong
										style="color: #c59c6c; margin-right: 5px;">*</strong>배송지 주소</td>
									<td><input style="width: 80px" title="우편번호" id="zipcode"
										name="postcode" type="text" value="${memberDTO.zipcode}"> <button
										class="btn btn-sm btn-secondary" value="조회" id="adressBtn" type="button" onClick="callAddrAPi()">조회</button>
										<div style="margin-top: 10px;">
											<input style="width: 100%;" id="addr" name="adress"
												type="text" value="${memberDTO.addr}">
										</div>
										<div style="margin-top: 10px;">
											<input style="width: 100%;" value="${memberDTO.detailAddr}"
												id="detail-addr" name="adressDetail" type="text" >
										</div></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space"><strong
										style="color: #c59c6c; margin-right: 5px;">*</strong>수령인</td>
									<td><input style="width: 150px;" value="${memberDTO.name}" title="수령인"
										id="rec-name" name="rec-name" type="text"></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space"><strong
										style="color: #c59c6c; margin-right: 5px;">*</strong>휴대폰 번호</td>
									<td><select id="hp1" name="hp1" title="휴대폰 앞자리"
										style="width: 80px">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
									</select>
										<div
											style="display: inline-block; margin-left: 8px; margin-right: 8px">-</div>
										<input id="hp2" name="hp2" title="휴대폰 가운데자리" type="text"
										maxLength=4 style="width: 80px" value="${memberDTO.phone.substring(4,8)}">
									<div
											style="display: inline-block; margin-left: 8px; margin-right: 8px">-</div>
										<input id="hp3" name="hp3" title="휴대폰 마지막자리" type="text"
										maxLength=4 style="width: 80px" value="${memberDTO.phone.substring(9,13)}"></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">연락처</td>
									<td><select name="ph1" id="ph1" title="연락처 앞자리"
										style="width: 80px">
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
									</select>
										<div
											style="display: inline-block; margin-left: 8px; margin-right: 8px">-</div>
										<input id="ph2" name="ph2" title="연락처 가운데자리" type="text"
										maxLength=3 style="width: 80px" value="123">
									<div
											style="display: inline-block; margin-left: 8px; margin-right: 8px">-</div>
										<input id="ph3" name="ph3" title="연락처 마지막자리" type="text"
										maxLength=4 style="width: 80px" value="6768"></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">배송요청사항</td>
									<td><input style="width: 80%;" id="request"
										name="ship_req" type="text" value="">
									<div style="display: inline-block; margin-left: 10px;">0 /
											20자</div></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">수령인 E-mail</td>
									<td>
	                      			<input id="rec-email1" name="rec-email1" title="이메일앞자리" type="text" style="width:120px" value="${memberDTO.email.substring(0,fn:indexOf(memberDTO.email,'@'))}">
	                      			<div  style="display: inline-block;  margin-left:8px; margin-right:8px">@</div><input id="rec-email2"name="rec-email2" title="이메일주소" type="text" style="width:120px" value="${memberDTO.email.substring(fn:indexOf(memberDTO.email,'@')+1,fn:length(memberDTO.email))}">
	                      			<select title="이메일 계정" id="emailSel" onchange="emailChange()">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="yahoo.com">yahoo.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<div style="float: left; margin-top: 40px; margin-bottom: 15px">
							<h4>결제 수단 선택</h4>
						</div>
						<div
							style="width: 100%; clear: both; border-bottom: 2px solid #cccccc">
							<div
								style="display: flex; height: 70%; border-top: 1px black solid; border-bottom: 1px solid #cccccc;">
								<div
									style="width: 20%; background-color: #F5F5F5;display: flex; align-items: center;">
									<p style="font-weight: bold; margin-left:15px">H.Point 결제</p>
								</div>
								<div style="width: 80%; padding: 10px;">
									<div style="display: flex; justify-content: space-between;">
										<div style="display: flex;">
											<input style="width: 130px;" type="number" value=0 id="apply-point"
												name="pointBox">
											<p
												style="margin-left: 10px; font-size: 12px; font-weight: bold; padding-top: 5px">P
												사용 (잔액 : <span id="remain-point"><fmt:formatNumber value="${memberDTO.point}" pattern="#,###"/></span>P)</p>
											<div id="cur-point" style="display:none">${memberDTO.point}</div>
										</div>
										<div style="display: flex;">
											<div style="padding-top: 2px">
												<input type="checkbox" id="allUse"  onClick = "allPointApply(this)">
											</div>
											<p
												style="font-size: 12px; font-weight: bold; padding-top: 5px; margin-left: 10px">모두사용</p>
											<button style="width: 50px; margin-left: 10px;" type="button"
												class="btn btn-sm btn-secondary" onclick="applyPoint()">적용</button>
											<button type="button" style="width: 80px; margin-left: 10px"
												class="btn btn-sm btn-secondary" onClick="resetPoint()">적용취소</button>
										</div>
									</div>
								</div>
							</div>
							<div style="display: flex; width: 100%;">
								<div style="width: 20%; background-color: #F5F5F5; display: flex; align-items: center;">
									<p style="font-weight: bold;margin-left:15px">결제수단 선택</p>
								</div>
								<div style="height: 100%; width: 80%;">
									<div
										style="height: 100%; display: flex; padding: 10px;">
										<div style="margin-top: 3px;" class="form-check">
											<input class="form-check-input payment-way" type="radio" name="purchaseCheck"
												id="credit" checked onClick="payChange()"> <label style="margin-right: 20px;"
												class="form-check-label" for="credit" > 신용카드 </label>
										</div>
										<div style="margin-top: 3px;" class="form-check">
											<input class="form-check-input payment-way" type="radio" name="purchaseCheck"
												id="transfer" onClick="payChange()"> <label class="form-check-label"
												for="transfer" > 계좌이체 </label>
										</div>
									</div>
									<div class="card-box" style="height:200px; padding:30px; border-top: 1px solid #cccccc;display:flex">
										<div style="display: flex; align-items: center;">
											<div>
												<a onClick="clickLeft()" class="arrow-btn previous round">&#8249;</a>
											</div>
										</div>
										<c:forEach items="${cardList}" var="card" varStatus="status">
											<div class=" card 
											<c:choose>
											  <c:when test="${card.company=='삼성카드'}">
											     bg-primary
											  </c:when>
											  <c:when test="${card.company=='KB국민카드'}">
											     bg-warning
											  </c:when>
											  <c:when test="${card.company=='현대카드'}">
											     bg-secondary
											  </c:when>
											  <c:when test="${card.company=='롯데카드'}">
											     bg-danger
											  </c:when>
											  <c:otherwise>
											     bg-secondary
											  </c:otherwise>
											</c:choose>   									
											<c:if test="${status.index eq 0}">
	    										show
											</c:if>
											"
											style=" height:140px; width:315px; margin:0px auto; border:1px solid black; background-color: #F5F5F5;											
											<c:if test="${status.index != 0}">
	    										display:none
											</c:if>
											<c:if test="${status.index eq 0}">
	    										display:block
											</c:if>
											">
												<div style="height:70%; border-bottom:1px solid black;padding-left:5px">
													<p id="card-company">${card.company}</p>
													<fmt:formatDate var="resultRegDt" value="${card.expireDate}" pattern="yyyy-MM-dd"/>
													<div style="margin-top:45px">
														<p>유효기간: ${resultRegDt}</p>
													</div>
												</div>
												<div style="height:30%; texg-align:center;padding-top:10px;padding-left:5px">카드번호: <span id="card-no">${card.cardNo}</span></div>
											</div>

										</c:forEach>
										<div style="display: flex; align-items: center;">
											<div>
												<a onClick="clickRight()" class="arrow-btn next round">&#8250;</a>
											</div>
										</div>
										<%-- <button >right</button>--%>
									</div>
									<div class="transfer-box" style="height:100px; padding:30px; border-top: 1px solid #cccccc;display:none; justify-content:space-between">
										<div style="display:flex">
											<p style="line-height: 40px;margin-right:10px">가상계좌: </p>
											<select name="accounts" id="account-select" onChange="accountSelected()">
												<option value="">--선택하세요--</option>
												<c:forEach items="${virtureAccountList}" var="virtureAccount">
													<option value="${virtureAccount.accountNo}">${virtureAccount.company}</option>
												</c:forEach>
											</select>
										</div>
										<input style="width:200px;" id="account-input" readonly>
										
										</input>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="width:32%; margin-left:40px">
					<div style="position:sticky;top:110px;">
						<div style="width: 310px; height: 250px; border: 1px solid black">
							<div style="height: 80%;">
								<div
									style="width: 100%; height: 100%; padding-left: 20px; padding-right: 20px; padding-top: 5px">
									<div
										style="border-bottom: 1px solid #CCCCCC; text-align: center; height: 35px">최종결제금액</div>
									<div
										style="margin-top: 10px; display: flex; justify-content: space-between;">
										<div>상품 합계</div>
										<div>₩<span id="prod-price"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/></span></div>
									</div>
									<div
										style="margin-top: 10px; display: flex; justify-content: space-between;">
										<div>배송비</div>
										<div>₩0</div>
									</div>
									<div
										style="margin-top: 10px; display: flex; justify-content: space-between;">
										<div>쿠폰</div>
										<div>-₩<span id="coupon">0</span></div>
									</div>
									<div
										style="margin-top: 10px; display: flex; justify-content: space-between;">
										<div>H.Point</div>
										<div>-₩<span id="discount-point">0</span></div>
									</div>
								</div>
							</div>
							<div style="height: 20%; background-color: #f5f5f5;">
								<div
									style="padding-top: 12px; padding-left: 20px; padding-right: 20px">
									<div style="float: left;">합계</div>
									<div
										style="float: right; line-height: 24px; font-size: 18px; color: #c69c6c; text-align: right;">₩<span id="total-price"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/></span></div>
								</div>
							</div>
						</div>
						<div
						style="width: 310px;border: 1px solid black; margin-top: 15px;">
						<div style="height: 65%; padding: 10px;">
							<input type="checkbox" id="agree"> <label for="agree">구매자
								동의</label>
							<div>
								<p
									style="font-size: 12px; vertical-align: top; line-height: 20px; color: #999">
									주문할 상품의 상품명, 가격, 배송정보 등 판매조건을 확인<br>하였으며, 구매진행에 동의합니다.<br>(전자상거래법
									제8조 2항)
								</p>
								<p
									style="margin-top: 20px; font-size: 12px; vertical-align: top; line-height: 20px; color: #999">
									기존 마이너스 한섬 마일리지를 보유하고 있는 고객은 한섬<br>마일리지가 차감돠어 적립되는 것에
									동의합니다. 적립 예정<br>한섬마일리지가 상이할 수 있습니다.
								</p>
							</div>
						</div>
					</div>
						<div style="margin-top:15px; width:100%">
							<div style="margin:0px auto; width:100%">
								<button id="card-btn" type="button" class="btn btn-lg btn-dark" data-toggle="modal" data-target="#exampleModal" style="width:100%">
  									결제하기
								</button>
								<button id="transfer-btn" style="display:none" type="button" class="btn btn-secondary" onClick="postOrderForm()">
  									결제하기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">원클릭 결제 서비스</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="display:flex; justify-content:space-between">
      	<div style="width:30%">
      		<select class="form-control" name="installment" id="installment" title="할부"style="width:95px; margin:0px">
				<option value="일시불">일시불</option>
				<option value="1개월">1개월</option>
				<option value="3개월">3개월</option>
				<option value="6개월">6개월</option>
				<option value="12개월">12개월</option>
				<option value="18개월">18개월</option>
				<option value="24개월">24개월</option>
			</select>
      	</div>
       	<input type="password" class="form-control" id="oneClickPassword" placeholder="Password" style="width:50%">
       	<a type="button" class="btn btn-sm btn-primary" style="height:40px" onClick="oneClikAjax()">확인</a>
      </div>
      <div class="modal-footer" style="display:flex; justify-content:space-between">
      	<div id="passwordAlert" style="border:1px solid #ced4da; width:70%; height:35px; border-radius:5px;padding-top:4px; padding-left:8px; background-color:#f9d7db; color:#af7175; display:none">*비밀번호가 맞지 않습니다.</div>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<script>

	function validation(){
		
	}

	function oneClikAjax(){
		
		let modal = document.querySelector(".modal");
		let password = $("#oneClickPassword").val();
		let memberId = document.querySelector("#memberIdDiv").innerHTML;
		let cardNo = document.querySelector(".show #card-no").innerHTML;
		let company = document.querySelector(".show #card-company").innerHTML;
		let data = {"payPassword":password,"memberId":memberId,"cardNo":cardNo,"company":company}
		let alretBox = document.querySelector("#passwordAlert");
		let flag = 0;
		
		$.ajax({
			type:"POST",
			url:"oneClickAjax",
			data:data
		}).done((data)=>{
			console.log(data);
			if(data.result=="success"){
				flag = 1;
				console.log("비밀번호가 맞음");
			}else{
				flag = 2
				console.log("비밀번호가 맞지 않음")
				alretBox.style.display="block";
			}
		}).done(()=>{
			if(flag==1){
				$('.modal').modal("hide"); 
				postOrderForm();
			}
		})		
	}

	function accountSelected(){
		let accountNum = $("#account-select option:selected").val();
		$("#account-input").val(accountNum);
	}


	function payChange(){
		console.log(event.currentTarget.id);
		cardBox = document.querySelector(".card-box");
		transferBox = document.querySelector(".transfer-box");
		cardBtn = document.querySelector("#card-btn");
		transferBtn = document.querySelector("#transfer-btn");
		if(event.currentTarget.id==="transfer"){
			cardBox.style.display="none";
			transferBox.style.display="flex";
			transferBtn.style.display = "block";
			cardBtn.style.display = "none";
		}else{
			cardBox.style.display="flex";
			transferBox.style.display="none";
			transferBtn.style.display = "none";
			cardBtn.style.display = "block";
		}
		console.log("-----")
	}

	function clickRight(){
		//console.log("------");
		let showEle = document.querySelector(".show");
		console.log(showEle.classList.contains("card"))
		if(showEle.nextElementSibling.classList.contains("card")){
			
			//console.log(showEle.nextElementSibling.nextElementSibling);
			

			showEle.nextElementSibling.classList.add("show");
			showEle.classList.remove("show");
			showEle.style.display="none";
			showEle.nextElementSibling.style.display="block";			
		}

		
		
	}
	
	function clickLeft(){
		let showEle = document.querySelector(".show");
		if(showEle.previousElementSibling.classList.contains("card")){
			
			//console.log(showEle.nextElementSibling.nextElementSibling);
			
	
			showEle.previousElementSibling.classList.add("show");
			showEle.classList.remove("show");
			showEle.style.display="none";
			showEle.previousElementSibling.style.display="block";
		}
	}

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

	function emailChange() {
		let selectedEmail = $("#emailSel").val();
		$("#rec-email2").val(selectedEmail);
	}
	
	function resetPoint(){
		document.querySelector("#discount-point").innerHTML = 0;
		document.querySelector("#remain-point").innerHTML = convertPrice(document.querySelector("#cur-point").innerHTML);
		$("#apply-point").val(0);
		document.querySelector("#total-price").innerHTML = document.querySelector("#prod-price").innerHTML;
		
		let priceList = document.querySelectorAll(".priceList");
		
		for(let element of priceList){
			let detailPrice = element.querySelector(".detail-price");
			let originPrice  = element.querySelector(".originPrice").innerHTML;
			detailPrice.innerHTML = originPrice;
			element.querySelector(".originBox").style.display="none";
			element.querySelector(".appliedPoint").innerHTML = 0;
		}
	}
	
	function applyPoint(){
		//let curPoint = document.querySelector("#cur-point").innerHTML;
		let applyPoint = convertNum($("#apply-point").val());
		let remainPoint = convertNum(document.querySelector("#remain-point").innerHTML);
		let discountPoint = convertNum(document.querySelector("#discount-point").innerHTML);
		let prodPrice = convertNum(document.querySelector("#prod-price").innerHTML);
		
		let priceList = document.querySelectorAll(".priceList");
		

		
		console.log(applyPoint+" "+remainPoint+" "+discountPoint+" "+prodPrice);
		if(applyPoint>remainPoint){
			alert("잔액포인트보다 많은 포인트를 사용할 수 없습니다.");	
		}else{
			document.querySelector("#remain-point").innerHTML = convertPrice(remainPoint - applyPoint);
			document.querySelector("#discount-point").innerHTML = convertPrice(discountPoint+applyPoint);
			document.querySelector("#total-price").innerHTML = convertPrice(prodPrice-(discountPoint+applyPoint));
			
			let len = priceList.length;
			let dPoint = parseInt(applyPoint/len);
			
			for(let element of priceList){
				let detailPrice = element.querySelector(".detail-price");
				let price  = convertNum(detailPrice.innerHTML);
				detailPrice.innerHTML = convertPrice(price-dPoint);
				element.querySelector(".originBox").style.display="block";
				element.querySelector(".appliedPoint").innerHTML = dPoint;
			}
		}
		$("#apply-point").val(0);
	}
	
	function allPointApply(box){
		let curPoint = convertNum(document.querySelector("#remain-point").innerHTML);
		if(box.checked==true){
			$("#apply-point").val(curPoint);
		}else{
			$("#apply-point").val(0);
		}
		
	}

	function postOrderForm() {
		
		let orderList = document.querySelectorAll("#orderTable tbody tr");
		let memberId = document.querySelector(".member-id").innerHTML;
		let recName = $("#rec-name").val();
		let hp = $("#hp1").val()+"-"+$("#hp2").val()+"-"+$("#hp3").val();
		let tel = $("#ph1").val()+"-"+$("#ph2").val()+"-"+$("#ph3").val();
		let request = $("#request").val();
		let recEmail = $("#rec-email1").val()+"@"+$("#rec-email2").val();
		let priceTotal = convertNum(document.querySelector("#total-price").innerHTML);
		let discountPrice = convertNum(document.querySelector("#discount-point").innerHTML);
		let zipcode = $("#zipcode").val();
		let addr = $("#addr").val();
		let detailAddr = $("#detail-addr").val();
		let paymentType = "";
		let payAccount = "";
		let company = "";
		let installment = $("#installment").val();
		let point = discountPrice;
		let zipCode = 12435;
		let state = 2;
		
		
		
		
		console.log(orderList);
		let radios = document.querySelectorAll(".payment-way");
		
		console.log(radios);
		for(radio of radios){
			console.log(radio.id);
			if(radio.checked){
				if(radio.id=="transfer"){
					paymentType = "계좌이체";
					company = $("#account-select option:selected").text();;
					payAccount = $("#account-select").val();	
					state = 1;
					
				}else{
					paymentType = "신용카드";
					console.log(document.querySelector(".show"));
					company = document.querySelector(".show  #card-company").innerHTML;
					payAccount = document.querySelector(".show  #card-no").innerHTML;
				}
					
			}
		}
		
		console.log(orderList,memberId,recName,hp,tel,request,recEmail,priceTotal,discountPrice,zipcode,addr,detailAddr,paymentType,point);
		

		let detailList = [];
		let data = {
				"memberId":memberId,
				"priceTotal":priceTotal,
				"priceDiscount":discountPrice,
				"request":request,
				"addr":addr,
				"detailAddr":detailAddr,
				"zipcode":zipcode,
				"tel":tel,
				"phone":hp,
				"paymentType":paymentType,
				"point":point,
				"zipCode":zipCode,
				"recName":recName
		}
		for (let index = 0; index <orderList.length; index++) {			
			 let productDetailNo = orderList[index].querySelector(".detail-id").innerHTML;
			 let amount = parseInt(orderList[index].querySelector(".detail-amount").innerHTML);
			 let size = orderList[index].querySelector(".detail-size").innerHTML;
			 let price = parseInt(convertNum(orderList[index].querySelector(".detail-price").innerHTML));
			 let point = parseInt(orderList[index].querySelector(".appliedPoint").innerHTML);
			 
			 let detailOrder = {"productDetailNo":productDetailNo,"amount":amount,"size":size,"price":price};
			 detailList.push(detailOrder);
			 console.log(productDetailNo+" "+amount+" "+size+" "+price+" "+state);
			 data['detailList[' + index +'].productDetailNo'] = productDetailNo;
			 data['detailList[' + index +'].amount'] = amount; 
			 data['detailList[' + index +'].psize'] = size; 
			 data['detailList[' + index +'].price'] = price; 
			 data['detailList[' + index +'].state'] = state; 
			 data['detailList[' + index +'].discount'] = point; 
		}
		
		data['paymentList[' + 0 +'].paymentType'] = paymentType;
		data['paymentList[' + 0 +'].price'] = priceTotal-discountPrice;
		data['paymentList[' + 0 +'].payAccount'] = payAccount;
		data['paymentList[' + 0 +'].company'] = company;
		
		if(paymentType=='신용카드'){
			data['paymentList[' + 0 +'].installment'] = installment;
		}
		if(point>0){
			data['paymentList[' + 1 +'].paymentType'] = "포인트";
			data['paymentList[' + 1 +'].price'] = point;
		}
		console.log(data);
		
		
		
		$.ajax({
			type:"POST",
			url:"orderFormAjax",
			data: data
		}).done((data)=>{
			if(data.result=="success"){
				alert("주문이 완료됐습니다.");
				location.href="/order/orderDetail?orderNo="+data.orderNo;
			}else if(data.result=="fail"){
				alert("예상치 못한 오류가 발생했습니다.");
				location.href="/";
			}else{
				alert(data.productName+"의 재고가 부족합니다.");
			}
		});		
	}
	
	
	function couponSelect(price, brand){
		console.log(price +"  " + brand);
		var x = (window.screen.width / 2) - (700 / 2);
		var y= (window.screen.height /2) - (400 / 2);
		var popUp = window.open("/order/couponPopup?price="+price+"&brand="+brand, "쿠폰 적용", "width=700, height=400, left="+ x + ", top="+ y + ", screenX="+ x + ", screenY= "+ y);
		popUp.focus();
	}
	
	function responseDiscountInfo(totalDiscountPrice,couponNo){
		alert("부모 " + totalDiscountPrice + " / " + couponNo);
	}
	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
