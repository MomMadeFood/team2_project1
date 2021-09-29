<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <style>
      p{
        padding: 0px;
        margin: 0px;
      }
    </style>
    <div>

      <div style= "border-bottom: 1px solid #E5E5E5;margin-bottom:60px; height:100px; vertical-align:center;">
        <div style="margin:auto;padding-top:30px;width:300px; text-align:center; vertical-align:middle">
          <p style="font-size: 28px;">주문 상세 조회</p>
        </div>
      </div>
      <div style="width: 990px; margin:0px auto; width:990px;">

        <div style="background-color: #F5F5F5; height: 65px; margin-top:20px; border:1px solid #E5E5E5; display:flex">
          <div style="width: 70%; border-right:1px solid #E5E5E5; display:flex; padding:18px">
            <p  style="font-weight:bold">주문번호 : </p><p style="color:#c59c6c; font-weight:bold">210928P10845433</p>
          </div>
          <div style="width: 30%;display:flex; padding:18px">
            <p>주문일시: 2021.09.29 15:30</p>
          </div>
        </div>
        <div style="display:flex; justify-content: space-between ;margin-top:40px">
          <div>
            <h5 >주문상품</h5>
          </div>
        </div>
        <table class="table" style="border-bottom:1px solid #E5E5E5; margin-top:20px">
          <colgroup>
            <col width="32%"/>
            <col width="8%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="20%"/>
            <col width="20%"/>
          </colgroup>
          <thead style="background-color: #F5F5F5;">
            <tr style="text-align: center; height:47px; font-size:15px; ">
              <th scope="col">상품정보</th>
              <th scope="col">수량</th>
              <th scope="col">판매가</th>
              <th scope="col">실결제금액</th>
              <th scope="col">적립 한섬마일리지</th>
              <th scope="col">주문상태</th>
            </tr>
          </thead>
          <tbody>
            <tr style="height:150px;">
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right">
                <div style="display: flex; justify-content:between">
                  <div>
                    <img src="${pageContext.request.contextPath}/resources/images/model.jpeg" alt=""
								style="width: 98px; height: 98px;">
                  </div>
                  <div style="text-align:left; margin-left:20px;">
                    <a style="color:black;" href="#" >
                      SYSTEM HOMME</br>
                      컬러 라인 니트 탑
                    </a>
                    <p style="margin-top: 10px;font-size:12px;color:#CCC7CD">color : BLACK / size : 100</p>
                    <p style="margin-top: 10px; font-size:11px;">한섬 마일리지 : 5.0%  H.Point : 0.1%</p>
                  </div>
                </div>
              </td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>1</p></td>
              <td style="border-left: 1px solid #E5E5E5;vertical-align: middle; text-align:center"><p>₩345,000</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>₩280,000</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>한섬마일리지<br>17,250M</p><p style="margin-top: 20px;">H.Point<br>345P</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>구매</p></td>
            </tr>
          </tbody>
        </table>
        <div style="display:flex; justify-content: space-between ;margin-top:40px">
          <div>
            <h5 >결제정보</h5>
          </div>
          <div>
            <button type="button" style="width: 100px; margin-left:10px" class="btn btn-sm btn-secondary">상세보기</button>
            <button type="button" style="width: 100px; margin-left:10px" class="btn btn-sm btn-secondary">영수증출력</button>
          </div>
        </div>
        <table class="table" style="border-bottom:1px solid #E5E5E5; margin-top:20px">
          <colgroup>
            <col width="25%"/>
            <col width="25%"/>
            <col width="25%"/>
            <col width="25%"/>
          </colgroup>
          <thead style="background-color: #F5F5F5;">
            <tr style="text-align: center; height:47px; font-size:15px; ">
              <th scope="col">판매가</th>
              <th scope="col">배송비</th>
              <th scope="col">총 할인금액</th>
              <th scope="col">총 결제금액</th>
            </tr>
          </thead>
          <tbody>
            <tr style="height:20px;">
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right"><p>₩345,000</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right"><p>₩3,000</p></td>
              <td style="border-left: 1px solid #E5E5E5;vertical-align: middle; text-align:right"><p>₩48,000</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right"><p>₩300,000</p></td>
            </tr>
            <tr style="height:100px;">
              <td colspan='2' style="vertical-align: middle; text-align:right; border-left: 1px solid #E5E5E5;"></td>
              <td style="border-left: 1px solid #E5E5E5;vertical-align: middle; text-align:right">
                <div style="display:flex; justify-content: space-between;"><p>쿠폰할인</p><p>- ₩ 0</p></div>
                <div style="display:flex; justify-content: space-between;"><p>플러스포인트쿠폰</p><p>- ₩ 0</p></div>
                <div style="display:flex; justify-content: space-between;"><p>할인</p><p>- ₩ 0</p></div>
                <div style="display:flex; justify-content: space-between;"><p>한섬 VVIP 혜택</p><p>- ₩ 48,000</p></div>
                <div style="display:flex; justify-content: space-between;"><p>할인</p><p>- ₩ 0</p></div>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right">
                <div style="display:flex; justify-content: space-between;"><p>신용카드</p><p>₩ 280,000</p></div>
                <div style="display:flex; justify-content: space-between;"><p>한섬마일리지</p><p>20,000 M</p></div>
                <div style="display:flex; justify-content: space-between;"><p>e-money</p><p>0 P</p></div>
                <div style="display:flex; justify-content: space-between;"><p>H.Point</p><p>0 P</p></div>
                <div style="display:flex; justify-content: space-between;"><p>기프트 카드</p><p>₩ 0</p></div>
              </td>
            </tr>
          </tbody>
        </table>
        <div style="height: 140px; width:100%; clear:both; border-bottom: 1px solid #cccccc">
          <div style="display:flex; height: 33%; border-top:1px black solid;border-bottom: 1px solid #cccccc">
            <div style="height:100%; width:20%; background-color: #F5F5F5;padding-left:20px;padding-top:10px"><p style="font-weight:bold">주 결제수단</p></div>
            <div style="height:100%; width:80%;padding:10px;">
              <p>KB 국민카드 (9429-****-****-****)</p>
            </div>
          </div>
          <div style="display:flex; height: 33%; width:100%; border-bottom: 1px solid #cccccc">
            <div style="height:100%; width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">실 결제금액</p></div>
            <div style="height:100%; width:80%; display:flex; padding:10px">
              <p>₩ 280,000</p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;">
            <div style="height:100%; width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">할부 개월 수</p></div>
            <div style="height:100%; width:80%; display:flex; padding:10px">
              <p>일시불</p>
            </div>
          </div>
        </div>
        <div style="display:flex; justify-content: space-between ;margin-top:40px">
          <div>
            <h5 >배송지 정보</h5>
          </div>
        </div>
        <div style="margin-top:20px; width:100%; clear:both;">
          <div style="display:flex; height: 33%; border-top:1px black solid;border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5;padding-left:20px;padding-top:10px"><p style="font-weight:bold">배송지 주소</p></div>
            <div style="width:80%;padding:10px;">
              <p>서울시 송파구 가락동 xx-x번지 ***호</p>
            </div>
          </div>
          <div style="display:flex; height: 33%; width:100%; border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">수령인</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p>김정우</p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">휴대폰</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p>010-1234-5679</p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">연락처</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p></p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">배송시 요청사항</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p>없음</p>
            </div>
          </div>
        </div>
      </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
