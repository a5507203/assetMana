<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/mb/register.js" type="text/javascript"></script>


<body class ="body_user" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

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
		  	window.setTimeout('$("#effect").hide()', 1500);
		  }
	  );
	</script>
</c:if> 


<div class ="user_body">
<form name="frmNew" id="frmNew"   msgModal='label' method="POST" validate='true'  action="${ctx}mb/new_passwordPost.form">

  
<TABLE WIDTH=1000 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=2 ROWSPAN=2>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_01.jpg" width="325" height="461"  ALT=""></TD>
		<TD COLSPAN=2>
						<a id = "theLink_b1" mid='index' href="${ctx}index.htm"></a></TD>
		<TD>
				<a id = "theLink_b2" mid='z_resource' href='${ctx}mb/new_editRegInfo.form'></a></TD>
		<TD>
				<a id = "theLink_b3" mid='z_process' href='${ctx}mb/process.form'></a></TD>
		<TD COLSPAN=2>
							<a id = "theLink_b4" mid='z_password' href='${ctx}mb/new_password.form'></a></TD>
		<TD COLSPAN=2 ROWSPAN=2>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_06.jpg" width="228" height="461"  ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=6>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_07.jpg" width="447" height="403" ALT=""></TD>
	</TR>
	<TR>
		<TD ROWSPAN=3>
			<jsp:include page="/WEB-INF/jsp/user_left.jsp"></jsp:include></TD>
		<TD COLSPAN=8 WIDTH=658 HEIGHT=72>
		 <IMG SRC="${ctx}imag88/index_top.jpg" ALT=""></TD>
		<TD ROWSPAN=3  WIDTH=146 HEIGHT=601 ></TD>
	</TR>
	<TR>
		<TD COLSPAN=2 WIDTH=160 HEIGHT=472></TD>
		<TD COLSPAN=4 WIDTH=321 HEIGHT=472 >
		<div class="user_edit_info">
		<br><br><br><br><br><br>
		<table width="310">
 		<tr>
 			<td  bgcolor="#DEE9ED" height="22">旧密码验证</td>
 		 </tr>
		 <tr><td height="50"> 请您输入旧密码:&nbsp<input name="oldPswd" id="oldPswd" class="input" type="password"  maxlength="20" >
<span id='msg_oldPswd'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><font class='notice'>${errMsg}</font></td></tr>
		<tr>
 			<td bgcolor="#DEE9ED" height="22">设置新密码</td>
 		 </tr>
		 <tr><td height="30">请您输入新密码:&nbsp;<input name="newPswd" id="newPswd" class="input" type="password" minlen=6 maxlength="20" >
		<span id='msg_newPswd'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td></tr>
		 <tr ><td height="30">再次输入新密码:&nbsp;<input name="newPswd2" id="newPswd2"  class="input" type="password" minlen=6 maxlength="20" repPswd="newPswd">
		<span id='msg_newPswd2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td></tr> 
 		 	
</table>

		
<table >
 		<tr bgcolor="#DEE9ED">
 			<td align="center"width="310"  height="22"><input id="miSubmit" name="Submit2" value=" 确认提交 "  type="button" class="button"></td>
 		 </tr>
 		 	
 	</table>
		</div>
		
		
			</TD>
		<TD COLSPAN=2 ROWSPAN=2>
			<IMG SRC="${ctx}imag99/NEW_USER_INDEX_info_13.jpg" WIDTH=177 HEIGHT=529 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=6>
			<IMG SRC="${ctx}imag99/NEW_USER_INDEX_info_14.jpg" WIDTH=481 HEIGHT=57 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=10>
			<IMG SRC="${ctx}imag99/NEW_USER_INDEX_info_15.jpg" WIDTH=1000 HEIGHT=83 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=196 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=123 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=37 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=72 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=115 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=112 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=22 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=89 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=88 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag99/spacer.gif" WIDTH=146 HEIGHT=1 ALT=""></TD>
	</TR>
</TABLE>
	</form>
</div>


</body>




</html>