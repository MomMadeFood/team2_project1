<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container-fluid" style="height: 1000px">
	<div class="row" style="height: 100%; margin-top: 20px;">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="row" style="height: 100%">
				<div class="col-sm-7">
					<img style="width: 100%" src="${pageContext.request.contextPath}/resources/images/product1.jpeg">
				</div>
				<div class="col-sm-5">
					<div class="item_detail_info float_right" id="contentDiv">
						<div class="info">
							<div class="info_sect">
								<h4 class="item_name">
									<div class="brand-name">
										<a href="javascript:fn_goCategori('br45')"
											onclick="GA_Detail('brand',$(this))">O'2nd</a>
									</div>
									<span class="name ko_fir_spel"> 펄 돌먼 점퍼</span> <input
										type="hidden" id="brandName" value="O'2nd" /> <input
										type="hidden" id="productName" value="펄 돌먼 점퍼" /> <input
										type="hidden" id="productCode" value="O22B9ROT502W_CR" />
								</h4>


								<p class="price">
									<span>₩598,000</span> <input type="hidden" id="productPrice"
										value="598000" />
								</p>
								<!-- 상품추가설명 -->
								<p class="selling_point"></p>
								<!-- 20200914이후 추가 상품설명 (신) -->
								<div class="prod-detail-con-box">
									<strong class="number-code">상품품번 &#58; <span>O22B9ROT502W_CR</span></strong>
									<div class="round-style"
										style="border-radius: 20px; background-color: #F5F5F5; color: #555555">
										<p class="description">여밈 부분을 따라 이어지는 펄 비즈가 특징으로 양쪽을 서로
											언밸런스하게 매치하여 한층 색다른 느낌을 주었습니다. 암홀 라인이 여유로운 돌먼 소매 디자인으로 착용감과
											디자인을 모두 살렸으며, 부드럽고 고급스러운 터치감이 돋보이는 퀄리티 높은 소재를 사용하였습니다.</p>
									</div>
									<p class="size-text">
										
									<li>- 피팅 정보 : 176cm, 55 사이즈 모델이 76 사이즈 착용</li>
                                                        </p>
                                                            
                                                </div>
                                                <!-- 20200914 이전 상품설명(구) -->
                                    
                                    <!-- 20200904 추가 (더보기) -->
                                             <div class="info_sect">
                                                    <div
										class="prod-detail-con-more">
                                                        <button
											class="btn btn-dark dropdown-toggle btn-sm" type="button"
											id="dropdownMenu2" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">
                                                            더보기
                                                          </button>
                                                        <div
											class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                            <ul>
                                                                <li>- 램스울과 캐시미어 혼방 소재<br />- 앞면의 지퍼 클로징<br />- 양옆에 포켓<br />- 여밈과 소맷단, 밑단에 리브 니트</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <script>
                                                    $(document).ready(function() {
                                                        $('.prod-detail-con-more').on('click', '.more-btn', function(){
                                                            $('.more-con-box').slideToggle(function(){
                                                                $(this).parent('.prod-detail-con-more').find('.more-btn').toggleClass('on');
                                                            });
                                                        })
                                                    });
                                                </script>
                                                <div class="info_sect">
                                                    <ul
										class="point_delivery">
                                                        <li>
                                                            <span
											class="title">한섬마일리지</span>
                                                            <span
											class="txt">29,900&nbsp;M&nbsp;(5%)</span>
                                                        </li>
                                                        
                                                        <li>
                                                            <span
											class="title">H.Point</span>
                                                             <span
											class="txt">598&nbsp;P&nbsp;(0.1%)</span>

                                                            <script
												type="text/javascript">
                                                        $(document).ready(function(){
                                                            
                                                            
                                                                fn_tableMerge($("#noInterestTable").attr("id"));
                                                            
                                                                fn_tableMerge($("#partNoInterestTable").attr("id"));
                                                            
                                                            
                                                            $('.card img').each(function (){
                                                                $(this).attr('src',cdnImgUrl($(this).attr('orgurl')));
                                                            })
                                                        });

                                                            </script>
                                                        </li>
                                                        
                                                        <li>
                                                            <span
											class="title">배송비</span>
                                                            <span
											class="txt">30,000원 이상 무료배송 (실결제 기준)</span>
                                                            </br>
                                                            <span
											class="txt">30,000원 미만 배송비 2,500원</span>
                                                            </br>
                                                        </li>
                                                    </ul>
                                                </div>
                                <ul>
                                    <li>
                                        <span class="title">색상</span> 
                                        <div
											class="custom-control custom-radio custom-control-inline">
                                            <input type="radio"
												id="customRadioInline1" name="color"
												class="custom-control-input">
                                            <label
												class="custom-control-label" for="customRadioInline1">BLACK</label>
                                        </div>
                                        <div
											class="custom-control custom-radio custom-control-inline">
                                            <input type="radio"
												id="customRadioInline2" name="color"
												class="custom-control-input">
                                            <label
												class="custom-control-label" for="customRadioInline2">CREAM</label>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="title">사이즈</span>
                                        <div
											class="custom-control custom-radio custom-control-inline">
                                            <input type="radio"
												id="customRadioInline3" name="size"
												class="custom-control-input">
                                            <label
												class="custom-control-label" for="customRadioInline3">76(44)</label>
                                        </div>
                                        <div
											class="custom-control custom-radio custom-control-inline">
                                            <input type="radio"
												id="customRadioInline4" name="size"
												class="custom-control-input">
                                            <label
												class="custom-control-label" for="customRadioInline4">82(55)</label>
                                        </div>
                                        <div
											class="custom-control custom-radio custom-control-inline">
                                            <input type="radio"
												id="customRadioInline5" name="size"
												class="custom-control-input">
                                            <label
												class="custom-control-label" for="customRadioInline5">88(66)</label>
                                        </div>
                                    </li>
                                    <li>
                                        <tr style="text-align:center;">
                                            <td>남은 수량</td>
                                            <td class="bseq_ea">99</td>
                                            <td>
                                                <button
													class="btn btn-sm btn-outline-dark" type="button"
													onclick="fnCalCount('m',this);">-</button>
                                                <input type="text"
												name="pop_out" value="1" readonly="readonly"
												style="text-align:center;" />
                                                <button
													class="btn btn-sm btn-outline-dark" type="button"
													onclick="fnCalCount('p', this);">+</button>
                                            </td>
                                        </tr>
                                        <script>
                                            function fnCalCount(type, ths){
                                            var $input = $(ths).parents("td").find("input[name='pop_out']");
                                            var tCount = Number($input.val());
                                            var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
                                            console.log($input, tCount, tEqCount);
                                            if(type==='p'){
                                                if(tCount < tEqCount) $input.val(Number(tCount)+1);
                                                
                                            }else{
                                                if(tCount >0) $input.val(Number(tCount)-1);    
                                                }
                                        }
                                        </script>
                                    </li>
                                </ul>
                            <div
									class="total_price clearfix float-right">
                                <div class="title float_left">총 합계</div>
                                <div class="pirce float_right">
                                <span id="sumPrice">₩598,000</span>
                                </div>
                            </div>
                            <div class="btnwrap clearfix"
									style="position: absolute; width: 473px; margin-top: 0px; margin-bottom: 0px;">
                                <button type="button"
										class="btn btn-outline-dark">쇼핑백 담기</button>
                                <button type="button"
										class="btn btn-dark">바로 주문</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>       
        

