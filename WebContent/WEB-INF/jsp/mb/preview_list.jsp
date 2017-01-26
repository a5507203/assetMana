<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>

<body class ="body_user" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<form name="frmNew" method="POST" action="${ctx}mb/packPost.form" onSubmit="return false;">


<div class ="user_body">


<TABLE WIDTH=1000 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<jsp:include page="/WEB-INF/jsp/user_header.jsp"></jsp:include>
	<TR>
		<TD><jsp:include page="/WEB-INF/jsp/user_left.jsp"></jsp:include></TD>
		<TD COLSPAN=6 valign="top">
		<div class ="tee_right">
		
			<IMG SRC="${ctx}imag88/detail_app.jpg" ALT="">	
			
		<div style="width:700px;height:500px;overflow:scroll;float:left">
					  
					  <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
		     <COLGROUP>
		       <col width="20%">
		       <col width="20%">
		       <col width="20%">
		       <col width="20%">
	
		     </COLGROUP>
		     <thead>
		      <tr bgcolor="#E6F5FA">
		       <th>车辆图片</th>
		       <th>&nbsp;&nbsp;车辆(${fn:length(serviceList)}件)</th>
		       <th>申请时间</th>
		       <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详情</th>

		      </tr>
		     </thead>
		     <tbody>
		     <c:forEach items="${serviceList}" varStatus="st" var="app">
		       <c:set scope="request" var="svc" value="${app}"></c:set>
		       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
			       <td class='al_center'><img class="little_img" src='${ctx}${app.resImgPath}'></img></td>
			       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
			       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			       	<td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">查看详情</a></td>
	
		       </tr>
		       		     
		     </c:forEach>

		     </tbody>

		   </table>
					  <div style="background-color:#99ff66; height:18px;font-size:12px;text-align:center;width:620px;margin-left:30px;">
所申请的车辆价格为${p_svc}(人民币:元)整
			</div>
					  
					  <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
			     <COLGROUP>
			       <col width="20%">
			       <col width="20%">
			       <col width="20%">
			       <col width="20%">
		
			
			     </COLGROUP>
			     <thead>
			      <tr bgcolor="#E6F5FA">
			       <th>设备图片</th>
			      <th>&nbsp;&nbsp;设备(${fn:length(devList)}件)</th>
		       <th>申请时间</th>
		       <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详情</th>
	
			      </tr>
			     </thead>
			     <tbody>
			     <c:forEach items="${devList}" varStatus="st" var="app">
			       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
				       <td class='al_center'><img class="little_img" src='${ctx}${app.resImgPath}'></img></td>
				       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
				       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">查看详情</a></td>			  
			       </tr>
			     
			     </c:forEach>
			     </tbody>
			   </table>
					  <div style="background-color:#99ff66; height:18px;font-size:12px;text-align:center;width:620px;margin-left:30px;">
共申请设备${n_dev}件,所申请设备合计${p_dev}(人民币:元)整
			</div>
					   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
					<COLGROUP>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
		
	
					</COLGROUP>

					<thead>
					 <tr bgcolor="#E6F5FA">
					  <th>产品图片</th>
			    <th>&nbsp;&nbsp;产品(${fn:length(pdList)}件)</th>
		       <th>申请时间</th>
		       <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详情</th>
	
					 </tr>
					</thead>
					<tbody>
					<c:forEach items="${pdList}" varStatus="st" var="app">
					<tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
					<td class='al_center'><img class="little_img" src='${ctx}${app.resImgPath}'></img></td>
					<td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
					<td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						<td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">查看详情</a></td>
				
					</tr>
					</c:forEach>
					  </tbody>
					</table>
					
				<div style="background-color:#99ff66; height:18px;font-size:12px;text-align:center;width:620px;margin-left:30px;">
				共申请产品${n_pd}件,所申请产品合计${p_pd}(人民币:元)整
							</div>
							<br>
										  <div style="background-color:#ffcc33; height:18px;font-size:12px;text-align:center;width:620px;margin-left:30px;">
    本次所申请共需费用为${p_total} (人民币:元)整
			</div>
		   </div>
		
		
			<div style="width:700px;overflow:hidden;float:top;text-align:center;">
 			<center>
			<table align="center" width="45%">
			<tr>
			<td><a id = "theLink_save" onClick="cur_save();"></a></td>
			<td ><a id = "theLink_finish"  onClick="goodwill();"></a></td>
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

<script language="JavaScript" type="text/javascript">
  function goodwill(){
		     var me$ = $(this);
		     document.frmNew.method="POST";
	         document.frmNew.action = "${ctx}mb/packPost.form";
	         document.frmNew.submit();
		  };
 function cur_save(){
	 openthewindow("${ctx}mb/previewList.form?mbId=999999",'cur_save');
			  };
</script>


</html>