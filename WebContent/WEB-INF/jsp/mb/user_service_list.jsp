<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/mb/res_app_info.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<body>
<body class ="body_user" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

<form name="frmNew" method="POST" action="${ctx}mb/step_new_resAppInfoPost.form">
<input type="hidden" name="resType" value="${param.sTp}"></input>
<div class ="user_body">


<TABLE WIDTH=1000 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<jsp:include page="/WEB-INF/jsp/user_header.jsp"></jsp:include>
	<TR>
		<TD><jsp:include page="/WEB-INF/jsp/user_left.jsp"></jsp:include></TD>
		<TD COLSPAN=6 valign="top">
		<div class ="tee_right">
		
			<IMG SRC="${ctx}imag88/service_app.jpg" ALT="">	
			

		 <div style="width:710px;height:498px;overflow: scroll;float:left">
		   <table id="user_list"  cellspacing="0" cellpadding="0" border="0" align="center">
		     <COLGROUP>
		       <col width="15%">
		       <col width="15%">
		       <col width="18%">
		      <col width="15%">
		       <col width="15%">
		       <col width="15%">
		     </COLGROUP>
		  
		     <thead>
		      <tr bgcolor="#E6F5FA">
		       <th><input type="checkbox" id="ckAll"></input></th>
		       <th>车辆图片</th>
		       <th>名称</th>
		       <th>申请套数</th>
		       <th>创建时间</th>
		        <th>查看详情</th>
		      </tr>
		     </thead>
		     <tbody>
		     <c:forEach items="${resAppList}" varStatus="st" var="app">
		       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
			       <td class='al_center'><input name="resIds" type="checkbox" value="${app.id}" restp='${param.sTp}'></input>
			       </td>
			       <td class='al_center'><img class="little_img" src='${ctx}${app.imgPath1}'></img></td>
			       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.id}&sTp=${param.sTp}','${app.id}')" style="cursor:pointer;">${app.name}</a></td>
			       <td class='al_center'>1</td>
			       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.id}&sTp=${param.sTp}','${app.id}')" style="cursor:pointer;" target="_blank">详情</a></td>
		       </tr>
		     </c:forEach>
		     </tbody>
		   </table>
		</div>


		
			<div style="width:700px;overflow:hidden;float:top;text-align:center;">
 			<center>
			<table align="center" width="60%">
			<tr>
			  <!-- <td ><a id = "theLink_add_service" onClick="b_confirm()" style="cursor:pointer;"></a></td> -->
			<td ><a id = 'theLink_next' ></a></td>
			<td><a id = "theLink_stop" href="${ctx}index.htm"></a></td>
			</tr>
			</table>
			</center>
			</div>

   </div></TD>
	</TR>
	<TR>
		<TD COLSPAN=7>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_10.jpg" WIDTH=1000 HEIGHT=83 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=196 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=123 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=109 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=115 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=112 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=111 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=234 HEIGHT=1 ALT=""></TD>
	</TR>
</TABLE>


</div>

</form>
</body>
<script  type="text/javascript">
function b_confirm()
{ 
	if(${fn:length(serviceList)} > 0 )
	{
		alert("您已经添加了一辆大蓬车,目前每帐号只可申请一辆大蓬车");
		return;	
	}
	openthewindow('${ctx}mb/new_resAppInfo.form?sTp=1');

} 

function b_next()
{ 
	if(${fn:length(serviceList)} == 0 )
	{
		alert("您必须添加一辆大蓬车");
		return;	
	}
	location.href="${ctx}mb/user_device_list.form";

} 
</script>
</html>