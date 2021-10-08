<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


		<div  class=" navbar-expand-lg navbar-light bg-light" style="text-align: center;">
			<div style="width: 990px; display:inline-block;">
			  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			    <div class="navbar-nav d-flex flex-wrap">
			    	<c:forEach items="${subCategoryList}" var="category" >
			    	 <a class="nav-link inline-block" style="width:220px; text-align:left;" href="productList?categoryId=${category.categoryId}">${category.categoryName}</a>
			    	</c:forEach>
			    </div>
			  </div>
			</div>
		</div>


<div class="card-deck mb-3 txt">
	<div class="row d-flex" style="width: 990px; margin:0px auto;">
		
	
	
		<div style="width:100%">
			<c:forEach varStatus="status"  items="${productList}" var="product">
			 <div class="card" style="width:25%; float:left; margin:0px; padding: 10px 10px; border:none;">
			 <a href="${pageContext.request.contextPath}/product/productDetail?no=${product.productDetailNo}">
			     <img src="${product.img1}" class="d-block w-100 img-fluid card-img-top">
		     </a>
			     <div class="card-body container" style="height:200px; overflow:hidden; padding-left:0px; padding-right:0px;">
			       <h5 class="card-title" style="font-size: 15px; line-height: 22px; font-weight: 800;">${product.brand}</h5>
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
   <div class="mt-5">
   <div style="width: 990px; margin: 0px auto;">
     <div style="display:flex; justify-content:center; width:100%">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
        
          <li class="page-item">
            <a class="page-link" href="productList?categoryId=${categoryId}&pageNo=1" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          
          <c:if test="${pager.groupNo!=1}">
           <li class="page-item">
              <a class="page-link" href="productList?categoryId=${categoryId}&pageNo=${pager.startPageNo-1}" aria-label="Next">
                <span aria-hidden="true">&lt;</span>
               </a>
            </li>
         </c:if>
         
         <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
          <c:if test="${pager.pageNo !=i}">
            <li class="page-item">
              <a class="page-link" href="productList?categoryId=${categoryId}&pageNo=${i}">${i}</a>
            </li>
          </c:if>
          <c:if test="${pager.pageNo ==i}">
            <li class="page-item active">
              <a class="page-link " href="productList?categoryId=${categoryId}&pageNo=${i}">${i}</a>
            </li>
           </c:if>
         </c:forEach>
         
         <c:if test="${pager.groupNo!=pager.totalGroupNo}">
           <li class="page-item">
              <a class="page-link" href="productList?categoryId=${categoryId}&pageNo=${pager.endPageNo+1}" aria-label="Next">
                <span aria-hidden="true">&gt;</span>
               </a>
            </li>
         </c:if>
          <li class="page-item">
            <a class="page-link" href="productList?categoryId=${categoryId}&pageNo=${pager.totalPageNo}" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
             </a>
          </li>
            </ul>
       </nav>
     </div>
  </div>
</div>

<style>
.page-item.active .page-link {
    color: #fff;
    background-color: #8193a7;
    border-color: #8193a7;
}
</style>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>