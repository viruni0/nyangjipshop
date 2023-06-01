<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page session="true" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<!-- head -->
<%@ include file="include/head.jsp" %>
<!-- head end -->

<script>
$(function(){
   // location.href : 버튼 클릭 시에 넘어 갈 정보
   // Controller와 연결지어서 찾아가기
   //목록 버튼을 눌렀을 때 처리
   $("#us").click(function(){
      location.href="${contextPath}/report/my_rplist?b_p_bno=" + ${board.b_p_bno};
   });
   $("#ro").click(function(){
     location.href="${contextPath}/mypageGM/rp_gm?b_p_bno=" + ${board.b_p_bno};
   });
   //삭제 버튼을 눌렀을 때 처리
   $(".btn-danger").click(function(){
      location.href="qadel?b_p_bno=" + ${board.b_p_bno};
   });
   
   //완료 버튼을 눌렀을 때 처리
   $("#ok").click(function(){
      location.href="${contextPath}/mypageGM/rp_gmresult?b_p_bno=" + ${board.b_p_bno};
   });
   
   //댓글작성 버튼을 눌렀을 때 처리
   $(".btn-info").click(function() {
      location.href ="ins_reply?b_p_bno=" + ${board.b_p_bno};
   });
})

//ajax를 통한 댓글 기능 작성하기
   $(document).ready(function(){
      console.log('ajax text ready~~');
      //댓글 목록 불러오는 ajax
      replylist();
      
//      세개다 같은거!!!
//      $('#btnReplySave').click(function()){
//      $('#btnReplySave').on('click',function()){ 
      $(document).on('click','#btnReplySave',function(){
         var b_r_content = $("#b_r_content").val();
         var u_p_id = $("#u_p_id").val();
         var user = "${user.u_p_id}";
         
         var url = "${pageContext.request.contextPath}/board/reply2";   //ajax 사용
         var paramData = {
               "b_r_content"    : b_r_content,
               "u_p_id"      : u_p_id,
               "b_p_bno"      : '${board.b_p_bno}'
            }
         
         $.ajax({
            url: url,
            data: paramData,
            dataType: 'json',
            type: 'POST',
            success:function(result){
               replylist();
               $("#b_r_content").val('');
               $("#u_p_id").val(user);
            },
            error:function(result){
               alert('에러가 발생했습니다.');
            }
         });
      });
      
   });
   
   //ajax : 댓글 목록 불러오기 -> board/replylist,bno
   function replylist(){
      const url = "${pageContext.request.contextPath}/board/replylist";
      var paramData = {
            "b_p_bno" : "${board.b_p_bno}"
      };
      
      $.ajax({
         url:url,
         data:paramData,
         dataType:'json',
         type:'POST',
         success: function(result){
            
            var user = "${user.u_p_id}";
            var u_nname = "${user.u_nname}";
            var u_state = "${user.u_state}";
            var htmls = "";   //문서꾸미기
            if(result.length < 1) {
               htmls += '<h3>처리중입니다 :)</h3>';
            } else {
               $(result).each(function(){
                  htmls = htmls + '<div class="" id="b_r_p_reno' +this.b_r_p_reno + '">';   
                   htmls += '<span class="d-block">';
                   htmls += this.b_r_p_reno + ' - ';
                   htmls += '<strong class="text-gray-dark">' + u_nname + '</strong>';
                   htmls += '<a>&nbsp;/&nbsp;</a>' + this.b_r_date;
                   htmls += '<span style="padding-left: 7px; font-size: 9pt">';
               if(user==this.u_p_id||u_state==4){
                  htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.b_r_p_reno + ', \'' + this.u_p_id + '\', \'' + this.b_r_content + '\' )" style="padding-right:5px">수정</a>';
                  htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.b_r_p_reno + ')" >삭제</a>';
               }
                   htmls += '</span>';
                   htmls += '</span><br>';
                   htmls += this.b_r_content;
                   htmls += '</p>';
                   htmls += '</div>';   
               });
            }
            $("#replylist").html(htmls);   //댓글위치에 html로 보여주기
         },
         error:function(result){
            alert("실패");
         }
         
      });
      
   }
   
   //댓글 수정하기(form)
   function fn_editReply(b_r_p_reno, u_p_id, b_r_content) {
      
      var htmls = "";
      var u_nname = "${user.u_nname}";
      htmls = htmls + '<div class="" id="b_r_p_reno' + b_r_p_reno + '">';   
      htmls += '<span class="d-block">';
      htmls += b_r_p_reno + ' - ';
      htmls += '<strong class="text-gray-dark">' + u_nname + '</strong>';
      htmls += '<span style="padding-left: 7px; font-size: 9pt">';
      htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + b_r_p_reno + ', \'' + u_p_id + '\')" style="padding-right:5px">저장</a>';
      htmls += '<a href="javascript:void(0)" onclick="replylist()" >취소</a>';
      htmls += '</span>';
      htmls += '</span><br>';
      htmls += '<textarea id="editmemo" name="editmemo" rows="3">';
      htmls += b_r_content;
      htmls += '</textarea>';
      htmls += '</p>';
      htmls += '</div>';
      //선택한 요소를 다른것으로 바꿉니다.(변경)
      $('#b_r_p_reno'+b_r_p_reno).replaceWith(htmls);
      $('#b_r_p_reno'+b_r_p_reno+'#editmemo').focus();
   }
   
   //댓글 수정하기(처리)
   function fn_updateReply(b_r_p_reno, u_p_id){
      var editmemo = $('#editmemo').val();
      const url = "${pageContext.request.contextPath}/board/replyupdate2";
      var paramData = {
            "b_r_p_reno" : b_r_p_reno,
            "u_p_id" : u_p_id,
            "b_r_content" : editmemo
      };
      
      $.ajax({
         url:url,
         data:paramData,
         dataType: 'json',
         type: 'POST',
         success:function(result){
            console.log(result);
            replylist();
         },
         error:function(result){
            console.log(result);
            alert("에러가 발생했습니다");
         }
      });
   }
   
   //댓글 삭제하기(처리)
   function fn_deleteReply(b_r_p_reno){
      const url = "${pageContext.request.contextPath}/board/replydelete2";
      var paramData = {
            "b_r_p_reno" : b_r_p_reno
      };
      
      $.ajax({
         url:url,
         data:paramData,
         dataType: 'json',
         type: 'POST',
         success:function(result){
            console.log(result);
            replylist();
         },
         error:function(result){
            console.log(result);
            alert("에러가 발생했습니다");
         }
      });
   }
