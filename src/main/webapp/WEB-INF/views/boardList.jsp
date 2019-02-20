<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<script>
	function boardInsert() {
		location.href = "/boardInsert"
	}
</script>
<html lang="ko">

<title>boardList</title>

<body>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="list">
			<tr>
				<th scope="row">${list.no }</th>
				<td><a href="boardDetail?board_no=${list.board_no}">${list.board_title }</a></td>
				<td>${list.board_writer }</td>
				<td>${list.board_content }</td>
				<td>${list.board_insertdate   }</td>
			</tr>
			<input type="hidden" value="${list.board_no}" name="board_no" />
		</c:forEach>
	</table>
	<input type="button" onclick="boardInsert()" value="글쓰기">


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>