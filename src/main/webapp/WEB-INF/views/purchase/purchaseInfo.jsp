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
	<div class="container-fluid">
		<div class="row" style="margin: 0px auto; width: 990px;">
			<div class="col-sm-9">
				<table class="table .txt" style="border-bottom: 1px solid #E5E5E5;">
					<colgroup>
						<col width="70%" />
						<col width="8%" />
						<col width="22%" />
					</colgroup>
					<thead style="background-color: #F5F5F5;">
						<tr style="text-align: center; height: 47px; font-size: 15px;">
							<th scope="col">상품정보</th>
							<th scope="col">수량</th>
							<th scope="col">판매가/쿠폰 적용가</th>
						</tr>
					</thead>
					<tbody>
						<tr style="text-align: center; height: 132px;">
							<td class="d-flex"><img src="${pageContext.request.contextPath}/resources/images/model.jpeg" alt=""
								style="width: 98px; height: 98px;">
								<div style="text-align: left; margin-left: 20px;">
									<a style="color: black;" href="#"> SYSTEM HOMME</br> 컬러 라인 니트 탑
									</a>
									<p style="margin-top: 10px;">color : BLACK / size : 100</p>
								</div></td>
							<td
								style="border-left: 1px solid #E5E5E5; border-right: 1px solid #E5E5E5; vertical-align: middle;">1</td>
							<td style="vertical-align: middle;">345,000</td>
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
								<td><input style="width: 80px" title="우편번호" id="adress"
									name="postcode" type="text" readonly> <input
									value="조회" id="adressBtn" name="adressBtn" type="button">
									<div style="margin-top: 10px;">
										<input style="width: 100%;" id="adress" name="adress"
											type="text">
									</div>
									<div style="margin-top: 10px;">
										<input style="width: 100%;" value="나머지 주소를 입력해주세요"
											id="adressDetail" name="adressDetail" type="text">
									</div></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5;" scope="row"
									class="th_space"><strong
									style="color: #c59c6c; margin-right: 5px;">*</strong>수령인</td>
								<td><input style="width: 150px" value="김정우" title="수령인"
									id="rec_name" name="rec_name" type="text"></td>
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
									maxLength=4 style="width: 80px">
								<div
										style="display: inline-block; margin-left: 8px; margin-right: 8px">-</div>
									<input id="hp3" name="hp3" title="휴대폰 마지막자리" type="text"
									maxLength=4 style="width: 80px"></td>
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
									maxLength=3 style="width: 80px">
								<div
										style="display: inline-block; margin-left: 8px; margin-right: 8px">-</div>
									<input id="ph3" name="ph3" title="연락처 마지막자리" type="text"
									maxLength=4 style="width: 80px"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5;" scope="row"
									class="th_space">배송요청사항</td>
								<td><input style="width: 80%;" id="ship_req"
									name="ship_req" type="text">
								<div style="display: inline-block; margin-left: 10px;">0 /
										20자</div></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5;" scope="row"
									class="th_space">수령인 E-mail</td>
								<td><input style="width: 120px">
								<div id="hp3" name="hp3" title="휴대폰 마지막자리" type="text"
										maxLength=4
										style="display: inline-block; margin-left: 8px; margin-right: 8px">@</div>
									<input style="width: 120px"> <select title="이메일 계정"
									id="emailDelySel">
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
						style="height: 180px; width: 100%; clear: both; border-bottom: 2px solid #cccccc">
						<div
							style="display: flex; height: 70%; border-top: 1px black solid; border-bottom: 1px solid #cccccc;">
							<div
								style="height: 100%; width: 20%; background-color: #F5F5F5; padding-left: 20px; padding-top: 20px">
								<p style="font-weight: bold">H.Point 결제</p>
							</div>
							<div style="height: 100%; width: 80%; padding: 10px;">
								<div style="display: flex; justify-content: space-between;">
									<div style="display: flex;">
										<input style="width: 130px;" type="text" id="pointBox"
											name="pointBox">
										<p
											style="margin-left: 10px; font-size: 12px; font-weight: bold; padding-top: 5px">P
											사용 (잔액 : 50P)</p>
									</div>
									<div style="display: flex;">
										<div style="padding-top: 2px">
											<input type="checkbox" id="allUse">
										</div>
										<p
											style="font-size: 12px; font-weight: bold; padding-top: 5px; margin-left: 10px">모두사용</p>
										<button style="width: 50px; margin-left: 10px;" type="button"
											class="btn btn-sm btn-secondary">적용</button>
										<button type="button" style="width: 80px; margin-left: 10px"
											class="btn btn-sm btn-secondary">적용취소</button>
									</div>
								</div>
								<div style="display: flex; margin-top: 10px">
									<p
										style="padding-top: 5px; padding-right: 10px; font-size: 12px; vertical-align: middle; line-height: 20px; color: #999">*
										100 포인트 이상부터 사용이 가능합니다.</p>
									<button type="button" style="width: 100px; margin-left: 10px"
										class="btn btn-sm btn-secondary">충전하러가기</button>
								</div>
							</div>
						</div>
						<div style="display: flex; height: 30%; width: 100%;">
							<div
								style="height: 100%; width: 20%; background-color: #F5F5F5; padding-left: 20px; padding-top: 10px">
								<p style="font-weight: bold">결제수단 선택</p>
							</div>
							<div
								style="height: 100%; width: 80%; display: flex; padding: 10px">
								<div style="margin-top: 3px;" class="form-check">
									<input class="form-check-input" type="radio" name="credit"
										id="credit"> <label style="margin-right: 20px;"
										class="form-check-label" for="credit"> 신용카드 </label>
								</div>
								<div style="margin-top: 3px;" class="form-check">
									<input class="form-check-input" type="radio" name="transfer"
										id="transfer" checked> <label class="form-check-label"
										for="transfer"> 실시간 계좌이체 </label>
								</div>
								<a href="confirm" style=" margin-left: 10px"
									class="btn btn-secondary">결제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div style="width: 310px; height: 220px; border: 1px solid black">
					<div style="height: 70%;">
						<div
							style="width: 100%; height: 100%; padding-left: 20px; padding-right: 20px; padding-top: 5px">
							<div
								style="border-bottom: 1px solid #CCCCCC; text-align: center; height: 35px">최종결제금액</div>
							<div
								style="margin-top: 30px; display: flex; justify-content: space-between;">
								<div>상품 합계</div>
								<div>345,000</div>
							</div>
							<div
								style="margin-top: 20px; display: flex; justify-content: space-between;">
								<div>배송비</div>
								<div>3000</div>
							</div>
						</div>
					</div>
					<div style="height: 30%; background-color: #f5f5f5;">
						<div
							style="padding-top: 18px; padding-left: 20px; padding-right: 20px">
							<div style="float: left;">합계</div>
							<div
								style="float: right; line-height: 24px; font-size: 18px; color: #c69c6c; text-align: right;">348,000</div>
						</div>
					</div>
				</div>
				<div
					style="width: 310px;border: 1px solid black; margin-top: 15px;">
					<div
						style="height: 35%; border-bottom: 1px solid #CCCCCC; padding: 10px;">
						<p
							style="font-size: 12px; margin: 0px; font-weight: bold; color: #414040;">구매
							시 지급 예정 포인트</p>
						<p>(제품 수령 완료 후 10일 후 적립)</p>
						<p style="color: #c69c6c;">한섬마일리지 14,750 M</p>
						<p style="color: #c69c6c;">H.Point 259 P</p>
					</div>
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
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
