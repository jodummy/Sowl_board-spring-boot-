<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>


<html lang="ko">

<title>boardList</title>
  
<body>
   <div class= "container" id = "board">
   <table>
      <tr>
         <th>NO</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
      </tr>
      
       <c:forEach var="list" varStatus="i" items="${list}">
       <tr onclick="test(${list.board_no} , ${board_category} )">
             <th scope="row">${list.no }</th>
            <td>${list.board_title }</td>
            <td>${list.board_writer }</td>
            <td>${list.board_insertdate }</td>
      </tr>
      </c:forEach>
      
   </table>
   <br />
   <ul class="searching">
      <li class="li_button"><button type="button" onclick="boardInsert('${board_category}')"><span class="glyphicon glyphicon-pencil"></span> 글쓰기</button></li>
      <li> <%--검색 처리 영역--%>
  
       <div class="form-group col-sm-9"> 
           <div class="input-group">
               <input type="text" class="form-control" name="keyword" id="keywordInput" value="${criteria.keyword}" placeholder="검색어">
               <input type="hidden" name="category" id ="board_category" value= "${board_category}">
               <span class="input-group-btn">
                   <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
                       <i class="fa fa-search"></i> 검색
                   </button>
               </span>
              </div>
    </div></li>
   </ul>
   <br/>
   <br/>
   <br/>
<%--페이징 처리 영역--%>
<div class="text-center">
    <ul class="pagination">
        <c:if test="${pageMaker.prev}">
            <li>
                <a href="/board/boardList${pageMaker.makeSearch(pageMaker.startPage - 1)}&board_category=${board_category}" >&laquo;</a>
            </li>
        </c:if>
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            <li <c:out value="${pageMaker.criteria.page == idx? 'class=active':''}"/>>
                <a href="/board/boardList${pageMaker.makeSearch(idx)}&board_category=${board_category}">${idx}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li>
                <a href="/board/boardList${pageMaker.makeSearch(pageMaker.endPage + 1)}&board_category=${board_category}" >&raquo;</a>
            </li>
        </c:if>
    </ul>
</div>



</div>



   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="resource/bootstrap/js/bootstrap.min.js"></script>
</body>




<script>
   function boardInsert(board_category) {
      location.href = "/board/boardInsert?board_category="+board_category;
   }
   function test(no , board_category) {
      location.href ="boardDetail?board_no=" + no +"&board_category="+board_category;
   }
   
    $(document).ready(function () {
           /*=================================== 게시글 페이지 이동 관련 / 등록,삭제 알림 ===================================*/
           let result = "${msg}";
           
           // 검색 버튼 클릭시
           $("#searchBtn").on("click", function () {
               self.location = "boardList${pageMaker.makeQuery(1)}"
                               + "&keyword=" + encodeURIComponent($("#keywordInput").val())
                               + "&board_category="+ encodeURIComponent($("#board_category").val());
           });
       });
   
</script>







</html>