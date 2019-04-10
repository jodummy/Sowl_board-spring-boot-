<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <header class="header">
      <div class="header_container">
         <div class="container">
            <div class="row">
               <div class="col">
                  <div class="header_content d-flex flex-row align-items-center justify-content-start">
                     <div class="logo">Sowl</div>
                      <nav class="main_nav">
                        <ul>
                           <li class="hassubs">
                              <a href="/">Home</a>
                           </li>
                           <li class="hassubs">
                              <a >Categories</a>
                              <ul>
                                 <li><a href="/board/boardList?board_category=1">총무부</a></li>
                                 <li><a href="/board/boardList?board_category=2">사법부</a></li>
                                 <li><a href="/board/boardList?board_category=3">인사부</a></li>
                                 <li><a href="/board/boardList?board_category=4">정치부</a></li>
                              </ul>
                           </li>
                           <li><a href="/QnA/QnA">QnA</a></li>
                           <li><a href="#">Anything</a></li>
                        </ul>
                     </nav>
                     <div class="header_extra ml-auto">
                        <div class="shopping_cart">
                     <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <form:form action="${pageContext.request.contextPath }/logout" method="POST">
                           <b>${pageContext.request.userPrincipal.name }</b>님 안녕하세요
                           <input class = "logoutBtn" type="submit" value="Logout" class = "logoutBtn"/>
                        </form:form>
                     </c:if>
                     <c:if test="${pageContext.request.userPrincipal.name ==null}">
                        <a class = "loginBtn" href="<c:url value="/login"/>">Login </a><br>
                     </c:if>
                  </div>      
                        <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <!-- Search Panel -->
      <div class="search_panel trans_300">
         <div class="container">
            <div class="row">
               <div class="col">
                  <div class="search_panel_content d-flex flex-row align-items-center justify-content-end">
                     <form action="#">
                        <input type="text" class="search_input" placeholder="Search" required="required">
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- Social -->
      <div class="header_social">
         <ul>
            <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
            <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
         </ul>
      </div>
   </header>