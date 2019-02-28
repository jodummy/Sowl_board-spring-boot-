<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<title>detail board</title>


<script>
function deleteBoard(board_no){
   location.href =  "/board/boardDelete?board_no="+board_no;
}
function updateBoard(board_no){
	location.href = "/board/boardUpdate?board_no="+board_no;
}
</script>

<body>

   <div class="container" style="padding-top: 60px;">
      <form id='detailBoard'>
         <input type="hidden" value="${dto.board_no}" name="no" id="board_no" />
         <table class="table table-striped table-hover">
            <thead class="thead-dark">
               <tr>
                  <td>작성자</td>
                  <td><input type="text" value="${dto.board_writer}"
                     name="board_writer" readonly="readonly" /></td>
               </tr>
               <tr>
                  <td>제&nbsp;&nbsp;&nbsp;목</td>
                  <td colspan="3"><input class="form-control" type="text" value="${dto.board_title}" name="board_title" readonly="readonly" />
                  </td>
               </tr>
               <tr>
                  <td class="boardAreaTitleModal">내&nbsp;&nbsp;&nbsp;용</td>
                  <td colspan="3"><input name="board_content" id="editor" readonly="readonly" value="${dto.board_content}" style="width: 1000px; height: 205px;"></input></td>
               </tr>
               <tr>
                  <td colspan="4">
                  <input class="btn btn-outline-secondary" type="button" id="updateBtn" value="수정" onclick="updateBoard(${dto.board_no})"> 
                  <input class="btn btn-outline-secondary" type="button" id="deleteBtn" value="삭제" onclick="deleteBoard(${dto.board_no})"></td>
               </tr>
            </thead>
         </table>
      </form>
   </div>

   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="resource/bootstrap/js/bootstrap.min.js"></script>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>