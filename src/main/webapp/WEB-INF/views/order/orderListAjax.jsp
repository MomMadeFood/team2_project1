<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mt-5" >
	<div style="width:990px; margin: 0px auto;">
		<div style="display:flex; justify-content: space-between ;margin-top:40px">
		  <div>
		    <h5 style="font-weight:700">주문상품</h5>
		  </div>
		</div>
	    <div id="orderContent">
		  	<table class="table" style="border-bottom:1px solid #E5E5E5; margin-top:20px">
			  <colgroup>
			    <col width="15%"/>
			    <col width="42%"/>
			    <col width="7%"/>
			    <col width="12%"/>
			    <col width="12%"/>
			    <col width="12%"/>
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
						      	<fmt:formatDate var="orderDate" value="${order.orderDate}" pattern="yyyy-MM-dd kk:mm:ss"/>
						      	<p style="color:#dee2e6">${orderDate}</p>
						      	<a href="${pageContext.request.contextPath}/order/orderDetail?orderNo=${order.orderNo}" style="color: #ecd795">상세보기</a>
						      </td>
					      </c:if>
					      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right">
					        <div style="display: flex; justify-content:between">
					          <div>
					            <img src="${orderDetail.img1}" alt="" style="width: 98px; height: 98px;">
					          </div>
					          <div style="text-align:left; margin-left:20px;">
					            <a style="color:black;" href="${pageContext.request.contextPath}/product/productDetail?no=${orderDetail.productDetailNo}" >
					              ${orderDetail.brand}<br/>
					              ${orderDetail.name}
					            </a>
					            <p style="margin-top: 10px;font-size:12px;color:#CCC7CD">color :  <img src="${orderDetail.colorChip}" alt="" width="20px" height="20px"> / size : ${orderDetail.psize}</p>
					          </div>
					        </div>
					      </td>
					      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>${orderDetail.amount}</p></td>
					      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>₩<fmt:formatNumber pattern="#,###" value="${orderDetail.price}"/></p></td>
					      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center">
					      	<p>
					      		<c:if test="${orderDetail.state == 1}">입금대기중</c:if>
					      		<c:if test="${orderDetail.state == 2}">주문완료</c:if>
					      		<c:if test="${orderDetail.state == 3}">배송준비중</c:if>
					      		<c:if test="${orderDetail.state == 4}">배송중</c:if>
					      		<c:if test="${orderDetail.state == 5}">배송완료</c:if>
					      		<c:if test="${orderDetail.state == 6}">주문취소</c:if>
					      	</p>
			      		</td>
					      <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center">
					      	<p>
					      		<c:if test="${orderDetail.state == 1}">
									<button class="btn btn-sm btn-outline-secondary btn-search">주문취소</button>					      		
					      		</c:if>
					      	</p>
			      		</td>
				      </tr>
				  </c:forEach>
			    </tbody>
			  </c:forEach>
			</table>
		</div>
	</div>
</div>

<div class="mt-5">
	<div style="width: 990px; margin: 0px auto;">
	  <div style="display:flex; justify-content:center; width:100%">
	  	<c:if test="${pager.totalRows != 0}">
		    <nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-link" href="javascript:pageBtn(1)" aria-label="frist">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:if test="${pager.groupNo!=1}">
				  <li class="page-item">
			        <a class="page-link" href="javascript:pageBtn(${pager.startPageNo-1})" aria-label="previous">
			          <span aria-hidden="true">&lt;</span>
			         </a>
			      </li>
				</c:if>
			   <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				 <c:if test="${pager.pageNo!=i}">
				   <li class="page-item">
				     <a class="page-link" href="javascript:pageBtn(${i})">${i}</a>
				   </li>
				 </c:if>
				 <c:if test="${pager.pageNo==i}">
				   <li class="page-item active">
				     <a class="page-link " href="javascript:pageBtn(${i})">${i}</a>
				   </li>
				  </c:if>
				</c:forEach>
				<c:if test="${pager.groupNo!=pager.totalGroupNo}">
				  <li class="page-item">
			        <a class="page-link" href="javascript:pageBtn(${pager.endPageNo+1})" aria-label="next">
			          <span aria-hidden="true">&gt;</span>
			         </a>
			      </li>
				</c:if>
			    <li class="page-item">
			      <a class="page-link" href="javascript:pageBtn(${pager.totalPageNo})" aria-label="end">
			        <span aria-hidden="true">&raquo;</span>
			       </a>
			    </li>
	   	      </ul>
		    </nav>
	    </c:if>
	  </div>
  </div>
</div>
