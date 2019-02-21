<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<title>detail board</title>

<script>
function cancelBoard(board_no){
	   location.href = "/boardDetail?board_no="+board_no;
}
</script>


<body>

   <div class="container" style="padding-top: 60px;">
      <form id='updateBoard' action="/boardUpdatePage" name= "updateForm" method="post">
         <input type="hidden" value="${dto.board_no}" name="board_no" id="board_no" />
         <table class="table table-striped table-hover">
            <thead class="thead-dark">
               <tr>
                  <td>작성자</td>
                  <td>
                  	<input type="text" value="${dto.board_writer}" name="board_writer" id="board_writer"/></td>
               </tr>
               <tr>
                  <td>제&nbsp;&nbsp;&nbsp;목</td>
                  <td colspan="3">
                  	<input class="form-control" type="text" value="${dto.board_title}" name="board_title" id="board_title"/>
                  </td>
               </tr>
               <tr>
                  <td class="boardAreaTitleModal">내&nbsp;&nbsp;&nbsp;용</td>
                  <td colspan="3">
                 	 <input name="board_content" id="editor" value="${dto.board_content}" style="width: 1000px; height: 205px;"></input>>
                 </td>
               </tr>
               <tr>
                  <td colspan="4">
                  <input class="btn btn-outline-secondary" type="submit" id="updateBtn" value="등록" > 
                  <input class="btn btn-outline-secondary" type="button" id="cancelBtn" value="취소" onclick="cancelBoard(${dto.board_no})"></td>
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