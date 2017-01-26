<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% response.setContentType("application/msword;charset=GBK"); %>
<% response.setHeader("Content-Disposition","attachment;filename="+"cur_safe_new"+".doc");  %>
<html>
<% 
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
 %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head >
<base href="<%=basePath%>" >

</head>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>



<body   LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<center>

<div style="font-size:12px;overflow:auto;">

	<IMG width=600  SRC="${ctx}imag88/save_title.jpg" >	
		
			 
			<br>
		<div style="width:620px;height:900px;overflow:auto;float:left;">
	
			 <table id="user_list" style="width:620px; font-size:15px;" cellspacing="0" cellpadding="0" border="1" bordercolor="#000000">
		     <COLGROUP>
		     		 
				<col width="250px">
				<col width="250px">

		     </COLGROUP>
		     <thead style="height:30px;">
		      <tr bgcolor="#E6F5FA">
		 
		       <th>车辆(${fn:length(serviceList)}件)</th>
		       <th>申请时间</th>
	
		      
		      </tr>
		     </thead>
		     <tbody>
		     <c:forEach items="${serviceList}" varStatus="st" var="app">
		       <c:set scope="request" var="svc" value="${app}"></c:set>
		       <tr  <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
			       
			       <td align ="center"><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
			       <td align ="center"><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			      
			       
		       </tr>
		     </c:forEach>
		     </tbody>
		   </table>
					  <br><br>
				
					  <table id="user_list" style="width:620px; font-size:15px;" cellspacing="0" cellpadding="0"  border="1" bordercolor="#000000">
				
			     <COLGROUP>

			  		     		<col width="120px">
				<col width="250px">
				<col width="250px">

			       
			
			     </COLGROUP>
			       
			     <thead style="height:30px;">
			      <tr bgcolor="#E6F5FA">
			    
			      <th>设备(${fn:length(devList)}件)</th>
		       <th>申请时间</th>

		      
			      </tr>
			     </thead>
			     <tbody>
			 
			     <c:forEach items="${devList}" varStatus="st" var="app">
			       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
				       
				       <td align ="center"><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
				       <td align ="center"><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			
			       </tr>
			     </c:forEach>
			     </tbody>
			   </table>
					  <br><br>
					  		
					   <table id="user_list" style="width:620px;font-size:15px;"  cellspacing="0" cellpadding="0" border="1" bordercolor="#000000">
					<COLGROUP>
							     		<col width="120px">
				<col width="250px">
				<col width="250px">
					
	
					</COLGROUP>

					<thead style="height:30px;">
					 <tr bgcolor="#E6F5FA">
				 
			    <th>产品(${fn:length(pdList)}件)</th>
		       <th>申请时间</th>
		   
					 </tr>
					</thead>
					<tbody>
					<c:forEach items="${pdList}" varStatus="st" var="app">
					<tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
					 
					<td align ="center"><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
					<td align ="center"><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
							
					</tr>
					</c:forEach>
					  </tbody>
					</table>
		   </div>
<br>
 	<br>
		 	<IMG width=720  SRC="${ctx}imag88/save_bottom.jpg" >	

   </div>

</center>

</body>



</html>