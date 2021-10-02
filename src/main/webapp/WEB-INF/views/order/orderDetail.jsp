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
          <div style="width: 70%; border-right:1px solid #E5E5E5; display:flex; align-items: center; margin-left: 10px; ">
            <p  style="font-weight:bold; font-size:15px">주문번호 : </p><p style="color:#c59c6c; font-weight:bold;font-size:15px">${mOrderDTO.orderNo}</p>
          </div>
          <div style="width: 30%;display:flex; padding:18px;align-items: center;">
            <p style="font-size:15px">주문일시: ${mOrderDTO.orderDate}</p>
          </div>
        </div>
        <div style="display:flex; justify-content: space-between ;margin-top:40px">
          <div>
            <h5 >주문상품</h5>
          </div>
        </div>
        <table class="table" style="border-bottom:1px solid #E5E5E5; margin-top:20px">
          <colgroup>
            <col width="43%"/>
            <col width="7%"/>
            <col width="20%"/>
            <col width="20%"/>
            <col width="10%"/>
          </colgroup>
          <thead style="background-color: #F5F5F5;">
            <tr style="text-align: center; height:47px; font-size:15px; ">
              <th scope="col">상품정보</th>
              <th scope="col">수량</th>
              <th scope="col">판매가</th>
              <th scope="col">실결제금액</th>
              <th scope="col">주문상태</th>
            </tr>
          </thead>
          <tbody>
            <tr style="height:150px;">
              <td style="vertical-align: middle; text-align:right">
                <div style="display: flex; justify-content:between">
                  <div>
                    <img src="http://newmedia.thehandsome.com/SH/2B/FW/SH2B9WJM343N_RD_W01.jpg" alt=""
								style="width: 98px; height: 98px;">
                  </div>
                  <div style="text-align:left; margin-left:20px;">
                    <a style="color:black;" href="#" >
                      ${productDTO.brand}</br>
                      ${productDTO.name}
                    </a>
                    <p style="margin-top: 20px;font-size:12px;color:#CCC7CD">color : <img src="${productDTO.colorChip}" style="width:24px; height:24px; margin-right:8px" >  / size : ${orderDetailDTO.psize}</p>
                  </div>
                </div>
              </td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p> ${orderDetailDTO.amount}</p></td>
              <td style="border-left: 1px solid #E5E5E5;vertical-align: middle; text-align:center"><p>₩${orderDetailDTO.price}</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>₩${orderDetailDTO.price}</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>${orderDetailDTO.state}</p></td>
            </tr>
          </tbody>
        </table>
        <div style="display:flex; justify-content: space-between ;margin-top:40px">
          <div>
            <h5 >결제정보</h5>
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
              <td style=" vertical-align: middle; text-align:right"><p>₩345,000</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right"><p>₩3,000</p></td>
              <td style="border-left: 1px solid #E5E5E5;vertical-align: middle; text-align:right"><p>₩48,000</p></td>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right"><p>₩300,000</p></td>
            </tr>
            <tr style="height:80px;">
              <td colspan='2' style="vertical-align: middle; text-align:right; "></td>
              <td style="border-left: 1px solid #E5E5E5;vertical-align: middle; text-align:right">
                <div style="display:flex; justify-content: space-between;"><p>쿠폰할인</p><p>- ₩ 0</p></div>
                <div style="display:flex; justify-content: space-between;"><p>플러스포인트쿠폰</p><p>- ₩ 0</p></div>
              <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right">
                <div style="display:flex; justify-content: space-between;"><p>신용카드</p><p>₩ 280,000</p></div>
                <div style="display:flex; justify-content: space-between;"><p>한섬마일리지</p><p>20,000 M</p></div>
                <div style="display:flex; justify-content: space-between;"><p>H.Point</p><p>0 P</p></div>
              </td>
            </tr>
          </tbody>
        </table>
        <div style="width:100%; clear:both; border-bottom: 1px solid #cccccc">
          <div style="display:flex; height: 33%; border-top:1px black solid;border-bottom: 1px solid #cccccc">
            <div style=" width:20%; background-color: #F5F5F5;padding-left:20px;padding-top:10px"><p style="font-weight:bold">주 결제수단</p></div>
            <div style=" width:80%;padding:10px;">
              <p>KB 국민카드 (9429-****-****-****)</p>
            </div>
          </div>
          <div style="display:flex; height: 33%; width:100%; border-bottom: 1px solid #cccccc">
            <div style=" width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">실 결제금액</p></div>
            <div style=" width:80%; display:flex; padding:10px">
              <p>₩ 280,000</p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;">
            <div style=" width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">할부 개월 수</p></div>
            <div style=" width:80%; display:flex; padding:10px">
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
              <p>${mOrderDTO.addr} ${mOrderDTO.detailAddr}</p>
            </div>
          </div>
          <div style="display:flex; height: 33%; width:100%; border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">수령인</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p>${mOrderDTO.recName}</p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">휴대폰</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p>${mOrderDTO.phone}</p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">연락처</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p>${mOrderDTO.tel}</p>
            </div>
          </div>
          <div style="display:flex; height:33%; width:100%;border-bottom: 1px solid #cccccc">
            <div style="width:20%; background-color: #F5F5F5 ;padding-left:20px;padding-top:10px"><p style="font-weight:bold">배송시 요청사항</p></div>
            <div style="width:80%; display:flex; padding:10px">
              <p>${mOrderDTO.request}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
