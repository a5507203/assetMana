<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>

<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>


		
<body class="tz_body2">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="tz_mainbody2" style="height:250px;">
<!--注册条款 -->
<div class ="tz_center_content">
<div class="tz_right_content">
     
 
<img src="${ctx}images/password_mg.gif"  />				
			
	<div class="tz_box" style="height:230px;">
<form name="frmNew" id="frmNew"   msgModal='label' method="POST" validate='true'  action="${ctx}mb/passwordPost.form">

<table>
 		<tr>
 			<td width="790" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}main.htm">首页&gt;</a>
安全设置</td>
 		 </tr>
 		 	
 	</table>

<ul>

<table >
 		<tr>
 			<td width="790" bgcolor="#DEE9ED" height="22">旧密码验证</td>
 		 </tr>
		 <tr><td height="50"> 请您输入旧密码:&nbsp<input name="oldPswd" id="oldPswd" class="input" type="password"  maxlength="20" >
<span id='msg_oldPswd'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><font class='notice'>${errMsg}</font></td></tr>
		<tr>
 			<td width="680"bgcolor="#DEE9ED" height="22">设置新密码</td>
 		 </tr>
		 <tr><td height="30">请您输入新密码:&nbsp;<input name="newPswd" id="newPswd" class="input" type="password" minlen=6 maxlength="20" >
		<span id='msg_newPswd'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td></tr>
		 <tr ><td height="30">再次输入新密码:&nbsp;<input name="newPswd2" id="newPswd2"  class="input" type="password" minlen=6 maxlength="20" repPswd="newPswd">
		<span id='msg_newPswd2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td></tr> 
 		 	
</table>

<table >
 		<tr >
 			<td align="center"width="790" background="${ctx}imag33/title_low.jpg" height="22"><input id="miSubmit" name="Submit2" value=" 确认提交 "  type="button" class="button"></td>
 		 </tr>
 		 	
 	</table>

</form>
</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(function(){
   $("#miSubmit").click(function(){
	   var frm = $("#frmNew");
		if(!validateFrm(frm))
			return;
		else
			frm.submit();
   });
});
</script>
</html>