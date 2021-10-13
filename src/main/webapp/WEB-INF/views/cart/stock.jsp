<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
alert("선택 상품 중 재고 부족 상품이 있습니다");
location.href="${pageContext.request.contextPath}/cart";
</script>