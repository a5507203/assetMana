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

<input type="hidden" name="id" value="${mb.id}"> 
<input value="${mb.realName}" name="realName" type="hidden">

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
		<TD >
							<a id = "theLink_b4" mid='z_password' href='${ctx}mb/new_password.form'></a></TD>
		<TD COLSPAN=2 ROWSPAN=2>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_06.jpg" width="228" height="461"  ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=5>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_07.jpg" width="447" height="403" ALT=""></TD>
	</TR>
	<TR>
		<TD ROWSPAN=3>
						<jsp:include page="/WEB-INF/jsp/user_left.jsp"></jsp:include></TD>
		<TD COLSPAN=7  WIDTH=658 HEIGHT=210></TD>
		<TD ROWSPAN=3 WIDTH=146 HEIGHT=601 ></TD>
	</TR>
	<TR>
		<TD COLSPAN=2  WIDTH=184 HEIGHT=83 ></TD>
		<TD COLSPAN=3 WIDTH=275 HEIGHT=83>
		<script type="text/javascript"> 
		
		if(${already} == 1)	
			document.write("<a id = 'theLink_reApp' mid='z_resource' onClick='b_confirm()'  style='cursor:pointer;'></a>");
		else if(${already} == 2)
			document.write("<IMG SRC='${ctx}imag88/end_NEW_USER_INDEX_APP_12.jpg'>");
				 
		else
			document.write("<a id = 'theLink_app' mid='z_resource' href='${ctx}mb/step_resAppInfo.form?sTp=1'></a>");  		
		</script>


		</TD>
		<TD COLSPAN=2  WIDTH=199 HEIGHT=83>
</TD>
	</TR>
	<TR>
		<TD COLSPAN=2  WIDTH=184 HEIGHT=308></TD>
		<TD COLSPAN=5>
			<IMG SRC="${ctx}imag10/NEW_USER_INDEX_APP_15.jpg" WIDTH=474 HEIGHT=308 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=9 WIDTH=1000 HEIGHT=83 ><IMG SRC="${ctx}imag88/NEW_USER_INDEX_10.jpg" WIDTH=1000 HEIGHT=83 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=196 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=123 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=61 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=48 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=115 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=112 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=111 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=88 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag10/spacer.gif" WIDTH=146 HEIGHT=1 ALT=""></TD>
	</TR>
</TABLE>

</div>
<script  type="text/javascript">
function b_confirm()
{ 
	if(confirm("重新申请会删除上次记录,确定重新申请吗？"))
	{
		location.href='${ctx}mb/packAllDel.form';

	}else{
	return;
	}

} 
</script>
</body>




</html>