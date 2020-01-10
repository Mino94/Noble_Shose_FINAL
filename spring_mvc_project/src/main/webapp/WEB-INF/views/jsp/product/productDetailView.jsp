<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 상세조회</title>
		<script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
		<script type="text/javascript">
			var qty=1;
			
			function qtyChange(num){
				qty=qty+num;
				if(qty<1) qty=1;
				calAmount();
			}
			function calAmount(){
				var cartQty = document.getElementById('cartQty');
				var amount = document.getElementById('amount');
				
				var total = qty * ${prd.prdPrice};
				
				cartQty.value = qty;
				amount.innerHTML = total.toLocaleString();
			}
		</script>
	</head>
	<body>
		<div id="wrap">
		<!-- TOP -->
		 <jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" />     
		<section>
		<h3>Product List</h3>
		<form method="post" action="<c:url value="/product/insertCart"/>">
			<table  width="800">
				<tr><td rowspan="9">
					<img src="<c:url value='/image/product/${prd.prdImg }'/>" width="300" height="250"></td>
				<tr><td>상품번호</td>
					<td><input type="hidden" name="prdNo" value="${prd.prdNo }">${prd.prdNo }</td></tr>
				<tr><td>상품명</td><td>${prd.prdName }</td></tr>
				<tr><td>가격</td><td><fmt:formatNumber value="${prd.prdPrice }" pattern="#,###"/>원</td></tr>
				<tr><td>제조회사</td><td>${prd.prdCompany }</td></tr>
				<tr><td>상품설명</td><td>${prd.prdDescript }</td></tr>
				<tr><td>주문수량</td>
					<td><input type="button" value="-" onclick="qtyChange(-1)">
					<input type="text" id="cartQty" name="cartQty" value="1" size="1" readonly>
					<input type="button" value="+" onclick="qtyChange(1)">
					</td></tr>
				<tr><td>구매예정금액</td>
					<td><span id="amount">
						<fmt:formatNumber value="${prd.prdPrice }" pattern="#,###"/>
					</span>원</td></tr>
				<tr><td colspan="2">
					<c:if test="${not empty sessionScope.sid }">
						<input type="submit" id="insertCart" value="장바구니">
						<input type="button" id="insertOrder" value="주문하기">
					</c:if>
					</td></tr>
			</table><br><br><br>
			
		</form>
		<c:if test="${empty sessionScope.sid }">
			<a href="<c:url value="/login"/>"><button>로그인</button></a>
		</c:if>
		
		
		<a href="<c:url value="/product/productListCtgView/${prd.ctgId }"/>"><button>상품 목록</button></a>
		</section>
		
		</div>
		<!-- Bootom -->
		 <jsp:include page="/WEB-INF/views/jsp/bottom.jsp" flush="true" />     
	</body>
</html>