<style>
p {
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	margin: 0;
	padding: 0;
	vertical-align: top;
	word-break: break-all;
	position: relative;
	font-size: 14px;
	color: #676767;
	line-height: 1.6;
}

* {
	font-family: "Malgun Gothic", "맑은 고딕", "Dotum", "돋움", AppleGothic,
		sans-serif;
}

body, p {
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
	-webkit-touch-callout: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	overflow-y: visible !important;
	color: #555;
	font-size: 12px;
}

a {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}

a:hover, a:active {
	text-decoration: none;
}

.div {
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	color: #555;
	font-size: 12px;
	margin: 0;
	vertical-align: top;
	line-height: 20px;
	word-break: break-all;
	padding: 25px 0;
	border-bottom: 1px solid #ebebeb;
}

div.dropdown-menu {
	border-radius: 12px;
	font-size: 12px;
}

.input {
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	color: #555;
	margin: 0;
	padding: 0;
	vertical-align: top;
	line-height: 20px;
	word-break: break-all;
	font-size: 16px;
	height: 40px;
	box-sizing: border-box;
	padding-top: 10px;
}

ul, li {
	list-style: none;
}

ul {
	padding: 10px;
}

div.brand-name {
	font-size: 16px;
	padding-bottom: 15px;
}

li {
	font-family: "Malgun Gothic", "맑은 고딕", "Dotum", "돋움", AppleGothic,
		sans-serif;
	padding-top: 5px;
	margin: 0px;
	padding: 0px;
}

p.price {
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	font-family: "Malgun Gothic", "맑은 고딕", "Dotum", "돋움", AppleGothic,
		sans-serif;
	margin: 0;
	padding: 0;
	vertical-align: top;
	line-height: 20px;
	word-break: break-all;
	font-size: 22px;
	color: #363636;
}

span.title, span.text {
	padding-top: 15px;
}

strong.number-code {
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	font-family: "Malgun Gothic", "맑은 고딕", "Dotum", "돋움", AppleGothic,
		sans-serif;
	color: #555;
	line-height: 20px;
	word-break: break-all;
	font-size: 12px;
	display: block;
	margin-bottom: 17px;
}

p.description {
	padding: 20px 35px;
}

.span#sumPrice {
	-webkit-text-size-adjust: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	font-family: "Malgun Gothic", "맑은 고딕", "Dotum", "돋움", AppleGothic,
		sans-serif;
	color: #555;
	margin: 0;
	padding: 0;
	vertical-align: top;
	line-height: 20px;
	word-break: break-all;
	font-size: inherit;
}

p.size-text {
	margin-top: 15px;
}

div.prod-detail-con-more {
	margin-top: 15px;
}

div.info_sect {
	margin-top: 15px;
}
</style>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>