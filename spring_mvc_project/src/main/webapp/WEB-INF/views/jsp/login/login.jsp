<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>   
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>"> 	  
		
	</head>
	<body>
		<div id="wrap">
			<!--  TOP  -->
			<jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" /> 
			
			<!--  로그인 폼  -->
			<section>
		        <h1 id="title">Sign In</h1>
		        <form method="post" id="loginForm" action="<c:url value="/login"/>">
		          <table>
		            <tr><th> ID</th><td><input type="text" id="username" name="username" ></td></tr>
		            <tr><th>비밀번호</th><td><input type="password" id="password" name="password"></td></tr>
		             <tr>
		                <td colspan="2" align="center" id="button">
		                    <br><input type="submit" value="로그인">
		                    <input type="reset" value="취소">
		                </td>
		            </tr>             
		            </table>
		        </form>	
	        </section>
	        
	        <!-- 로그인 실패 시 에러 메시지 출력 -->
		<c:if test="${not empty ERRORMSG}">
	        <font color="red">
	        	<p>${ERRORMSG }</p>
	        </font>
    	</c:if> 
    	   	
	      </div>
		    <!--  BOTTOM  -->
		         
			<%-- <jsp:include page="bottom.jsp" flush="true" />      --%>       
	      <jsp:include page="/WEB-INF/views/jsp/bottom.jsp" flush="true" />
	</body>
</html>


