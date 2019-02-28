<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<title>insertBoard</title>


<body>
   <div class="container" style="padding-top: 60px;">
      <form id ="insertBoardForm" name= "insertForm" method="get" action="/boardInsertPage">
         <table class="table table-striped table-hover">
            <thead class="thead-dark">
   
               <tr>
                  <td>작성자</td>
                  <td>
                     <input type="text" value="coogy" id ="board_writer" name="board_writer" readonly="readonly" required/> 
                  </td>
               </tr>
               <tr>
                  <td>제&nbsp;&nbsp;&nbsp;목</td>
                  <td colspan="3">
                     <input class="form-control" type="text" id="board_title" name="board_title" required/>
                  </td>
               </tr>
               <tr>
                  <td class="boardAreaTitleModal">내&nbsp;&nbsp;&nbsp;용</td>
                  <td colspan="3">
                     <textarea name="board_content" id="board_content" style="width: 1000px; height: 205px;" required></textarea>
                  </td>
               </tr>
               <tr>
                  <td colspan="4">
                     <input class="btn btn-outline-secondary" type="reset" value="재작성">
                      <input class="btn btn-outline-secondary" type="submit" id="insertButton" value="등록"/>
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