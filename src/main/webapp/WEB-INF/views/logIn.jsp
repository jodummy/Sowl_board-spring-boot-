<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>



<html>
<body>
	<div style = "width:80%" >
		<form class="row" method="post" action="/logInDo">
			<div class="input-section">
				<div class="form-group col-lg-6">
					<input name="sowl_id" type="text" placeholder="아이디" class="form-control" />
				</div>
				<div class="form-group col-lg-6">
					<input name="sowl_password" type="password" placeholder="비밀번호" class="form-control" />
				</div>
			</div>
			<div class="login-signin-button">
				<p>
				<input type="submit" value="로그인"/>
				</p>
			</div>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>