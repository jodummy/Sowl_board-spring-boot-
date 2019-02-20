<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<title>insertBoard</title>

<script>
	function insert() {
		let insertBoard = $("#insertBoard").serialize();
		alert(insertBoard);
		$.ajax({
			type : "post",
			data : insertBoard,
			url : "boardInsertpage",
			success : function(msg) {
				location.href = "boardList";
			},
			error : function(textStatus, errorThrown) {
				alert(textStatus);
				alert(errorThrown);
			}
		});
	}
</script>
<body>
	<div class="container" style="padding-top: 60px;">
		<form id='insertBoard'>
			<table class="table table-striped table-hover">
				<thead class="thead-dark">
	
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" value="coogy" name="board_writer" readonly="readonly" /> 
						</td>
					</tr>
					<tr>
						<td>제&nbsp;&nbsp;&nbsp;목</td>
						<td colspan="3">
							<input class="form-control" type="text" name="board_title" />
						</td>
					</tr>
					<tr>
						<td class="boardAreaTitleModal">내&nbsp;&nbsp;&nbsp;용</td>
						<td colspan="3">
							<textarea name="board_content" id="editor" style="width: 1000px; height: 205px;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input class="btn btn-outline-secondary" type="reset" value="재작성">
				 			<input class="btn btn-outline-secondary" type="button" id="savebutton" value="등록" onclick="insert()" />
				 		</td>
					</tr>
				</thead>
			</table>
		</form>
	</div>





	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>