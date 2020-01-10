<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>index 메인 페이지</title>
	</head>
    
	<body>
    	<div id="wrap">
    	<!-- Top -->
        	<jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" />
                    
            <main>
        <section class="site-title">
            <div class="site-background" data-aos="fade-up" data-aos-delay="100">
                <h3>Challenge & Lead</h3>
                <h1>The world goes on with shoes</h1>
                <a href="<c:url value="/login/logout"/>"><button class="btn">Would you like to join us?</button></a>
            </div>
        </section>

        <!------------x----------- Site Title ----------x----------->

        <!-- --------------------- Blog Carousel ----------------- -->

        <section>
            <div class="blog">
                <div class="container">
                    <div class="owl-carousel owl-theme blog-post">
                        <div class="blog-content" data-aos="fade-right" data-aos-delay="200">
                            <img src="<c:url value='/image/Blog-post/image001.jpg'/>" alt="post-1">
                            <div class="blog-title">
                                <h3>Lightweight Jumpman Classics</h3>
                                <a href="<c:url value='/product/productListCtgView/${1 }'/>">
                                <button class="btn btn-blog">$100</button>
                                </a>
                                <span>5 Colors</span>
                            </div>
                        </div>
                        <div class="blog-content" data-aos="fade-in" data-aos-delay="200">
                            <img src="<c:url value='/image/Blog-post/image006.jpg'/>" alt="post-1">
                            <div class="blog-title">
                                <h3>HIIT Class Zoom SuperRep</h3>
                                <a href="<c:url value='/product/productListCtgView/${2 }'/>">
                                <button class="btn btn-blog">$220</button>
                                </a>
                                <span>2 Colors</span>
                            </div>
                        </div>
                        <div class="blog-content" data-aos="fade-left" data-aos-delay="200">
                            <img src="<c:url value='/image/Blog-post/image003.jpg'/>" alt="post-1">
                            <div class="blog-title">
                                <h3>Sportswear Tech Pack Windrunner</h3>
                                <a href="<c:url value='/product/productListCtgView/${3 }'/>">
                                <button class="btn btn-blog">$330</button>
                                </a>
                                <span>1 Colors</span>
                            </div>
                        </div>
                        <div class="blog-content" data-aos="fade-right" data-aos-delay="200">
                            <img src="<c:url value='/image/Blog-post/image004.jpg'/>" alt="post-1">
                            <div class="blog-title">
                                <h3>Jordan "Why Not?" Zer 0.3</h3>
                                <a href="<c:url value='/product/productListCtgView/${4 }'/>">
                                <button class="btn btn-blog">$240</button>
                                </a>
                                <span>1 Colors</span>
                            </div>
                        </div>
                    </div>
                    <div class="owl-navigation">
                        <span class="owl-nav-prev"><i class="fas fa-long-arrow-alt-left"></i></span>
                        <span class="owl-nav-next"><i class="fas fa-long-arrow-alt-right"></i></span>
                    </div>
                </div>
            </div>
            <article  id="content2">
            		<div id="prodcutBox">
            			<h3>BEST PRODUCTS</h3>
            			<div class='product'>
            				<div><a href="<c:url value='/product/productDetailView/${1015}'/>">	
            				<img src="<c:url value='/image/product/1015.PNG'/>"></a></div>
            				<div><a href="<c:url value='/product/productDetailView/${1018}'/>">	
            				<img src="<c:url value='/image/product/1018.PNG'/>"></a></div>
            				<div><a href="<c:url value='/product/productDetailView/${1020}'/>">	
            				<img src="<c:url value='/image/product/1020.PNG'/>"></a></div>
            			</div>
            			<div class='product'>
            				<div><a href="<c:url value='/product/productDetailView/${1001}'/>">	
            				<img src="<c:url value='/image/shoes/shoes01.jpg'/>"></a></div>
            				<div><a href="<c:url value='/product/productDetailView/${1002}'/>">	
            				<img src="<c:url value='/image/product/1002.PNG'/>"></a></div>
            				<div><a href="<c:url value='/product/productDetailView/${1003}'/>">	
            				<img src="<c:url value='/image/product/1003.PNG'/>"></a></div>
            			</div>
					</div> 
                </article>
        </section>

        <!-- ----------x---------- Blog Carousel --------x-------- -->
                
            </section>    
           </main> 
            
            
                      
        </div> <!-- wrap 끝 -->
        <jsp:include page="/WEB-INF/views/jsp/bottom.jsp" flush="true" />
	</body>
	<!-- Bottom -->

</html>


