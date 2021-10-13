<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderList.css" />

<div class="mt-5">
	<div style="width: 990px; margin: 0px auto;">
	  <div style="display:flex; justify-content:center; width:100%">
			<h4>주문/배송/반품/취소</h4>
	  </div>
  </div>
</div>


<div class="mt-5">
	<div style="width: 990px; margin: 0px auto; background-color: #f5f5f5;">
		<div>
			<div style="display:flex; justify-content:between; width:100%">
				<div class="search-order-input">
					<div class="date-search-order ">
						<span class="txt" style="padding-right: 10px"> 조회기간</span> 
						<input type="date" id="startDate" name="findStartDate"/> - 
						<input type="date" id="endDate" name="findEndDate"/>
						<button type="button" class="btn btn-sm btn-outline-secondary btn-search" onclick="oneWeekBtn()">1주일</button>
						<button type="button" class="btn btn-sm btn-outline-secondary btn-search" onclick="oneMonthBtn()">1개월</button>
						<button type="button" class="btn btn-sm btn-outline-secondary btn-search" onclick="threeMonthBtn()">3개월</button>
					</div>
					<div class="content-search-order">
						<span class="txt" style="padding-right: 10px"> 검색구분 </span> 
						<select name="searchType" id="searchType">
							<option value="0" selected>상품명</option>
							<option value="1">주문번호</option>
						</select> 
						<input type="text" id="searchTerm" name="searchTerm" style="width:418px"/>
					</div>
				</div>
				<div class="search-order-input2" style="padding-top:17px; padding-left:10px;">
					<button type="button" class="btn btn-md btn-dark mt-3" style="width:100px; height:70px;" onclick="searchBtn()">조회하기</button>
					<button type="reset" class="btn btn-md btn-outline-dark mt-3" style="width:100px; height:70px;">초기화</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="orderContent">
	<div class="mt-5" >
	<div style="width:990px; margin: 0px auto;">
		<div style="display:flex; justify-content: space-between ;margin-top:40px">
		  <div>
		    <h5 style="font-weight:700">주문상품</h5>
		  </div>
		</div>
	    <div>
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
			      <th scope="col">금액</th>
			      <th scope="col">주문상태</th>
			      <th scope="col">구분</th>
			    </tr>
			  </thead>
		  	  <c:forEach items="${orderList}" var="order">
			   	<tbody class="txt">
			   		 <c:forEach items="${order.detailList}" var="orderDetail" varStatus="status">
				  	  <tr style="height:150px;">
				  	  	  <c:if test="${status.index==0}">
						      <td style="vertical-align:middle" rowspan="${fn:length(order.detailList)+1}">
						      	<p>${order.orderNo}</p>
						      	<fmt:formatDate var="orderDate" value="${order.orderDate}" pattern="yyyy-MM-dd kk:mm:ss"/>
						      	<p style="color:#dee2e6">${orderDate}</p>
						      	<a href="${pageContext.request.contextPath}/order/orderDetail?orderNo=${order.orderNo}" style="color: #ecd795">상세보기</a>
						      </td>
					      </c:if>
					      <td style="vertical-align:middle; border-top:none;">
					        <div style="display: flex; justify-content:between">
					          <div>
					            <img src="${orderDetail.img1}" style="width:98px; height:98px;">
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
					      <td style="vertical-align:middle"><p>${orderDetail.amount}</p></td>
					      <td style="vertical-align:middle">
					      	<c:if test="${orderDetail.state!=6}">
				      			<p>₩<fmt:formatNumber pattern="#,###" value="${orderDetail.price+orderDetail.discount}"/></p>
					      	</c:if>
					      	<c:if test="${orderDetail.state==6}">
					      		<p>₩0</p>
					      	</c:if>
					      </td>
					      <td style="vertical-align:middle">
					      	<p>
					      		<c:if test="${orderDetail.state == 1}">입금대기중</c:if>
					      		<c:if test="${orderDetail.state == 2}">주문완료</c:if>
					      		<c:if test="${orderDetail.state == 3}">배송준비중</c:if>
					      		<c:if test="${orderDetail.state == 4}">배송중</c:if>
					      		<c:if test="${orderDetail.state == 5}">배송완료</c:if>
					      		<c:if test="${orderDetail.state == 6}">주문취소</c:if>
					      	</p>
			      		</td>
					      <td style="vertical-align:middle">
					      	<p>
					      		<c:if test="${orderDetail.state == 1}">
									<a href="javascript:cancelOrderAjax(
									{'orderDetailNo':'${orderDetail.orderDetailNo}',
									'productDetailNo':'${orderDetail.productDetailNo}',
									'psize':'${orderDetail.psize}',
									'amount':${orderDetail.amount},
									'price':${orderDetail.price}
									})" class="btn btn-sm btn-outline-secondary btn-search">주문취소</a>					      		
					      		</c:if>
					      	</p>
			      		</td>
				      </tr>
				  </c:forEach>
				  <tr style="height:50px;">
				  	<td colspan="5" class="order-info" style="border:none; text-align: right; border-right: 1px solid #E5E5E5;">
				  		총 결제 금액 : ₩<fmt:formatNumber pattern="#,###" value="${order.totalOrderPrice}"/>
				  	</td>
			  	  </tr>
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
			      <a class="page-link" href="orderList?pageno=1" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    <c:if test="${pager.groupNo!=1}">
				  <li class="page-item">
			        <a class="page-link" href="orderList?pageno=${pager.startPageNo-1}" aria-label="Next">
			          <span aria-hidden="true">&lt;</span>
			         </a>
			      </li>
				</c:if>
				
			   <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				 <c:if test="${pager.pageNo !=i}">
				   <li class="page-item">
				     <a class="page-link" href="orderList?pageno=${i}">${i}</a>
				   </li>
				 </c:if>
				 <c:if test="${pager.pageNo ==i}">
				   <li class="page-item active">
				     <a class="page-link " href="orderList?pageno=${i}">${i}</a>
				   </li>
				  </c:if>
				</c:forEach>
				
				<c:if test="${pager.groupNo!=pager.totalGroupNo}">
				  <li class="page-item">
			        <a class="page-link" href="orderList?pageno=${pager.endPageNo+1}" aria-label="Next">
			          <span aria-hidden="true">&gt;</span>
			         </a>
			      </li>
				</c:if>
			    <li class="page-item">
			      <a class="page-link" href="orderList?pageno=${pager.totalPageNo}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			       </a>
			    </li>
	   	      </ul>
		    </nav>
	  	</c:if>
	  </div>
    </div>
  </div>
