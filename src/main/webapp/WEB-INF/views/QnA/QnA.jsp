<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="QnAInsert">           
		<input type="hidden" id ="qna_writer" name="qna_writer" value="${writer }" readonly="readonly" style="width: 1100px;"/> 
		<textarea name="qna_content" id="editor" style="width: 1100px; height: 205px; "></textarea>
		<input type="submit">
		<input type="reset" value="취소">
	</form>
	<table border=1px;>
		<tr>
			<th>작성자</th>
			<th>내 용</th>
			<th>작성일</th>
		</tr>

		<c:forEach var="list" varStatus="i" items="${list}">
			<tr>
				<td>${list.qna_writer }</td>
				<td>${list.qna_content }</td>
				<td>${list.qna_insertdate }</td>
				<input type="hidden" value="${list.qna_no}" name="qna_no" />
				
			</tr>
		</c:forEach>

	</table>


</body>
</html>