
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class ="tee_left" style="background-image:url(${ctx}imag88/NEW_USER_INDEX_08.jpg);overflow:hidden">
		       <div class ="tee_left_center">
		      
<c:if test="${!empty sessionScope.mb}">
					  
					  <c:if test="${!empty sessionScope.mb.imgPath}">
             <div class="user_person_img">
			 <table border="1" bordercolor="#00CCFF" width="120" height="150">
			 <tr><td>
             <img  class ="user_person_img" src="${ctx}${sessionScope.mb.imgPath}" ></img>
			 </td></tr>
			 </table>
             </div>
           </c:if>
           <c:if test="${empty sessionScope.mb.imgPath}">
             <div class="user_person_img">
			 	 <table border="1" bordercolor="#00CCFF">
			 <tr><td>
             <img class ="user_person_img" src="${ctx}images/nonephoto.jpg" ></img>
			  </td></tr>
			  	 </table>
             </div>
           </c:if>
		   
		   <div style ="margin-top:20px;text-align:center">
		 <font color="#ffffff">
		 亲爱的${sessionScope.mb.username}<c:if test="${2 ne sessionScope.mb.auditStatus}">[<code:codeList codeTable="b_audit_status" codeId="${sessionScope.mb.auditStatus}"></code:codeList>]</c:if>
		 <br>你好!<br>
		 欢迎使用科普大篷车网络申报平台</font>
		</div>
		
		
		 <div style ="margin-top:20px;text-align:center">
		 <a id = 'theLink_exit' mid='z_resource'  href="${ctx}mb/logOut.form"></a>
		</div>
	         </c:if>  
	         
	         
	         
	         
		       </div>
		       
		
		</div>