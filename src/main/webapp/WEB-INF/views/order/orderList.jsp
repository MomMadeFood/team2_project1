<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderList.css" />

<div class="container-fluid">
	<div class="row mb-5">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 d-flex justify-content-center">
			<h4>주문/배송/반품/취소</h4>
		</div>
		<div class="col-sm-2"></div>
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
		console.log(endDate);
		if(startDate && !endDate){
			alert("날짜를 올바르게 입력하세요.");
		} else if(endDate && !startDate){
			alert("날짜를 올바르게 입력하세요.");
		}else{
			$.ajax({
				url: "orderListAjax",
				data: {startDate, endDate, searchType, searchTerm}
			}).done(data=>{
				console.log(data);
				var htmlContent ="";
				htmlContent += '<table class="table" style="border-bottom:1px solid #E5E5E5; margin-top:20px">';
				htmlContent += '  <colgroup>';
				htmlContent += '    <col width="13%"/>';
				htmlContent += '	<col width="39%"/>';
				htmlContent += '	<col width="9%"/>';
				htmlContent += '	<col width="13%"/>';
				htmlContent += '	<col width="13%"/>';
				htmlContent += '	<col width="13%"/>';
				htmlContent += '  </colgroup>';
				htmlContent += '  <thead style="background-color: #F5F5F5;">';
				htmlContent += '    <tr style="text-align: center; height:47px; font-size:15px; ">';
				htmlContent += '	  <th scope="col">주문번호</th>';
				htmlContent += '	  <th scope="col">상품정보</th>';
				htmlContent += '	  <th scope="col">수량</th>';
				htmlContent += '	  <th scope="col">판매가</th>';
				htmlContent += '	  <th scope="col">주문상태</th>';
				htmlContent += '	  <th scope="col">구분</th>';
				htmlContent += '	</tr>';
				htmlContent += '  </thead>';
				for(var order of data){
					htmlContent += '  	<tbody class="txt">';
						for(var i = 0 ; i < order['detailList'].length ; i++){
							htmlContent += '  	    <tr style="height:150px;">';
							if(i==0){
								htmlContent += '  		    <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center" rowspan="' + order['detailList'].length +'">';
								htmlContent += '  			  <p>' + order.orderNo+'</p>';
								
								var orderDate = new Date(order.orderDate)
								var month = orderDate.getMonth() + 1;
								var day = orderDate.getDate();
								if(day < 10){
									day ="0"+day;
								}
								var hour = orderDate.getHours();
								if(hour < 10){
									hour ="0"+hour;
								}
								var minute = orderDate.getMinutes();
								if(minute < 10){
									minute ="0"+minute;
								}
								var second = orderDate.getSeconds();
								if(second < 10){
									second ="0"+second;
								}
								var strDate = orderDate.getFullYear() + "-" +month + "-" + day + " " + hour + ":" + minute + ":" + second ;  
								
								htmlContent += '  			  <p style="color:#dee2e6">' + strDate+'</p>';
								htmlContent += '  			  <a href="${pageContext.request.contextPath}/order/orderDetail?orderNo="'+ order.orderNo +'style="color:#ecd795">상세보기</a>';
								htmlContent += '  		    </td>';
							}
							htmlContent += '  		  <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:right">';
							htmlContent += '  		    <div style="display: flex; justify-content:between">';
							htmlContent += '  			  <div>';
							htmlContent += '  			    <img src="'+order['detailList'][i].img1+'" alt="" style="width: 98px; height: 98px;">';
							htmlContent += '  			  </div>';
							htmlContent += '  			  <div style="text-align:left; margin-left:20px;">';
							htmlContent += '  			    <a style="color:black;" href="${pageContext.request.contextPath}/product/productDetail" >';
							htmlContent += 					  order['detailList'][i].brand+'<br/>';
							htmlContent +=                    order['detailList'][i].name;
							htmlContent += '  			     </a>';
							htmlContent += '  			     <p style="margin-top: 10px;font-size:12px;color:#CCC7CD">color :  <img src="'+order['detailList'][i].colorChip+'" alt="" width="20px" height="20px"> / size : '+order['detailList'][i].psize+'</p>';
							htmlContent += '  			   </div>';
							htmlContent += '  			 </div>';
							htmlContent += '  		   </td>';
							htmlContent += '  		   <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>'+order['detailList'][i].amount+'</p></td>';
							htmlContent += '  		   <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>₩'+order['detailList'][i].price.toLocaleString()+'</p></td>';
							htmlContent += '  		   <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p>'+order['detailList'][i].state+'</p></td>';
							htmlContent += '  		   <td style="border-left: 1px solid #E5E5E5; vertical-align: middle; text-align:center"><p></p></td>';
							htmlContent += '  		 </tr>';
						}
					htmlContent += '  	 </tbody>';
				}
				htmlContent += '</table> ';
				$("#orderContent").html(htmlContent);
			});
		}
	}
</script>

<div class="mt-5">
	<div style="width: 990px; margin: 0px auto; background-color: #f5f5f5;">
		<form>
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
		</form>
	</div>
</div>

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
						      	<fmt:formatDate var="orderDate" value="${order.orderDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
						      	<p style="color:#dee2e6">${orderDate}</p>
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
					              ${orderDetail.brand}<br/>
					              ${orderDetail.name}
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
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%> 