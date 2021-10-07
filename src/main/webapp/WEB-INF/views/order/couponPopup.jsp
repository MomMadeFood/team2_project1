<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/couponPopup.css" />

<script>
	function applyCoupon(){
		var chkIdx = $('input:radio[name=chk_coupon]:checked').val();
		var totalDiscountPrice = $("#totalDiscountPrice"+chkIdx).val();
		var couponNo = $("#couponNo"+chkIdx).val();
		
		window.opener.responseDiscountInfo(totalDiscountPrice,couponNo);
		window.close();
	}
</script>

<div>
		<table id="orderTable" class="table .txt" style="border-bottom: 1px solid #E5E5E5;">
		<colgroup>
			<col width="30%" />
			<col width="20%" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead style="background-color: #F5F5F5;">
			<tr style="text-align: center; height: 47px; font-size: 15px;">
				<th scope="col">쿠폰명</th>
				<th scope="col">적용 가능 수량</th>
				<th scope="col">할인</th>
				<th scope="col">할인금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="coupon" items="${couponList}" varStatus="status">
      			<tr style="text-align: center; height: 132px;">
					<td class="detail-id" style="border-left: 1px solid #E5E5E5; border-right: 1px solid #E5E5E5">
						<input type="radio" name="chk_coupon" value="${status.count}"/>　${coupon.title}
					</td>
					<td class="d-flex">1개</td>
					<td class="detail-amount" style="border-left: 1px solid #E5E5E5; border-right: 1px solid #E5E5E5; vertical-align: middle;">
						<c:if test="${coupon.discountType eq '1'}" >
							${coupon.discount}%
						</c:if>
						<c:if test="${coupon.discountType eq '2'}" >
							₩${coupon.discount}0000
						</c:if>
					</td>
					<td style="vertical-align: middle; border-right: 1px solid #E5E5E5">
						₩<fmt:formatNumber value="${coupon.totalDiscountPrice}" pattern="#,###"/>
					</td>
					<input type="hidden" value="${coupon.totalDiscountPrice}" id="totalDiscountPrice${status.count}"/>
					<input type="hidden" value="${coupon.couponNo}" id="couponNo${status.count}"/>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button class="cp_lg_btn_white" onclick="javascript:window.close()">취소</button>
	<button class="cp_lg_btn_black" onclick="javascript:applyCoupon()">쿠폰선택</button>
</div>