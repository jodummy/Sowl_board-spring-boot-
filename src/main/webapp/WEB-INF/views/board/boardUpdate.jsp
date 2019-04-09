<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<title>update board</title>


<script>
function cancelBoard(board_no , board_category){
	   location.href = "/board/boardDetail?board_no="+board_no+"&board_category="+board_category;
}
function boardList(board_category){
    location.href = "/board/boardList?board_category="+board_category;
 }
</script>


<body>
   <div class="container" style="padding-top: 60px;">
      <form id='updateBoard' action="/boardUpdatePage" name= "updateForm" method="get">
         <input type="hidden" value="${dto.board_no}" name="board_no" id="board_no" />
         <table class="table table-striped table-hover">
            <thead class="thead-dark">
               <tr>
                  <td>작성자</td>
                  <td>
                     <input type="text" value="${dto.board_writer}" readonly="readonly" name="board_writer" style="width: 1100px;"/> 
               </tr>
               <tr>
                  <td>제&nbsp;&nbsp;&nbsp;목</td>
                  <td colspan="3">
                     <input type="text" value="${dto.board_title}" name="board_title" style="width: 1100px; height:50px" />
                  </td>
               </tr>
               <tr>
                  <td class="boardAreaTitleModal">내&nbsp;&nbsp;&nbsp;용</td>
                  <td colspan="3">
                     <textarea name="board_content" id="editor" style="width: 1100px; height: 205px;">${dto.board_content}</textarea>
                 </td>
               </tr>
               <tr>
                  <td colspan="4">
                  <input class="btn btn-outline-secondary" type="submit" id="updateBtn" value="등록" > 
                  <input type="hidden" id="board_category" name="board_category" value="${board_category}">
                  <input class="btn btn-outline-secondary" type="button" id="cancelBtn" value="취소" onclick="cancelBoard(${dto.board_no} , ${board_category})">
                  <input class="btn btn-outline-secondary" type="reset" value="목록" onclick="boardList(${board_category})">
                  </td>
               </tr>
            </thead>
         </table>
      </form>
   </div>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>