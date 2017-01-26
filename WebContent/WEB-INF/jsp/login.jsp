<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<style type="text/css">
<!--
.STYLE7 {
	font-size: small
}
-->
</style>
</head>

<body bgcolor=3A6EA5>
<center>
<div style='height: 100px;'></div>
<!--
<c:if test="${!empty param.err}">
	<div id="effect">
	<h3>错误信息</h3>
	<p><c:if test="${param.err eq '1'}">验证码输入错误！</c:if> <c:if
		test="${param.err eq '2'}">用户名或密码输入错误！</c:if> <c:if
		test="${param.jforum_redirect}">${param.error}</c:if> <c:if
		test="${param.err eq 'sys_turnoff'}">系统暂停申请</c:if></p>
	</div>
	<script>
	  $("#effect").show(500, function(){
		  	window.setTimeout('$("#effect").hide()', 2000);
		  }
	  );
	</script>
</c:if>
 -->
<form action="${ctx}mb/login.form" method="post" id="loginFrm">

<table width="761" border="0" cellspacing="0" cellpadding="0"
	align="center">
	<tr>
		<td width="761" height="122" background="${ctx}images/login_main_01.gif"></td>
	</tr>
	<tr>
		<td height="170" background="${ctx}images/login_main_02.gif">&nbsp;</td>
	</tr>
	<tr>
		<td height="145" background="${ctx}images/login_main_03.gif"
			valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="height: 147px">
			<tr>
				<td width="43%" height="45">&nbsp;</td>
				<td width="52%" align="right"><marquee direction="left"
					onMouseOver="this.stop();" onMouseOut="this.start();" width="330"
					scrollamount="2"> </marquee></td>
				<td width="5%">&nbsp;</td>
			</tr>
			<tr>
				<td height="50">&nbsp;</td>
				<td>
				<table width="100%" border="0" cellspacing="3" cellpadding="0"
					class=fontBlack>
					<tr>
						<td width="17%" height="32">用户名：</td>
						<td width="27%"><input name="username" id="logname"
							type="text" tabIndex='1' class="username" size="12"
							maxlength="15" /></td>
						<td width="17%" align="right">密码：&nbsp;</td>
						<td width="39%"><input name="password" id="password"
							type="password" tabIndex='2' class="password" size="12" /></td>
					</tr>
					<tr>
						<td height="25"><img id="validImg" title="看不清楚,点击图片刷新"
							alt="看不清楚,点击图片刷新" src="${ctx}mb/validatorCode.form"
							style="cursor: pointer; vertical-align: bottom;" />&nbsp;</td>
						<td height="25"><input name="validator" id="validator"
							type="text" tabindex='3' class="validator"
							width="72px" value="请输入验证码" size="12" /></td>
						<td height="25" align="right">
							<a id="btnLogin" tabIndex='4' style="cursor: pointer;">
								<img src="${ctx}images/login.gif"></img>
							</a>
						</td>
						<td></td>
					</tr>
				</table>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="32">&nbsp;</td>
				<td colspan="2" valign=bottom align=right class=fontWhite>CopyRight
				&copy;2010 sunlight All Rights Reserved&nbsp;&nbsp;&nbsp;&nbsp;<br>
				<br>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
 
</center>
</body>

</html>
