<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <style>
      p{
        padding: 0px;
        margin: 0px;
      }
    </style>

<div>

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
							<col width="60%" />
							<col width="18%" />
							<col width="22%" />
						</colgroup>
						<thead style="background-color: #F5F5F5;">
							<tr style="text-align: center; height: 47px; font-size: 15px;">
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">판매가</th>
							</tr>
						</thead>
						<tbody>
							<tr style="text-align: center; height: 132px;">
								<td class="detail-id" style="display:none">SH2B9WJM343N_RD</td>
								<td class="d-flex"><img src="${pageContext.request.contextPath}/resources/images/model.jpeg" alt=""
									style="width: 98px; height: 98px;">
									<div style="text-align: left; margin-left: 20px;">
										<a style="color: black;" href="#"> SYSTEM HOMME</br> 컬러 라인 니트 탑
										</a>
										<p style="margin-top: 10px;">color :  <p class="detail-color">BLACK</p> / size : <p class="detail-size">100</p></p>
									</div></td>
								<td
									class="detail-amount" style="border-left: 1px solid #E5E5E5; border-right: 1px solid #E5E5E5; vertical-align: middle;">1</td>
								<td class="detail-price" style="vertical-align: middle;">345,000₩</td>
							</tr>
							<tr style="text-align: center; height: 132px;">
								<td class="detail-id" style="display:none">SH2B9WJM333M_BK</td>
								<td class="d-flex"><img src="http://newmedia.thehandsome.com/MM/2B/FW/MM2B9WCT404M_CM_W01.jpg/dims/resize/684x1032/" alt=""
									style="width: 98px; height: 98px;">
									<div style="text-align: left; margin-left: 20px;">
										<a style="color: black;" href="#"> SYSTEM HOMME</br> 핸드 메이드 패딩 코트
										</a>
										<p style="margin-top: 10px;">color : <p class="detail-color">BLACK</p> / size : <p class="detail-size">100</p></p>
									</div></td>
								<td
									 class="detail-amount" style="border-left: 1px solid #E5E5E5; border-right: 1px solid #E5E5E5; vertical-align: middle;">1</td>
								<td  class="detail-price" style="vertical-align: middle;">758,000₩</td>
							</tr>
							<tr style="text-align: center; height: 132px;">
								<td class="detail-id" style="display:none">MM2B9WCT404M_CM</td>
								<td class="d-flex"><img src="http://newmedia.thehandsome.com/SH/2B/FW/SH2B9WJM333M_BK_W01.jpg/dims/resize/684x1032/" alt=""
									style="width: 98px; height: 98px;">
									<div style="text-align: left; margin-left: 20px;">
										<a style="color: black;" href="#"> SYSTEM HOMME</br> 플랩 점퍼
										</a>
										<p style="margin-top: 10px;">color : <p class="detail-color">BLACK</p> / size :<p class="detail-size">100</p></p>
									</div></td>
								<td
									class="detail-amount" style="border-left: 1px solid #E5E5E5; border-right: 1px solid #E5E5E5; vertical-align: middle;">1</td>
								<td class="detail-price" style="vertical-align: middle;">690,000₩</td>
							</tr>
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
									<td>김정우</td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">휴대폰</td>
									<td>010-2777-5370</td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">E-mail</td>
									<td>kjw970103@gmail.com</td>
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
										name="postcode" type="text" readonly> <input
										value="조회" id="adressBtn" name="adressBtn" type="button">
										<div style="margin-top: 10px;">
											<input style="width: 100%;" id="addr" name="adress"
												type="text" value="서울시 송파구 가락동">
										</div>
										<div style="margin-top: 10px;">
											<input style="width: 100%;" value="나머지 주소를 입력해주세요"
												id="detail-addr" name="adressDetail" type="text" >
										</div></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space"><strong
										style="color: #c59c6c; margin-right: 5px;">*</strong>수령인</td>
									<td><input style="width: 150px;" value="김정우" title="수령인"
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
										maxLength=4 style="width: 80px" value="1234">
									<div
											style="display: inline-block; margin-left: 8px; margin-right: 8px">-</div>
										<input id="hp3" name="hp3" title="휴대폰 마지막자리" type="text"
										maxLength=4 style="width: 80px" value="5370"></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">연락처</td>
									<td><select name="ph1" id="ph1" title="연락처 앞자리"
										style="width: 80px">
											<option value="">선택</option>
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
										name="ship_req" type="text" value="파손 조심하셈">
									<div style="display: inline-block; margin-left: 10px;">0 /
											20자</div></td>
								</tr>
								<tr>
									<td style="background-color: #F5F5F5;" scope="row"
										class="th_space">수령인 E-mail</td>
									<td>
	                      			<input id="rec-email1" name="rec-email1" title="이메일앞자리" type="text" style="width:120px" value="kjw1234"><div  style="display: inline-block;  margin-left:8px; margin-right:8px">@</div><input id="rec-email2" name="rec-email2" title="이메일주소" type="text" style="width:120px">
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
												사용 (잔액 : <span id="remain-point">50,000</span>P)</p>
											<div id="cur-point" style="display:none">50000</div>
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
								<div
									style="height: 100%; width: 80%; display: flex; padding: 10px">
									<div style="margin-top: 3px;" class="form-check">
										<input class="form-check-input payment-way" type="radio" name="purchaseCheck"
											id="credit"> <label style="margin-right: 20px;"
											class="form-check-label" for="credit"> 신용카드 </label>
									</div>
									<div style="margin-top: 3px;" class="form-check">
										<input class="form-check-input payment-way" type="radio" name="purchaseCheck"
											id="transfer" checked> <label class="form-check-label"
											for="transfer"> 실시간 계좌이체 </label>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="width:32%; margin-left:40px">
					<div style="position:sticky;top:20px;">
						<div style="width: 310px; height: 220px; border: 1px solid black">
							<div style="height: 70%;">
								<div
									style="width: 100%; height: 100%; padding-left: 20px; padding-right: 20px; padding-top: 5px">
									<div
										style="border-bottom: 1px solid #CCCCCC; text-align: center; height: 35px">최종결제금액</div>
									<div
										style="margin-top: 10px; display: flex; justify-content: space-between;">
										<div>상품 합계</div>
										<div><span id="prod-price">1,795,000</span>₩</div>
									</div>
									<div
										style="margin-top: 10px; display: flex; justify-content: space-between;">
										<div>배송비</div>
										<div>0</div>
									</div>
									<div
										style="margin-top: 10px; display: flex; justify-content: space-between;">
										<div>할인 금액</div>
										<div>- <span id="discount-point">0</span>₩</div>
									</div>
								</div>
							</div>
							<div style="height: 30%; background-color: #f5f5f5;">
								<div
									style="padding-top: 18px; padding-left: 20px; padding-right: 20px">
									<div style="float: left;">합계</div>
									<div
										style="float: right; line-height: 24px; font-size: 18px; color: #c69c6c; text-align: right;"><span id="total-price">1,795,000</span>₩</div>
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
							<div style="margin:0px auto; width:90px">
								<button onclick="postOrderForm()"
											class="btn btn btn-secondary">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<script>

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
		
	}
	
	function applyPoint(){
		//let curPoint = document.querySelector("#cur-point").innerHTML;
		let applyPoint = convertNum($("#apply-point").val());
		let remainPoint = convertNum(document.querySelector("#remain-point").innerHTML);
		let discountPoint = convertNum(document.querySelector("#discount-point").innerHTML);
		let prodPrice = convertNum(document.querySelector("#prod-price").innerHTML);
		
		console.log(remainPoint - applyPoint);
		if(applyPoint>remainPoint){
			alert("잔액포인트보다 많은 포인트를 사용할 수 없습니다.");	
		}else{
			document.querySelector("#remain-point").innerHTML = convertPrice(remainPoint - applyPoint);
			document.querySelector("#discount-point").innerHTML = convertPrice(discountPoint+applyPoint);
			document.querySelector("#total-price").innerHTML = convertPrice(prodPrice-(discountPoint+applyPoint));
		}
		$("#apply-point").val(0);
	}
	
	function allPointApply(box){
		console.log("aaaaa");
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
		let point = discountPrice;
		
		
		
		let radios = document.querySelectorAll(".payment-way");
		
		console.log(radios);
		for(radio of radios){
			console.log(radio.id);
			if(radio.checked){
				paymentType = radio.id;	
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
		}
		for (let index = 0; index <orderList.length; index++) {			
			 let productDetailNo = orderList[index].querySelector(".detail-id").innerHTML;
			 
			 let amount = parseInt(orderList[index].querySelector(".detail-amount").innerHTML);
			 let size = parseInt(orderList[index].querySelector(".detail-size").innerHTML);
			 let price = parseInt(orderList[index].querySelector(".detail-price").innerHTML);
			 let state = 1;
			 let detailOrder = {"productDetailNo":productDetailNo,"amount":amount,"size":size,"price":price};
			 detailList.push(detailOrder);
			 console.log(productDetailNo+" "+amount+" "+size+" "+price+" "+state);
			 data['detailList[' + index +'].productDetailNo'] = productDetailNo;
			 data['detailList[' + index +'].amount'] = amount; 
			 data['detailList[' + index +'].size'] = size; 
			 data['detailList[' + index +'].price'] = price; 
		}
		
		data['paymentList[' + 0 +'].paymentType'] = paymentType;
		data['paymentList[' + 0 +'].price'] = priceTotal-discountPrice;
		
		if(point>0){
			data['paymentList[' + 1 +'].paymentType'] = "point";
			data['paymentList[' + 1 +'].price'] = point;
		}
		console.log(data);
		

		
		$.ajax({
			type:"POST",
			url:"orderFormProc",
			data: data
		}).done((data)=>{
			if(data.result=="success"){
				location.href="/order/orderList";
			}else{
				console.log("------");
			}
		});
	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
