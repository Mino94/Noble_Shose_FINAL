<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style>
         hr{width: 900px; margin: 10px}
         table{text-align: left;}
         th{width: 100px; background: #777777; color: white; text-align: center;}
         td{padding-left: 5px;}
         #cartTable{text-align: center;}
      </style>
      
      <script src="<c:url value='/js/jquery-3.4.1.min.js'/>"></script>
      <script src="<c:url value='/js/subMenu.js'/>"></script>
      <script src="<c:url value='/js/index.js'/>"></script>
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
                  document.getElementById('ordRcvZipcode').value=data.zonecode;
                  document.getElementById('ordRcvAddress1').value=address1;
                  
                  var address2 = document.getElementById('ordRcvAddress2');
                  address2.value='';
                  address2.focus();
               }
            }).open();
         }
      </script>
   </head>
   <body>
    <jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" />     
      <div id="wrap">

         <section>
            <br>
            <form method="post" action="<c:url value='/product/orderComplete'/>">
               <h3>Customer Information</h3>
               <table border="1" width="700px">
                  <tr><th>주문자</th><td width="200">${memDto.memName}
                                <input type="hidden" name="memId" value="${memDto.memId}"></td>
                  <tr><th>연락처</th>
                        <td>${hp1} - ${hp2} - ${hp3}</td></tr>
               </table>
               <br>
               <h3>Recipient Information</h3>
               <table border="1" width="700">
                  <tr><th>받는분</th><td width="200"><input type="text" name="ordReceiver" value="${memDto.memName}"></td>
                  <th>연락처</th>
                     <td><input type="text" name="hp1" size="3" value="${hp1}">-
                        <input type="text" name="hp2" size="4" value="${hp2}">-
                        <input type="text" name="hp3" size="4" value="${hp2}"></td></tr>
                  <tr><th>배송지 주소</th>
                     <td colspan="3">
                        <input type="text" id="ordRcvZipcode" name="ordRcvZipcode" size="5" value="${memDto.memZipcode}">
                        <input type="button" name="searchZip" value="우편번호찾기" readonly onclick="searchZipcode()"><br>
                        <input type="text" id="ordRcvAddress1" name="ordRcvAddress1" size="70"
                                 value="${memDto.memAddress1}" readonly><br>
                        <input type="text" id="ordRcvAddress2" name="ordRcvAddress2" size="70"
                                 value="${memDto.memAddress2}" placeholder="상세 주소 입력">
                        </td></tr>
                  <tr><th>배송메세지</th>
                     <td colspan="3"><select name="ordRcvMsg">
                        <option value="배송전 전화주세요">배송전 전화주세요</option>
                        <option value="부재중 전화주세요">부재중 전화주세요</option>
                        <option value="부재중 문앞에 놓고 가세요">부재종 문앞에 놓고 가세요</option>
                     </select></td></tr>
               </table><br>
               <h3>Order Product List</h3>
               <table id="cartTable" border="1" width="700">
                  <tr><th>상품번호</th><th>사진</th><th>상품명</th><th>가격</th>
                     <th>주문수량</th><th>구매예정금액</th></tr>
                  <c:forEach items="${cartList}" var="ct">
                     <tr>
                        <td>${ct.prdNo}</td>
                        <td><img src="<c:url value='/image/product/${ct.prdImg }'/>" width="200px" heigth="180px"></td>
                        <td>${ct.prdName}</td>
                        <td align="right"><fmt:formatNumber value="${ct.prdPrice}" pattern="#,###"/>원</td>
                        <td>
                           <input type="text" name="cartQty" value="${ct.cartQty}" size="1">
                           <input type="hidden" name="cartNo" value="${ct.cartNo}">
                           <input type="hidden" name="prdNo" value="${ct.prdNo}">
                           <input type="hidden" name="prdPrice" value="${ct.prdPrice}">
                        </td>
                        <td align="right"><span class="amount">
                           <c:set var="amount" value="${ct.prdPrice*ct.cartQty}"/>
                           <c:set var="sum" value="${sum+amount}"/>
                           <fmt:formatNumber value="${amount}" pattern="#,###"/>
                        </span> 원</td>
                     </tr> 
                  </c:forEach>
                  <tr><td colspan="5">총구매예정금액</td>
                     <td align="right"><fmt:formatNumber value="${sum}" pattern="#,###"/> 원<br></td></tr>
               </table><br>
               <h3>Payment Information</h3>
               <table border="1" width="700">
                  <tr><th>결제방법</th>
                     <td><input type="radio" name="ordPay" value="card" checked>신용카드
                        <input type="radio" name="ordPay" value="bank">실시간계좌이체</td></tr>
               </table><br>
               
               <input type="submit" value="결제완료">
            </form>
         </section>
         </div>
      
       <jsp:include page="/WEB-INF/views/jsp/bottom.jsp" flush="true" />     
       
   </body>
</html>