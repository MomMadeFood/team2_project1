<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<c:forEach begin="1"  end = "4" step="1" var="i">
<div class="card-deck mb-3">
<div class="row" style="margin-top: 20px; width: 990px; margin:0px auto;">
  <div class="card" style="width:25%;">
    <img src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/684x1032/" class="d-block w-100 img-fluid card-img-top">
    <div class="card-body">
      <h5 class="card-title">제품${i}</h5>
      <p class="card-text">제품 설명${i}</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card" style="width:25%;">
    <img src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/684x1032/" class="d-block w-100 img-fluid card-img-top">
    <div class="card-body">
      <h5 class="card-title">제품${i}</h5>
      <p class="card-text">제품 설명${i}</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card" style="width:25%;">
    <img src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/684x1032/" class="d-block w-100 img-fluid card-img-top">
    <div class="card-body">
      <h5 class="card-title">제품${i}</h5>
      <p class="card-text">제품 설명${i}</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
    <div class="card" style="width:25%;">
    <img src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/684x1032/" class="d-block w-100 img-fluid card-img-top">
    <div class="card-body">
      <h5 class="card-title">제품${i}</h5>
      <p class="card-text">제품 설명${i}</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
</div>
</div>
</c:forEach>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>