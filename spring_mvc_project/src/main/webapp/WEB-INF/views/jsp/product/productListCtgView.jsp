<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div id="wrap">
		<!-- TOP -->
		 <jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" />     
		<section>
		
		<table width="600">
		<h3 id="productList">Product List</h3>
			<tr><th>상품번호</th><th>사진</th><th>상품명</th><th>가격</th>
			<th>제조사</th><th>재고</th></tr>
		
			<c:forEach items="${prdList }" var="prd">
				<tr>
					<td><a href="<c:url value='/product/productDetailView/${prd.prdNo }'/>">${prd.prdNo }</a></td>
					<td><img src="<c:url value='/image/product/${prd.prdImg }'/>" width ="150px" height="100px"></td>
					<td>${prd.prdName }</td>
					<td>${prd.prdPrice }</td>
					<td>${prd.prdCompany }</td>
					<td>${prd.prdStock }</td>
				</tr>
			</c:forEach>
		</table><br>
		</section>
	 
		</div>  
		<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/jsp/bottom.jsp" flush="true" />
	</body>
</html>