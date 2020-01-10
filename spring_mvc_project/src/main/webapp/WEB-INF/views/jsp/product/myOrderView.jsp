<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>OrderList</title>
	
	
	<style>
	
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
	
		/* ---------- */
		
		header#header {}
		nav#nav {}
		section#container { }
	
		section#content ul li { display:inline-block; margin:10px; }
		section#content .orderList{ 
			margin:10px;
			 }	
			section#container::after { content:""; display:block; clear:both; }	
	
	</style>
	
	
<style>
/*
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px 0; text-align:center; }
	section#content div.goodsName a { color:#000; }
*/
	section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
	
</head>
<body>
<div id="root">
    <jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" />
   
	<div id="wrap">
	<section id="container">
		<div id="container_box">
		
			<section id="content">
            	
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
					<li>
					<div>
						<p><span>OrderNumber</span><a href="/product/myOrderView?n=${orderList.ordNo}">${orderList.ordNo}</a></p>
						<p><span>Recipient</span>${orderList.ordReceiver}</p>
						<p><span>Address</span>( ${orderList.ordRcvZipcode})${orderList.ordRcvAddress1} ${orderList.ordRcvAddress2}</p>
						<%-- <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.ordPay}" /> 원</p> --%>
						<p><span>State</span>${orderList.ordRcvMsg}</p>
					</div>
					</li>
					<hr>
					</c:forEach>
				</ul>
			
			</section>

		</div>
	</section>
	</div>
	 <jsp:include page="/WEB-INF/views/jsp/bottom.jsp" flush="true" />     
</div>
</body>
</html>
