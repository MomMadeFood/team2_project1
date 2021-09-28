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
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-3 login_box">
			<div class="row" style="height: 70%">
				<div>
					<div class="row mt-5">
						<div class="col-sm-2"></div>
						<div class="col-sm-9 title_wrap member-text">회원</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row mt-3">
						<div class="col-sm-2"></div>
						<div class="col-sm-9">
							<input style="width: 100%;" id="id" name="id" type="text"
								class="mt-3"> <input style="width: 100%;" id="password"
								name="password" type="password" class="mt-3">
							<button type="button"
								class="btn btn-lg btn-dark btn-block btn-join mt-3">로그인</button>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-9">
							<input id="save_id" name="save_id" type="checkbox" class="mt-3">
							<label for="save_id" class="join_txt2">아이디 저장</label>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row mt-3">
						<div class="col-sm-2"></div>
						<div class="col-sm-5 d-flex justify-content-end"
							style="border-right: 4px solid #555">
							<button type="button" id="btn-login-otp">OTP 인증번호 로그인</button>
						</div>
						<div class="col-sm-4">
							<button type="button" id="btn-login-guest">비회원 주문조회</button>
						</div>
						<div class="col-sm-1"></div>
					</div>
				</div>
			</div>
			<div class="row member-bottom" style="height: 30%">
				<div class="col-sm-2"></div>
				<div class="col-sm-9 title_wrap">
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
				<div class="col-sm-1"></div>
			</div>
		</div>
		<div class="col-sm-3 login_box">
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
		<div class="col-sm-3"></div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>