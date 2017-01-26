<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>




<script type="text/javascript">






function addAgentSubmit() {
	
	var frm = document.frmEdit;

	frm.submit();
}
</script>
<body >

<div class="mainbody" style="width:580px;height:480px;overflow:hidden;">

<div class="main_mid" style="width:580px;height:480px;overflow:hidden;">
<c:if test="${not empty param.succ or not empty param.err}">


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
<form name="frmEdit" msgModal='label' method="POST" validate='true' action="${ctx}property/updateAgent.form" enctype="multipart/form-data">
<input type="hidden" id="id" name="id" value="${agent.id}"> 
<div class="newreg" style="height:480px;">
<ul>


<li class="hdxxx">
 	<font color = "#ffffff">请填写您的详细信息(前面加 * 的为必填项)<br><br></font>
 </li>
 
 <li class="lft3">
 <font color="#cc0000">*</font>Name：
 </li>
 <li class="rt3">
	<input value="${agent.name}" id ="name" name="name" class="input"  minlen=1   maxlength="50" type="text" style="width:200px;">
 </li> 



 <li class="lft3">
 <font color="#cc0000">*</font>type：
 </li>
 <li class="rt3">
	<input value="${agent.type}" name="type" id="type" class="input"  type="text" style="width:200px;">
 </li> 
 
  <li class="lft3">
 <font color="#cc0000">*</font>address：
 </li>
 <li class="rt3">
	<input value="${agent.address}" id="address" name="address" class="input"   maxlength="50" type="text" style="width:200px;">
 </li> 
 
 
 
  <li class="lft3">
 suburb：
 </li>
 <li class="rt3">
	<input  value="${agent.suburb}"  id="suburb" name="suburb" class="input"    id="suburb"   type="text"  style="width:200px;">
	<span id='msg_suburb'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 <li class="lft3">
 state：
 </li>
 <li class="rt3">
	<input  value="${agent.state}" name="state"  class="input" id="state"   maxlength="18" type="text"  style="width:200px;">
	<span id='msg_state'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
  <li class="lft3">
  Postcode：
 </li>
 <li class="rt3">
	<input name="postCode"  class="input" id="postCode" value="${agent.postCode}"    maxlength="18" type="text"  style="width:200px;">
	<span id='msg_postCode'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
   <li class="hdccc">
 	<font color = "#ffffff">请正确填写您的手机号码 格式如:13612345636</font>
 </li>
 
  <li class="lft3">
 <font color="#cc0000">*</font>手机：
 </li>
 <li class="rt3">
	<input value="${agent.mobile}" name="mobile"  class="input" id="mobile" value=""  minlen=5  mobile='1'  style="width:200px;" maxlength="11" type="text">
	<span id='msg_mobile'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 <li class="lft3">
 <font color="#cc0000">*</font>您的联系电子邮件：
 </li>
 <li class="rt3">
	<input value="${agent.email}" name="email" email=1 minlen=1 class="input" id="email" maxlength="100" type="text" style="width:200px;">
	<span id='msg_email'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
  
 <li class="lft3">
 <font color="#cc0000">*</font>note：
 </li>
 <li class="rt3">
	<input value="${agent.note}" name="note"  minlen=1 class="input" id="note" maxlength="200" type="text" style="width:200px;">
	<span id='msg_note'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
 
   <li class="hdxxx">
 	<input id="miSubmit" onClick="addAgentSubmit()" name="Submit2" value=" 提交 "  type="button" class="button">
	
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