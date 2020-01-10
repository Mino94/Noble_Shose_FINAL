<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TOP</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">     
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">  
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/menu.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/slideShow.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/tabMenu.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/product.css'/>">   
        <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
   		<link rel="stylesheet" href="<c:url value='/css/custom.css'/>"> 
   		<link rel="stylesheet" href="<c:url value='/css/all.css'/>">
		<link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
 		<link rel="stylesheet" href="<c:url value='/css/owl.theme.default.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/css/aos.css'/>">
		<link rel="stylesheet" href="<c:url value='/css/Style.css'/>">      
        <script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>   
        <script src="<c:url value='/js/subMenu.js'/>"></script>  
        <script src="<c:url value='/js/index.js'/>"></script>
        <script src="<c:url value='/js/slideShow.js'/>"></script>
        <script src="<c:url value='/js/tabMenu.js'/>"></script>
	</head>
	<body>
		<nav class="nav">
        <div class="nav-menu flex-row">
            <div class="nav-brand">
                <a href="<c:url value="/"/>" class="text-gray">Team Noble</a>
            </div>
            <div class="toggle-collapse">
                <div class="toggle-icons">
                    <i class="fas fa-bars"></i>
                </div>
            </div>
            
            <div>
                <ul class="nav-items">
                    <li class="nav-link"><a href="<c:url value='/product/productListCtgView/${1 }'/>">MAN</a></li>
                    <li class="nav-link"><a href="<c:url value='/product/productListCtgView/${2 }'/>">WOMAN</a></li>
                    <li class="nav-link"><a href="<c:url value='/product/productListCtgView/${3 }'/>">KIDS</a></li>
                    <li class="nav-link"><a href="<c:url value='/product/productListCtgView/${4 }'/>">OUTER</a></li>
                </ul>
            </div>
            
            <div class="social text-gray text-right">            	
            		<c:if test="${empty sessionScope.sid }">
            			<a href="<c:url value="/login"/>">Login</a>
            			<a href="<c:url value="/member/join"/>">Join</a>
            		</c:if>
            		<c:if test="${not empty sessionScope.sid }">
            			${sessionScope.sid} 님 환영합니다! 
            			<a href="<c:url value="/login/logout"/>">Logout</a>
            			<a href="<c:url value="/product/cartList"/>">Cart Item</a>
            		</c:if>            	    		
            </div>
        </div>
    </nav>   
	 <script src="<c:url value='/js/Jquery3.4.1.min.js'/>"></script>
    <script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
    <script src="<c:url value='/js/aos.js'/>"></script>
    <script src="<c:url value='/js/main.js'/>"></script>
	</body>
</html>

