<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>
<style>
.logoutBtn{
background-color: #FFF;
border : none ;
margin-top : 13px;
}
</style>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"></a>
		</div>
		<div class="collapse navbar-collapse navbar-left" id="navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="../">Home</a></li>
				<li><a href="/../board/boardList">공지사항</a></li>

			</ul>
		</div>
		<div class="collapse navbar-collapse navbar-right"
			id="navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="login-signin">
					<c:if test="${pageContext.request.userPrincipal.name != null}">
<%-- 						어서오세요! ${pageContext.request.userPrincipal.name }! <br> --%>
							<form:form action="${pageContext.request.contextPath }/logout" method="POST">
							<input type="submit" value="Logout" class = "logoutBtn"/>
							</form:form>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name ==null}">
						<a href="<c:url value="/login"/>">login </a><br>
					</c:if>
				</li>
			</ul>
		</div>
</nav>
