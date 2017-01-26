<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="rh" scope="request" value="${fn:length(deviceList)*30+100+fn:length(productList)*30+100+fn:length(serviceList)*30+100}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_static"/></jsp:include>
<div class="mainbody" style="height:${rh+300}px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid2">
<!--注册条款 -->
<div class="newreg" style="height:${rh}px;">
<c:if test="${'1' eq param.succ}">
	<div id="effect">
		<h3 ></h3>
		<p>
			恭喜！你的已提交成功！
		</p>
	</div>
	<script>
	  $("#effect").show(500,function(){
		  	window.setTimeout('$("#effect").hide()', 1500);
		  }
	  );
	</script>
</c:if>  
<ul>
 <li>
 	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页</a>&gt;报表查看</td>
 		 </tr>
 	</table>
 </li>
 </ul>
   <div style="width:650px;height:auto;overflow: auto;float:left">
   
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="50%">
       <col width="50%">
     </COLGROUP>
     <thead>
  <img src="${ctx}imag33/very-big.jpg">

      <tr bgcolor="#E6F5FA">
       <th>车辆统计表</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
  	
     <c:forEach items="${serviceList}" varStatus="st" var="serv">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td ><a style="cursor:pointer" title="下载" href="${ctx}xls/service/${serv.name}">${serv.name}</a></td>
	       <td ><a style="cursor:pointer" href="${ctx}admin/delRep.form?sTp=1&sId=${serv.name}">删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
  <div style="width:650px;height:auto;overflow: auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="50%">
       <col width="50%">
     </COLGROUP>
     <thead>
     	  <img src="${ctx}imag33/very-big.jpg">
      <tr bgcolor="#E6F5FA">
       <th>设备统计表</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${deviceList}" varStatus="st" var="dev">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td ><a style="cursor:pointer" title="下载" href="${ctx}xls/device/${dev.name}">${dev.name}</a></td>
	       <td ><a style="cursor:pointer" href="${ctx}admin/delRep.form?sTp=2&sId=${dev.name}">删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
  <div style="width:650px;height:auto;overflow: auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="50%">
       <col width="50%">
     </COLGROUP>
     <thead>
     	  <img src="${ctx}imag33/very-big.jpg">
      <tr bgcolor="#E6F5FA">
       <th>产品统计表</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${productList}" varStatus="st" var="pd">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td ><a style="cursor:pointer" title="下载" href="${ctx}xls/product/${pd.name}">${pd.name}</a></td>
	       <td ><a style="cursor:pointer" href="${ctx}admin/delRep.form?sTp=3&sId=${pd.name}">删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>