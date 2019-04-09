<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>

<body>

   <div class="qna_writer">
      <form action="QnAInsert">
         <input type="hidden" id="qna_writer" name="qna_writer" value="${writer }" readonly="readonly" />
            <div class = editor>
               <textarea name="qna_content" id="editor" style="width: 90%; height: 205px;"></textarea>
            </div>
            <div class="qna_button">
               <input type="submit"> <input type="reset" value="취소">
            </div>
         </form>
   </div>
   
   
   
   <table border=1px; class="qna_box">
      <tr>
         <th>작성자</th>
         <th>내 용</th>
         <th>작성일</th>
      </tr>

      <c:forEach var="list" varStatus="i" items="${list}">
         <tr >         
            <td>${list.qna_writer }</td>
            <td id="qnaContent${list.qna_no }">${list.qna_content }
               <c:if test="${pageContext.request.userPrincipal.name == '김동욱' && list.qna_comment == null }">
                  <a onclick = "QnACommentInsert(${list.qna_no })">답글달기</a>
                  <input type="hidden" id="commentInsert(${list.qna_no })">
               </c:if>
            </td>
            <td>${list.qna_insertdate }
               <c:if test="${pageContext.request.userPrincipal.name == list.qna_writer}">
                  <a onclick = "QnAUpdate('${list.qna_no }','${list.qna_content }')">수정</a>
                  <a onclick="QnADelete(${list.qna_no })">삭제</a>
               </c:if>
            </td>
            <input type="hidden" value="${list.qna_no}" name="qna_no" id="qna_no" />
         </tr>
      </c:forEach>

   </table>
   
   
   
</body>

<script>

function QnAUpdate(qna_no, qna_content){
   $("#qnaContent"+qna_no).html('<div class="qna_update"><form action="QnAUpdate"><input type="hidden" id="qna_writer" name="qna_writer" value="${writer }" readonly="readonly" /><input type="hidden" id="qna_no" name="qna_no" value='+qna_no+' readonly="readonly" /><div class = editor><textarea name="qna_content" id="editor" style="width: 90%; height: 100px;">'+qna_content+'</textarea></div><div class="qna_button"><input type="submit"> <input type="reset" value="취소" onclick="QnARedirect()"></div></form></div>');
}

function QnADelete(qna_no){
   if(confirm("질문을 삭제하시겠습니까?")){
      location.href="/QnA/QnADelete?qna_no="+qna_no;
   }
   return false;
};

function QnARedirect(){
   if(confirm("수정을 취소하시겠습니까?")){
      location.href="/QnA/QnA"
   }
   return false;
}

function QnACommentInsert(qna_no){
   alert(qna_no);;
   $("#commentInsert"+qna_no).html('댓글 넣을꺼다');
} 

</script>


</html>