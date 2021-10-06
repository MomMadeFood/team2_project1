<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<div class="card-deck mb-3">
<div class="row d-flex" style="width: 990px; margin:0px auto;">
	<div style="width:100%">
		<c:forEach varStatus="status"  items="${boards}" var="product">
		 <div class="card" style="width:25%; float:left; margin:0px; padding: 10px 10px; border:none;">
		 <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
		     <img src="${product.img1}" class="d-block w-100 img-fluid card-img-top">
	     </a>
		     <div class="card-body container" style="height:200px; overflow:hidden; padding-left:0px; padding-right:0px;">
		       <h5 class="card-title">${product.brand}</h5>
		       <p class="card-text" >${product.name}</p>
		       <p class="card-text float-left" ><small class="text-muted">₩<fmt:formatNumber pattern="#,###" value="${product.price}"/></small></p>
		       <ul class="float-right">
		       		<c:forEach items="${productColorMap}"  var="map">
		       			<c:forEach items="${map.value}" var="colorChip">
		       				<c:if test="${product.productNo== map.key}">
						       <li style ="list-style:none" class="float-left">
		                      		<img src= "${colorChip}"  width="25px">
						       </li>
					       </c:if>
					       </c:forEach>
			       </c:forEach>
		       </ul>
		     </div>
		 </div>
	  </c:forEach>
	</div>
</div>
</div>

<!-- paging -->
<tr>
   	<td colspan="4" class="text-center">
   		<div>
   			<a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}productList?pageNo=1">처음</a>
   			<c:if test="${pager.groupNo>1}">
   				<a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath}productList?pageNo=${pager.startPageNo-1}">이전</a>
   			</c:if>
   			
   			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
   				<c:if test ="${pager.pageNo != i}">
   					<a class="btn btn-outline-success btn-sm" href="${pageContext.request.contextPath}productList?pageNo=${i}">${i}</a>
   				</c:if>
		    <c:if test ="${pager.pageNo == i}">
   					<a class="btn btn-danger btn-sm">${i}</a>
   				</c:if>
   			</c:forEach>
   			
   			<c:if test="${pager.groupNo<pager.totalGroupNo}">
   				<a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath}productList?pageNo=${pager.endPageNo+1}">다음</a>
   			</c:if>
   			<a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}productList?pageNo=${pager.totalPageNo}">맨끝</a>
   		</div>
   	</td>
   </tr>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>