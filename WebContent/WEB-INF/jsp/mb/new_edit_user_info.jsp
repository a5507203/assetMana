<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/mb/register.js" type="text/javascript"></script>



<body class="tz_body2">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="tz_mainbody2" style="height:350px;">
<!--注册条款 -->
<div class ="tz_center_content" style="height:350px;">
<div class="tz_right_content" style="height:350px;">

<c:if test="${!empty param.succ or !empty param.err}">
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
	<script>
	  $("#effect").show(500,function(){
		  	window.setTimeout('$("#effect").hide()', 5000);
			<c:if test="${'1' eq param.succ}">
 
				alert('你已提交成功！');
			</c:if>


			<c:if test="${'1' eq param.err}">
			//alert('抱歉！提交时错误！');
			</c:if>
		  }
	  );
	</script>
</c:if> 

<img src="${ctx}images/user_mg.gif"  />		
<div class ="tz_box" style="height:350px;">
<form name="frmNew" msgModal='label' method="POST" validate='true' 	action="${ctx}mb/new_editPost.form" enctype="multipart/form-data">
<input type="hidden" name="id" value="${mb.id}"> 
<input value="${mb.realName}" name="realName" type="hidden">
  


		<div class="user_edit_info" style="height:350px;">
		<TABLE BORDER=0 width:620; CELLPADDING=0 CELLSPACING=0 align="center" >
					<tr>
						<td colspan="2" align="center"><font color ="#ff0000" style="font-weight:normal ">请填写您的详细信息(前面加 * 的为必填项)</font></td>
					</tr>
					
					<tr>
						<td height="20" width="90">用户名称：</td>
						<td>${mb.realName}</td>
					</tr>
					
					
					<tr style="visibility:hidden;">
						<td height="0">所属单位：</td>
						<td><select style="visibility:hidden; " name="branchId" id="branchId" class="input" style="width:200px;" id="branchId" minlen="1" size=1>
	  <option value=''>请选择</option>
	  <code:codeList codeTable="b_branch" value="${mb.branchId}"/>
	</select>
	<span id='msg_branchId'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</tr>
					
					
					<tr>
						<td>单位地址：</td>
						<td height="45"><textArea name="descript" class="input" id="descript" maxlen="100" rows="2" cols="20"  style="width:180px;" >${mb.descript}</textArea>
				<span id='msg_realName'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
					</tr>
					
					
							
					<tr>
						<td height="35"><font color="#ff0000">*</font>联系人：</td>
						<td><input value="${mb.connect_name}" name="connect_name"  minlen=1 class="input" id="connect_name" maxlength="18" type="text" style="width:180px; height:20px;">
				<span id='msg_connect_name'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <br></td>
					</tr>
					
					
					
							
					<tr>
						<td height="35"><font color="#ff0000">*</font>邮编：</td>
<td><input value="${mb.c_mail}" name="c_mail" minlen=1 class="input" id="c_mail" maxlength="18" type="text" style="width:180px; height:20px;">
				<span id='msg_c_mail'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <br></td>
					</tr>
					
					
					
					<tr>
						<td height="35"><font color="#ff0000">*</font>电子邮件：</td>
						<td><input value="${mb.email}" name="email" email=1 minlen=1 class="input" id="email" maxlength="100" type="text" style="width:180px; height:20px;">
				<span id='msg_email'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <br></td>
					</tr>
					
					
					<tr>
						<td height="39"><font color="#ff0000">*</font>手机：</td>
						<td><input value="${mb.mobile}" name="mobile"  class="input" id="mobile" value=""  minlen=5  mobile='1'  style="width:180px;height:20px;" maxlength="11" type="text">
						<span id='msg_mobile'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						
					</tr>
					<tr>
						<td></td>
						<td ><font color ="#ff0000" style="font-weight:normal ;font-size:12px;">(正确手机号码 格式如:13612345636)</font>
						</td>
					</tr>		
					
						<tr>
						<td height="39"><font color="#ff0000">*</font>座机：</td>
						<td><input value="${mb.phone}" name="phone" class="input" id="phone" value="" minlen=5  type="text"  style="width:180px;height:20px;">
						<span id='msg_phone'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td ><font color ="#ff0000" style="font-weight:normal ;font-size:12px;">(正确电话号码 格式如:010-12345636)</font>
						</td>
					</tr>	
					
			
			<tr>
			<td colspan =2 align="center" height="20"> 	<input id="miSubmit" name="Submit2" value=" 提交 "  type="button" style="width:200px;"  class="button"></td>
			
			</tr>
				</TABLE>

		
		</div>
		
		
			
	</form>
</div>

</div><!--end of right content-->

</div>

</div>

<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
 
</html>