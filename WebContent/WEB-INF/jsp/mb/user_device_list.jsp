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
		
			<IMG SRC="${ctx}imag88/device_app.jpg" ALT="">	
			
		<div style="width:700px;height:200px;overflow:scroll;float:left">
		<div style="background-color:#3399FF; height:18px;font-size:12px;text-align:center;width:620px;margin-left:30px;">基本设备
			</div>
					   <table id="user_list" style="margin-top:0px;" cellspacing="0" cellpadding="0" border="0">
			     <COLGROUP>
				       <col width="20%">
		       <col width="25%">
		       <col width="25%">
		       <col width="15%">
		       <col width="15%">
			     </COLGROUP>
			     <thead >
			     
			      <tr bgcolor="#E6F5FA">
			       <th>设备图片</th>
			     <th>&nbsp;&nbsp;设备(已添加${fn:length(devList)}件)</th>
					    <th>&nbsp;&nbsp;&nbsp;申请时间</th>
					    <th>&nbsp;详情</th>
					    <th>&nbsp;&nbsp;删除</th>
			      </tr>
			     </thead>
			     <tbody>
			     <c:forEach items="${devList}" varStatus="st" var="app">
			       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
				       <td class='al_center'><img class="little_img" src='${ctx}${app.resImgPath}'></img></td>
				       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
				       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">查看详情</a></td>

					   <td class='al_center'>
					   <c:if test="${empty app.serviceBased or app.serviceBased eq 0}">
					   <a href="${ctx}mb/resAppDel.form?sId=${app.id}&sTp=2">删除</a>
					   </c:if>
					   </td>
			       </tr>
			     </c:forEach>
			     </tbody>
			   </table>
		   </div>  
		 
	
		
		<div style="width:700px;height:300px;overflow:scroll;float:left">
		<div style="background-color:#FFCC33; height:18px;font-size:12px;text-align:center;width:620px;margin-left:30px;">选购设备
			</div>
		
		   <table id="user_list" style="margin-top:0px;" cellspacing="0" cellpadding="0" border="0" align="center">
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
		       <th>设备图片</th>
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
			         <td class='al_center'><input name="orderNums" class='input al_center' onblur ="if(value == '') value='1'; " onkeyup="value=value.replace(/[^\d]/g,'');" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace
(/[^\d]/g,''))"  type="text" value="1" style="width:50px;"></input></td>
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
			<!-- <td ><a id = "theLink_add_device" onClick="openthewindow('${ctx}mb/new_resAppInfo.form?sTp=2')" style="cursor:pointer;"></a></td> -->
			<td ><a id = "theLink_next2" ></a></td>
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
</html>