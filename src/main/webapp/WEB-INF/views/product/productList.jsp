<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<div class="card-deck mb-3">
<div class="row d-flex" style="width: 990px; margin:0px auto;">
	<div style="width:100%">
		<c:forEach varStatus="status"  items="${productList}" var="product">
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


<%@ include file="/WEB-INF/views/common/footer.jsp" %>