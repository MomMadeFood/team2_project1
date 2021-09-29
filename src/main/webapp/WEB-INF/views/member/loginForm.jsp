<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<div class="container-fluid">
	<div class="row mb-5">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 d-flex justify-content-center">
			<h4>로그인</h4>
		</div>
		<div class="col-sm-2"></div>
	</div>

</div>


<div>
	<div style="width:990px; margin:0px auto; display:flex;">
		<div class="login_box">
			<div style="height:62%">
				<div class="mt-4">
					<div class="title_wrap member-text">회원</div>
				</div>
				<div class="pl-5 pr-5">
						<input style="width:100%;" id="id" name="id" type="text" class="mt-3"> 
						<input style="width: 100%;" id="password" name="password" type="password" class="mt-3">
						<button type="button" class="btn btn-lg btn-dark btn-block btn-join mt-3">로그인</button>
				</div>
				<div class="pl-5 pr-5">
					<input id="save_id" name="save_id" type="checkbox" class="mt-3">
					<label for="save_id" class="join_txt2">아이디 저장</label>
				</div>
				<div class="other-login-method">
					<div class="otp-login">
						<button type="button" id="btn-login-otp" class="mr-2">OTP 인증번호 로그인</button>
					</div>
					<div class="guest-login">
						<button type="button" id="btn-login-guest" class="ml-2">비회원 주문조회</button>
					</div>
				</div>
			</div> 
			<div class="member-bottom pl-5 pt-2">
				<div class="title_wrap">
					<p class="txt btn-des" style="line-height: 1.5;">
						<span style="font-weight: 800">ㆍ</span>H.Point 통합회원 아이디 / 비밀번호를
						잊으셨나요?
					</p>
					<button type="button"
						class="btn btn-sm btn-outline-secondary btn-search">통합회원
						아이디 찾기</button>
					<button type="button"
						class="btn btn-sm btn-outline-secondary btn-search">통합회원
						비밀번호 찾기</button>
					<p class="txt mt-3  btn-des" style="line-height: 1.5;">
						<span style="font-weight: 800">ㆍ</span>한섬 회원 아이디 / 비밀번호를 잊으셨나요?
					</p>
					<button type="button"
						class="btn btn-sm btn-outline-secondary btn-search">한섬 회원
						아이디/비밀번호 찾기</button>
				</div>
			</div>
		</div>
		<div class="login_box">
			<div>
				<div class="row mt-5">
					<div class="col-sm-1"></div>
					<div class="title_wrap">
						<h4>H.Point 통합회원 가입</h4>
						<p class="txt">현대백화점 그룹의 모든 서비스를 모두 이용할 수 있는 ID를 만듭니다.</p>
						<p class="join_txt2 mt10">
							한섬 온라인/오프라인 매장에서 모두 사용하실 수 있으며, 구매 시 <br>한섬마일리지가 적립됩니다.<br>한섬
							온라인 멤버십 ‘THE 클럽’의 혜택을 받으실 수 있습니다
						</p>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-sm-1"></div>
					<div class="col-sm-9">
						<button type="button"
							class="btn btn-lg btn-dark btn-block btn-join">통합회원 가입</button>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-sm-1"></div>
					<div class="title_wrap">
						<h4>더한섬닷컴 간편회원 가입</h4>
						<p class="txt" style="line-height: 1.5;">
							본인인증 절차 없이, 더한섬닷컴에서 제공하는 서비스만 제한적으로<br>이용할 수 있는 ID를 만듭니다.
						</p>
						<p class="join_txt2">
							더한섬닷컴에서 사용 가능하며, 오프라인 매장에서는 사용할 수 없습니다.<br> <span>한섬마일리지와
								현대백화점그룹 H.Point 혜택, 한섬의 온라인 멤버십 서비스<br>‘THE 클럽’의 혜택은 제공되지
								않습니다.
							</span>
						</p>
					</div>
				</div>
				<div class="row mt-3 mb-5">
					<div class="col-sm-1"></div>
					<div class="col-sm-9">
						<button type="button"
							class="btn btn-dark btn-lg btn-block btn-join">간편회원 가입</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>