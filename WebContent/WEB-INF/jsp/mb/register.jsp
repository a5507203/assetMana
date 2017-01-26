<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}css/toggleElements3.css" />
<script src="${ctx}js/mb/register.js" type="text/javascript"></script>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
 

		
<body class="tz_body2" style="width:580px;height:560px;overflow:hidden;">
 
<div class="tz_mainbody2" style="width:580px;height:560px;overflow:hidden;">
<!--注册条款 -->
<div class ="tz_center_content" style="width:580px;height:560px;overflow:hidden;">
<div class="tz_right_content" style="width:580px;height:560px;overflow:hidden;">
     
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
			
			
	
<form name="frmNew" msgModal='label' method="POST" validate='true'  action="${ctx}admin/registerPost.form" 
enctype="multipart/form-data"
>
<!--注册条款 -->
<div class="newreg" style="height:800px;">
<ul>
  
 
 
 	<li class="hdxxx">
 	<font color = "#ffffff">请填写用户登陆信息(前面加 * 的为必填项)</font>
 </li>
 
 <li class="hd">
 	&nbsp;
 </li>

<li class="hdccc">
 	<font color = "#ffffff">登录号由字母或字母、数字组合组成,若检查不通过，说明此号已被注册</font>
 </li>
 <li class="lft3" >
 <font color="#cc0000">*</font>登录号：
 </li>
 <li class="rt3" >
	<input id="username" validName='0' class="input" type="text" maxlength="100"  name="username" style="margin-bottom:3px;width:200px;"/>
	<span id='msg_username'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li>
 
 <li class="hdccc">
 	<font color = "#ffffff">密码应为英文,数字,特殊字符或几者组合,	不少于六位、不超过十位</font>
 </li>

 
 <li class="lft3" >
 	<font color="#cc0000">*</font>密码：
 </li>
 <li class="rt3">
	<input id="userPassword" class="input" type="password" minlen=6 maxlength="10"  name="userPassword" style="width:200px;"/>
	<span id='msg_userPassword'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 <li class="lft3">
 <font color="#cc0000">*</font>重复密码：
 </li>
 <li class="rt3">
	<input id="pswd2" class="input" type="password" maxlength="10" minlen=6 name="pswd2" repPswd="userPassword"  style="width:200px;"/>
	<span id='msg_pswd2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
  	<li class="hdxxx">
 	<font color = "#ffffff">您可以选择详细信息</font>
 </li>
 
 
 
 <li class="lft3">
 <font color="#cc0000">*</font>用户名：
 </li>
 <li class="rt3">
	<input name="realName" minlen=2 class="input" id="realName" maxlength="1000" type="text" style="width:200px;">
	<span id='msg_realName'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="hidden" name="branchId" value="9" />
 </li> 
 
 
 <li class="lft3">
 电子邮件：
 </li>
 <li class="rt3">
	<input name="email"  class="input" id="email" maxlength="100" type="text" style="width:200px;">
	<span id='msg_email'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
 
  <li class="hdccc">
 	<font color = "#ffffff">请正确填写您的手机号码 格式如:13612345636</font>
 </li>

  
   <li class="lft3">
 联系人：
 </li>
 <li class="rt3">
	<input name="connect_name"  class="input" id="connect_name" value=""   maxlength="18" type="text"  style="width:200px;">
	<span id='msg_connect_name'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 
  <li class="lft3">
  邮编：
 </li>
 <li class="rt3">
	<input name="c_mail"  class="input" id="c_mail" value=""    maxlength="18" type="text"  style="width:200px;">
	<span id='msg_c_mail'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
  
  
  
 <li class="lft3">
手机：
 </li>
 <li class="rt3">
	<input name="mobile"  class="input" id="mobile" value=""    mobile='1' maxlength="11" type="text"  style="width:200px;">
	<span id='msg_mobile'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 


 <li class="hdccc">
 	<font color = "#ffffff">请正确填写您的固定电话号码如:010-12345678</font>
 </li>

 
          
 <li class="lft3">
座机：
 </li>
 <li class="rt3">
	<input name="phone" class="input" id="phone" value=""  maxlength="22" type="text"  style="width:200px;">
	<span id='msg_phone'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
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
</div>
 

</body>
</html>