</script>

<body>
<!-- Main Header -->
<!-- header -->
<%@ include file="include/header.jsp" %>
<!-- header end -->
<!-- hero -->
<%@ include file="include/hero.jsp" %>
<!-- hero end --> 

    <!-- Main content --> 
<section class="content container-fluid">
   <div class="container">
      <div class="row">
         <div class="col-lg-11 col-md-7">
            <div class="box-header">
               <h3 class="box-title" >상세보기</h3>
            </div>
            <br><br>
            <div class="table-responsive">
               <table class="table" style="width:94%">
                     <div>
                        <label>제목</label> <input type="text" name="b_title"
                           class="form-control" value="${board.b_title}" readonly="readonly"style="width:94%"  />
                     </div>
                     <div>
                        <label>내용</label>
                        <textarea name="b_content" rows="5" readonly="readonly"
                           class="form-control" style="width:94%">${board.b_content}</textarea>
                     </div>
                     <div>
                        <label>작성자</label> <input type="text" name="u_p_id"
                           class="form-control" value="${board.u_p_id}" readonly="readonly" style="width:94%"/>
                     </div>
                  </div>
                  <br> 
      <div>
         <input type="text" style="width:62px;float:right;background-color:white;opacity:0">   
         <c:if test="${user.u_state == 4}"> 
         <button type="button" id="ro" class="btn btn-primary" style="float:right;">목록</button>
         </c:if>
         <c:if test="${user.u_state != 4}"> 
         <button type="button" id="us" class="btn btn-primary" style="float:right;">목록</button>
         </c:if>
         <button type="button" class="btn btn-danger" style="float:right;">삭제</button>
         <c:if test="${user.u_state == 4}">
         <button type="button" id="ok" name="ok" class="btn btn-warning" style="float:right;">완료</button>
         </c:if>
      </div>
      </table>
      <br>
   </div>
         <c:if test="${user.u_state==4}">
           <div class="box-body">
              <table>
                  <tr>
                     <td rowspan="2" width="70%">
                     <textarea class="form-control" name="b_r_content" id="b_r_content" placeholder="댓글을 입력하세요"></textarea>
                     </td>
                     <td><input type="text" value="${user.u_nname}" readonly></td>
                     <td><input type="hidden" name="u_p_id" id="u_p_id" value="${user.u_p_id}" readonly></td>
                     </tr>
                     <tr>
                     <td><button type="button" id="btnReplySave">저장</button></td>
                  </tr>
               </table>
               <br>
            </div>
         </c:if>
      </div>
      <hr><p></p>
      <div class="col-lg-11 col-md-7">
      <div id="replylist">
     </div>
         </div>
      </div>
   </div>
</section>
    <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@ include file="include/plug_in.jsp" %>   
    

<!-- ./wrapper -->

</body>
</html>