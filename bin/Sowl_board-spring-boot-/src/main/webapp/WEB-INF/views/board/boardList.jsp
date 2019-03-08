<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>


<html lang="ko">

<title>boardList</title>
  
<body>
	<div class= "container">
	<h3 class="box-title">게시글 목록 (${totalCount})</h3>
	<table style="margin: auto" class="table table-striped table-hover">
		<tr>
			<th>NO</th>
			<th style="text-align: center">제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		
				
		 <c:forEach var="list" varStatus="i" items="${list}">
		 <tr>
		 		<th scope="row">${list.no }</th>
				<td><a href="boardDetail?board_no=${list.board_no}">${list.board_title }</a></td>
				<td>${list.board_writer }</td>
				<td>${list.board_insertdate }</td>
				<input type="hidden" value="${list.board_no}" name="board_no" />
		</tr>
		</c:forEach>
		
	</table>
	<br />
	<ul class="searching">
		<li><button type="button" class="btn btn-danger" onclick="boardInsert()"><span class="glyphicon glyphicon-pencil"></span> 글쓰기</button></li><br>
<!-- 		<li><input type="button" onclick="boardInsert()" value="글쓰기"></li> -->
		<li> <%--검색 처리 영역--%>
   		 <div class="form-group col-sm-2">
      		  <select class="form-control" name="searchType" id="searchType">
          		  <option value="n" <c:out value="${criteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
      		      <option value="t" <c:out value="${criteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
        		    <option value="c" <c:out value="${criteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
        		    <option value="w" <c:out value="${criteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
        		    <option value="tc" <c:out value="${criteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
          		  	<option value="cw" <c:out value="${criteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
          			<option value="tcw" <c:out value="${criteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
        	</select>
    	</div>
    	<div class="form-group col-sm-9"> 
        	<div class="input-group">
          	  <input type="text" class="form-control" name="keyword" id="keywordInput" value="${criteria.keyword}" placeholder="검색어">
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
                <a href="/board/boardList${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
            </li>
        </c:if>
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            <li <c:out value="${pageMaker.criteria.page == idx? 'class=active':''}"/>>
                <a href="/board/boardList${pageMaker.makeSearch(idx)}">${idx}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li>
                <a href="/board/boardList${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a>
            </li>
        </c:if>
    </ul>
</div>



</div>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>




<script>
	function boardInsert() {
		location.href = "/board/boardInsert"
	}
	
	 $(document).ready(function () {
	        /*=================================== 게시글 페이지 이동 관련 / 등록,삭제 알림 ===================================*/
	        let result = "${msg}";
	        
	        // 검색 버튼 클릭시
	        $("#searchBtn").on("click", function () {
	            self.location = "boardList${pageMaker.makeQuery(1)}"
	                            + "&searchType=" + $("select option:selected").val()
	                            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
	        });
	    });
	
</script>







</html>