</div>



<script>
	function oneWeekBtn(){
		var endDate = new Date();
		document.getElementById("endDate").valueAsDate = endDate;
		var now = new Date();
		var startDate = new Date(now.setDate(now.getDate()-7));
		document.getElementById("startDate").valueAsDate = startDate;
	}
	
	function oneMonthBtn(){
		var endDate = new Date();
		document.getElementById("endDate").valueAsDate = endDate;
		var now = new Date();
		var startDate = new Date(now.setMonth(now.getMonth()-1));
		document.getElementById("startDate").valueAsDate = startDate;
	}
	
	function threeMonthBtn(){
		var endDate = new Date();
		document.getElementById("endDate").valueAsDate = endDate;
		var now = new Date();
		var startDate =  new Date(now.setMonth(now.getMonth()-3));
		document.getElementById("startDate").valueAsDate = startDate;
	}
	
	function searchBtn(){
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var searchType = $("#searchType  option:selected").val();
		var searchTerm = $("#searchTerm").val();
		if(startDate && !endDate){
			alert("날짜를 올바르게 입력하세요.");
		} else if(endDate && !startDate){
			alert("날짜를 올바르게 입력하세요.");
		}else{
			sessionStorage.setItem("startDate", startDate);
			sessionStorage.setItem("endDate", endDate);
			console.log("searchType "+ searchType);
			sessionStorage.setItem("searchType", searchType);
			sessionStorage.setItem("searchTerm", searchTerm);
			$.ajax({
				url: "orderListAjax",
				data: {
					pageno : 1,
					pageno : 1,
					startDate,
					endDate,
					searchType,
					searchTerm
				}
			}).done(data=>{
				$("#orderContent").html(data);
			});
		}
	}
	
	function pageBtn(pageno){
		var startDate = sessionStorage.getItem("startDate");
		var endDate = sessionStorage.getItem("endDate");
		var searchType = sessionStorage.getItem("searchType");
		var searchTerm = sessionStorage.getItem("searchTerm");
		if(startDate && !endDate){
			alert("날짜를 올바르게 입력하세요.");
		} else if(endDate && !startDate){
			alert("날짜를 올바르게 입력하세요.");
		}else{
			$.ajax({
				url: "orderListAjax",
				data: {pageno, startDate, endDate, searchType, searchTerm}
			}).done(data=>{
				$("#orderContent").html(data);
			});
		}
	}
	
	
	function cancelOrderAjax(data){
		console.log(data);
		
		
		
		$.ajax({
			type:"POST",
			url:"cancelOrderAjax",
			data: data
		}).done((data)=>{
			alert(data.message);
			location.href = window.location.href;
			
		})
		
		
	}
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%> 