<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 폼</title>			
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/join.css'/>"> 	
		<script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>		
		      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script type="text/javascript">
         function searchZipcode(){
            new daum.Postcode({
               oncomplete:function(data){
                  var address1='';
                  var dong_building='';
                  
                  if(data.userSelectedType=='R'){
                     address1=data.roadAddress+"("+data.bname+","+data.buildingName+")";
                  }else{
                     address1=data.jibunAddress;
                  }
                  document.getElementById('memZipcode').value=data.zonecode;
                  document.getElementById('memAddress1').value=address1;
                  
                  var address2 = document.getElementById('memAddress2');
                  address2.value='';
                  address2.focus();
               }
            }).open();
         }
      </script>
	</head>
	<body>
	<div id="wrap">
		<!--  TOP  -->
		<jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" /> 
		
		<!--  회원 가입 폼  -->
		<section>
	        <h1 id="title">Sign Up</h1>
	        <form id="joinForm" name="joinForm" method="post"  action="/project/member/insertjoin"><!-- action="join.do" -->
	          <table>
	            <tr><th> 성명</th><td><input type="text" id="memName" name="memName" ></td></tr>
	            <tr><th> ID</th><td><input type="text" id="memId" name="memId" > 
	            		<input type="button" id="idCheck()" onclick = "idCheck()" value="ID 중복 체크"></td></tr>
	            <tr><th>비밀번호</th><td><input type="password" id="memPassword" name="memPassword"></td></tr>
	            <tr><th>휴대폰 번호</th><td><input type="text" id="memHp" name="memHp" size="13"></td></tr>
	          
	             <tr><th>배송지 주소</th>
                     <td colspan="3">
                        <input type="text" id="memZipcode" name="memZipcode" size="5">
                        <input type="button" name="searchZip" value="우편번호찾기" readonly onclick="searchZipcode()"><br>
                        <input type="text" id="memAddress1" name="memAddress1" size="70"><br>
                        <input type="text" id="memAddress2" name="memAddress2" size="70" placeholder="상세 주소 입력">
                        </td></tr>
	             <tr>   
	                <td colspan="2" align="center" id="button">
	                    <br><input type="submit" value="완료">
	                    <input type="reset" value="취소">
	                </td>
	            </tr>             
	            </table>
	      </form>	
      </section>
      </div>
      <!--  BOTTOM  -->
		<jsp:include page="/WEB-INF/views/jsp/bottom.jsp" flush="true" />            
      
    </body>
</html>


