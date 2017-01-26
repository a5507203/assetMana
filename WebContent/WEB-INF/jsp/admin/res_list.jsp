<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<body>
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="mainbody" style="height:1000px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid2">
<!--注册条款 -->
<div class="newreg" style="height:850px;">
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
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页&gt;
资源管理</a></td>
 		 </tr>
 		 	
 	</table>

 </li>
 </ul>
 <ul >
 <li class="hd" style="text-align: left">
	<a onClick="openthewindow('${ctx}admin/serviceInfo.form','add_service')"  style="cursor:pointer;"><img src="${ctx}imag66/add_car.jpg"></a>&nbsp;&nbsp;
 </li>
 </ul>

   <div style="width:650px;height:${fn:length(serviceList)*30+100}px;overflow: auto;float:left">
   
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="35%">
       <col width="45%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
     <thead>
  <img src="${ctx}imag33/very-big.jpg">

      <tr bgcolor="#E6F5FA">
       <th>车辆名</th>
       <th>价格</th>
       <th>编辑</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
  	
     <c:forEach items="${serviceList}" varStatus="st" var="serv">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td>${serv.name}</td>
	       <td>${serv.refPrice}</td>
	       <td class='al_center'><a onClick="openthewindow('${ctx}admin/serviceInfo.form?sId=${serv.id}','add_service')"  style="cursor:pointer;">编辑</a></td>
	       <td class='al_center'><a style="cursor:pointer" href="${ctx}admin/delServiceInfo.form?sId=${serv.id}">删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
  <ul>
 <li class="hd" style="text-align: left">
	<a onClick="openthewindow('${ctx}admin/deviceInfo.form','add_device')"  style="cursor:pointer;"><img src="${ctx}imag66/add_device.jpg"></a>&nbsp;&nbsp;
 </li>
 </ul>
  <div style="width:650px;height:${fn:length(devList)*30+100}px;overflow: auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="30%">
       <col width="30%">
       <col width="20%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
     <thead>
     	  <img src="${ctx}imag33/very-big.jpg">
      <tr bgcolor="#E6F5FA">
       <th>设备名</th>
       <th>设备类型</th>
       <th>价格</th>
       <th>编辑</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${devList}" varStatus="st" var="dev">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td><a href="${ctx}admin/deviceInfo.form?sId=${dev.id}">${dev.name}</a></td>
	       <td><code:codeList codeTable="b_dev_type" codeId="${dev.devType}"></code:codeList> </td>
	       <td>${dev.refPrice}</td>
	       <td class='al_center'><a onClick="openthewindow('${ctx}admin/deviceInfo.form?sId=${dev.id}','add_device')"  style="cursor:pointer;">编辑</a></td>
	       <td class='al_center'><a href="${ctx}admin/delDeviceInfo.form?sId=${dev.id}">删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
<ul>
 <li class="hd" style="text-align: left">
	<a onClick="openthewindow('${ctx}admin/productInfo.form','add_product')"  style="cursor:pointer;"><img src="${ctx}imag66/add_product.jpg"></a>
 </li>
 </ul>
  <div style="width:650px;height:500px;overflow: auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="30%">
       <col width="30%">
       <col width="20%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
     <thead>
     	  <img src="${ctx}imag33/very-big.jpg">
      <tr bgcolor="#E6F5FA">
       <th>展品名</th>
       <th>展品类型</th>
       <th>价格</th>
       <th>编辑</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${pdList}" varStatus="st" var="pd">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td><a href="${ctx}admin/productInfo.form?sId=${pd.id}">${pd.name}</a></td>
	       <td>${pd.servTpName}</td>
	         <td>${pd.refPrice}</td>
	       <td class='al_center'><a onClick="openthewindow('${ctx}admin/productInfo.form?sId=${pd.id}','add_product')"  style="cursor:pointer;">编辑</a></td>
	       <td class='al_center'><a href="${ctx}admin/delPdInfo.form?sId=${pd.id}">删除</a></td>
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