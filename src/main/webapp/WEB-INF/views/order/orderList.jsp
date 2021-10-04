<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container-fluid">
	<div class="row mb-5">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 d-flex justify-content-center">
			<h4>주문/배송/반품/취소</h4>
		</div>
		<div class="col-sm-2"></div>
	</div>

</div>

<div class="mt-5">
	<div style="width: 990px; margin: 0px auto; background-color: #f5f5f5;">
		<div style="display:flex; justify-content:between; width:100%">
			<div class="search-order-input">
				<div class="date-search-order ">
					<span class="txt" style="padding-right: 10px">＊ 조회기간</span> <input
						type="date" id="findStartDate" name="findStartDate" style="width:130"/> - <input
						type="date" id="findEndDate" name="findEndDate"/>
					<button type="button"
						class="btn btn-sm btn-outline-secondary btn-search">1주일</button>
					<button type="button"
						class="btn btn-sm btn-outline-secondary btn-search">1개월</button>
					<button type="button"
						class="btn btn-sm btn-outline-secondary btn-search">3개월</button>
				</div>
				<div class="content-search-order">
					<span class="txt" style="padding-right: 10px">＊ 검색구분 </span> <select name="searchType">
						<option value="0">상품명</option>
						<option value="1">주문번호</option>
					</select> <input type="text" id="searchContent" name="searchContent" style="width:418px"/>
				</div>
			</div>
			<div class="search-order-input2" style="padding-top:17px; padding-left:10px;">
				<button type="button" class="btn btn-md btn-dark btn-join mt-3" style="width:150px; height:70px;">조회하기</button>
			</div>
		</div>
	</div>
</div>

<div class="mt-5" >
	<div style="width:990px; margin: 0px auto;">
		<div style="display:flex; justify-content: space-between ;margin-top:40px">
		  <div>
		    <h5 style="font-weight:700">주문상품</h5>
		  </div>
		</div>
		<table class="table" style="border-bottom:1px solid #E5E5E5; margin-top:20px">
		  <colgroup>
		    <col width="13%"/>
		    <col width="39%"/>
		    <col width="9%"/>
		    <col width="13%"/>
		    <col width="13%"/>
		    <col width="13%"/>
		  </colgroup>
		  <thead style="background-color: #F5F5F5;">
		    <tr style="text-align: center; height:47px; font-size:15px; ">
    		  <th scope="col">주문번호</th>
		      <th scope="col">상품정보</th>
		      <th scope="col">수량</th>
		      <th scope="col">판매가</th>
		      <th scope="col">주문상태</th>
		      <th scope="col">구분</th>
		    </tr>
		  </thead>
	  	  <c:forEach items="${orderList}" var="order">
		   	<tbody class="txt">
		   		 <c:forEach items="${order.detailList}" var="orderDetail" varStatus="status">
			  	  <tr style="height:150px;">
			  	  	  <c:if test="${status.index==0}">
					      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center" rowspan="${fn:length(order.detailList)}">
					      	<p>${order.orderNo}</p>
					      	<p style="color:#dee2e6">(${order.orderDate})</p>
					      	<a href="${pageContext.request.contextPath}/order/orderDetail?orderNo=${order.orderNo}" style="color:#ecd795">상세보기</a>
					      </td>
				      </c:if>
				      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right">
				        <div style="display: flex; justify-content:between">
				          <div>
				            <img src="${orderDetail.img1}" alt="" style="width: 98px; height: 98px;">
				          </div>
				          <div style="text-align:left; margin-left:20px;">
				            <a style="color:black;" href="${pageContext.request.contextPath}/product/productDetail" >
				              SYSTEM HOMME<br/>
				              컬러 라인 니트 탑
				            </a>
				            <p style="margin-top: 10px;font-size:12px;color:#CCC7CD">color :  <img src="${orderDetail.colorChip}" alt="" width="20px" height="20px"> / size : ${orderDetail.psize}</p>
				          </div>
				        </div>
				      </td>
				      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>${orderDetail.amount}</p></td>
				      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>₩<fmt:formatNumber pattern="#,###" value="${orderDetail.price}"/></p></td>
				      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>${orderDetail.state}</p></td>
				      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p></p></td>
			      </tr>
			  </c:forEach>
		    </tbody>
		  </c:forEach>
		</table>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%> 