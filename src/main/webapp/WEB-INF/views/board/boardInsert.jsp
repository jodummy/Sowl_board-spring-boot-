<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<title>insertBoard</title>


<body>
   <div class="container" style="padding-top: 60px;">
      <form id ="insertBoardForm" name= "insertForm" method="get" action="/boardInsertPage">	
         <table class="table table-striped table-hover">
            <thead class="thead-dark">	
               <tr>
                  <td class="board_wt">작성자</td>
                  <td>
                     <input type="text" id ="board_writer" name="board_writer" value="${writer }" readonly="readonly" style="width: 1100px;" required="required"/> 
                  </td>
               </tr>
               <tr>
                  <td>제&nbsp;&nbsp;&nbsp;목</td>
                  <td colspan="3">
                     <input type="text" name="board_title" style="width: 1100px; height:50px" required="required"/>
                  </td>
               </tr>
               <tr>
                  <td class="boardAreaTitleModal">내&nbsp;&nbsp;&nbsp;용</td>
                  <td colspan="3">
                     <textarea name="board_content" id="editor" style="width: 1100px; height: 205px;" required="required"></textarea>
                  </td>
               </tr>
               <tr>
                  <td colspan="4">
                  <input type="hidden" name="board_category" id="board_category" value="${board_category }"/>
                    <input class="btn btn-outline-secondary" type="reset" value="재작성">
                     <input class="btn btn-outline-secondary" type="submit" id="insertButton" value="등록"/>
                     <input id="board_list_button" class="btn btn-outline-secondary" type="reset" value="목록" onclick="boardList()">
                   </td>
               </tr>
            </thead>
         </table>
      </form>
   </div>





   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="resource/bootstrap/js/bootstrap.min.js"></script>
   <script >
   function boardList(board_category){
	   location.href = "/board/boardList?board_category="+board_category;
   }
   </script>
  
   
</body>
</html>