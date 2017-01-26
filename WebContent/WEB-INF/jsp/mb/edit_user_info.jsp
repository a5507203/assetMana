<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/mb/register.js" type="text/javascript"></script>

<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
 


<body>

<div class="mainbody" style="width:580px;height:480px;overflow:hidden;">

<div class="main_mid" style="width:580px;height:480px;overflow:hidden;">
<c:if test="${not empty param.succ or not empty param.err}">

	<div id="effect">
		<h3 ></h3>
		<p>
			<c:if test="${'1' eq param.succ}">
			恭喜！你的已提交成功！
			</c:if>
			<c:if test="${'1' eq param.err}">
			抱歉！提交时错误！
			</c:if>
		</p>
	</div>
			<c:if test="${'1' eq param.succ}">
		<script>
		alert('恭喜你提交成功');
			closethewindow();
	</script>
			</c:if>
					<c:if test="${'1' eq param.err}">
		<script>
		alert('提交时错误');
			closethewindow();
	</script>	
		</c:if>
	
</c:if> 
<form name="frmNew" msgModal='label' method="POST" validate='true' action="${ctx}admin/editPost.form" enctype="multipart/form-data">
<input type="hidden" name="id" value="${mb.id}"> 
<input value="${mb.realName}" name="realName" type="hidden">
<div class="newreg" style="height:480px;">
<ul>


<li class="hdxxx">
 	<font color = "#ffffff">请填写您的详细信息(前面加 * 的为必填项)</font>
 </li>
 <li class="lft3">
 <font color="#cc0000">*</font>用户名：
 </li>
 <li class="rt3">
	${mb.realName}
	<input type="hidden" name="branchId" value="${mb.branchId}" />
 </li> 

 
 
 

 
 
 <li class="lft3">
详细信息：
 </li>
 <li class="rt3" style="height:60px;">
	<textArea name="descript" class="input" id="descript" maxlen="100" rows="6" cols="20"  style="width:200px;" >${mb.descript}</textArea>
	<span id='msg_realName'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 <font color="#cc0000">*</font>您的联系电子邮件：
 </li>
 <li class="rt3">
	<input value="${mb.email}" name="email" email=1 minlen=1 class="input" id="email" maxlength="100" type="text" style="width:200px;">
	<span id='msg_email'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
  
  <li class="hdccc">
 	<font color = "#ffffff">请正确填写您的手机号码 格式如:13612345636</font>
 </li>

 <li class="lft3">
 <font color="#cc0000">*</font>手机：
 </li>
 <li class="rt3">
	<input value="${mb.mobile}" name="mobile"  class="input" id="mobile" value=""  minlen=5  mobile='1'  style="width:200px;" maxlength="11" type="text">
	<span id='msg_mobile'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 


 <li class="hdccc">
 	<font color = "#ffffff">请正确填写您的固定电话号码如:010-12345678</font>
 </li>

          
 <li class="lft3">
 <font color="#cc0000">*</font>座机：
 </li>
 <li class="rt3">
	<input value="${mb.phone}" name="phone" class="input" id="phone" value="" minlen=5 phone='1' type="text"  style="width:200px;">
	<span id='msg_phone'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
  <li class="lft3">
 联系人：
 </li>
 <li class="rt3">
	<input  value="${mb.connect_name}" name="connect_name"  class="input" id="connect_name"   maxlength="18" type="text"  style="width:200px;">
	<span id='msg_connect_name'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
  <li class="lft3">
  邮编：
 </li>
 <li class="rt3">
	<input name="c_mail"  class="input" id="c_mail" value="${mb.c_mail}"    maxlength="18" type="text"  style="width:200px;">
	<span id='msg_c_mail'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
 
   <li class="hdxxx">
 	<input id="miSubmit" name="Submit2" value=" 提交 "  type="button" class="button">
	<input id="goback" class="button"  onclick="window.close();" name="goback" value=" 返回 "  type="button">
 </li>
 

 </ul>
 <table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">&nbsp;</td>
 		 </tr>
 		 	
 	</table>
</div>
</form>
</div>
</div>
</body>
</html>