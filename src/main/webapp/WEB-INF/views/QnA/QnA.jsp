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
               <input type="submit" value="제출"> <input type="reset" value="취소">
            </div>
         </form>
   </div>
   
   
   
   <table class="qna_box">
      <tr>      
         <th>내 용</th>   
      </tr>

      <c:forEach var="list" varStatus="i" items="${list}">
         <tr>         
            <td id="qnaContent${list.qna_no }">
            <div id = "writer">
               <div class = "writer">
                  <div class = "writer1">${list.qna_writer }</div>
               </div>
               <div id="qnadata">${list.qna_insertdate }</div>
               <c:if test="${pageContext.request.userPrincipal.name == list.qna_writer}">
               <div id="qna_u" class="qna_ud">
                  <a onclick = "QnAUpdate('${list.qna_no }','${list.qna_content }')">수정</a>
               </div>
               <div id="qna_d" class="qna_ud">
                  <a onclick="QnADelete(${list.qna_no })">삭제</a>
               </div>
               </c:if>
            </div>
               <div class = "qna_content">${list.qna_content }</div>
<%--                <c:if test="${list.qna_comment =! null }"> --%>
<!--                   <a>답글있음</a> -->
<%--                </c:if> --%>

               <c:if test="${pageContext.request.userPrincipal.name == '관리자' && list.qna_comment == null }">
                  <a class= "QnACommentInsert"onclick = "QnACommentInsert('${list.qna_no }')">답글달기</a>
               </c:if>
               <div id="comment${list.qna_no }" >
                  ${list.qna_comment }
                  <c:if test="${pageContext.request.userPrincipal.name == '관리자' && list.qna_comment != null}">
                     <a onclick="commentUpdate('${list.qna_no}','${list.qna_comment }')">수정</a>
                     <a onclick="commentDelete(${list.qna_no})">삭제</a>
                  </c:if>
               </div>
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
function commentUpdate(qna_no, qna_comment){
   $("#comment"+qna_no).html('<div class="comment_update"><form action="commentUpdate"><input type="hidden" id="qna_writer" name="qna_writer" value="${writer }" readonly="readonly" /><input type="hidden" id="qna_no" name="qna_no" value='+qna_no+'><div class = editor><textarea name="qna_comment" id="editor" style="width: 90%; height: 100px;">'+qna_comment+'</textarea></div><div class="qna_button"><input type="submit"> <input type="reset" value="취소" onclick="QnARedirect()"></div></form></div>')
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

function QnACommentInsert(qna_no, qna_content){
   $("#comment"+qna_no).html('<form action="commentInsert"><input type="hidden" id="qna_writer" name="qna_writer" value="${writer }" readonly="readonly" /><input type="hidden" id="qna_no" name = "qna_no" value='+qna_no+'><input type="hidden" id="qna_content" name="qna_content" value='+qna_content+'><div class = editor><textarea name="qna_comment" id="editor" style="width: 90%; height: 100px;"></textarea></div><div class="qna_button"><input type="submit"> <input type="reset" value="취소"></div></form>');
} 

function commentDelete(qna_no){
   if(confirm("답글을 삭제하시겠습니까?")){
      location.href = "/QnA/commentDelete?qna_no="+qna_no
   }
   return false;
}



</script>


</html>