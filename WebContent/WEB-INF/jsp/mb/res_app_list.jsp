<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="f_apply"/></jsp:include>
<div class="mainbody" style="height:1180px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 -->
<div class="newreg" style="height:1110px; overflow: auto; ">
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
<ul><li>
 <table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页</a>&gt;
资源申请</td>
 		 </tr>
 		 	
 	</table>

 </li>
 </ul>
 <c:if test="${empty aprovedService}">
 <ul>
 <li class="hd" style="text-align: left">
 	<a href="${ctx}mb/resAppInfo.form?sTp=1"><img src="${ctx}imag66/app_car.jpg"></a>&nbsp;&nbsp;
	未审核(${fn:length(serviceList)})&nbsp;&nbsp;
 </li>
 </ul>
   <div style="width:720px;height:${fn:length(serviceList)*100+160}px;overflow:scroll;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="20%">
       <col width="20%">
       <col width="15%">
       <col width="15%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
       <img src="${ctx}imag33/very-big.jpg">
     <thead>
      <tr bgcolor="#E6F5FA">
       <th>服务图片</th>
       <th>标题</th>
       <th>申请状态</th>
       <th>申请时间</th>
       <th>查看</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${serviceList}" varStatus="st" var="app">
       <c:set scope="request" var="svc" value="${app}"></c:set>
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}"><img class="little_img" src='${ctx}${app.resImgPath}'></img></a></td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}">${app.resName}[${app.orderNum}套]</a></td>
	       <td class='al_center'><code:codeList codeTable="B_RES_APP_STATUS" codeId="${app.auditStatus}"></code:codeList></td>
	       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	       	<td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}">详情</a></td>
	       <td class='al_center'><a href="${ctx}mb/resAppDel.form?sId=${app.id}&sTp=1">删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
 </c:if>
 <c:if test="${!empty aprovedService}">
  <div style="width:500px;height:150px;text-align: center;">
     <div>
       您已申请的服务<br />
       <a href="${ctx}mb/resView.form?sId=${aprovedService.resId}&sTp=${aprovedService.resType}">
       <img class="little_img" src='${ctx}${aprovedService.resImgPath}'></img>
       </a><br />
      ${aprovedService.resName}
     </div>  
  </div>
 </c:if>
  <ul>
 <li class="hd" style="text-align: left">
 	<a href="${ctx}mb/resAppInfo.form?sTp=2"><img src="${ctx}imag66/app_device.jpg"></a>&nbsp;&nbsp;
	未审核(${fn:length(devList)})&nbsp;&nbsp;
 </li>
 </ul>
  <div style="width:720px;height:${fn:length(devList)*100+160}px;overflow:scroll;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="20%">
       <col width="20%">
       <col width="15%">
       <col width="15%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
       <img src="${ctx}imag33/very-big.jpg">
     <thead>
      <tr bgcolor="#E6F5FA">
       <th>设备图片</th>
       <th>标题</th>
       <th>申请状态</th>
       <th>申请时间</th>
       <th>查看</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${devList}" varStatus="st" var="app">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}"><img class="little_img" src='${ctx}${app.resImgPath}'></img></a></td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}">${app.resName}[${app.orderNum}套]</a></td>
	       <td class='al_center'><code:codeList codeTable="B_RES_APP_STATUS" codeId="${app.auditStatus}"></code:codeList></td>
	       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
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
<ul>
 <li class="hd" style="text-align: left">
 <c:if test="${!empty aprovedService}">
	<a href="${ctx}mb/resAppInfo.form?sTp=3&svcId=${aprovedService.resId}"><img src="${ctx}imag66/app_product.jpg"></a>&nbsp;&nbsp;
	未审核(${fn:length(pdList)})&nbsp;&nbsp;
 </c:if>
 <c:if test="${empty aprovedService and !empty serviceList}">
<a href="${ctx}mb/resAppInfo.form?sTp=3&svcId=${svc.resId}"><img src="${ctx}imag66/app_product.jpg"></a>&nbsp;&nbsp;
	未审核(${fn:length(pdList)})&nbsp;&nbsp;
 </c:if>
 </li>
 </ul>
  <div style="width:720px;height:598px;overflow:scroll;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
      <COLGROUP>
      <col width="20%">
       <col width="20%">
       <col width="15%">
       <col width="15%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
       <img src="${ctx}imag33/very-big.jpg">
     <thead>
      <tr bgcolor="#E6F5FA">
       <th>产品图片</th>
       <th>标题</th>
       <th>申请状态</th>
       <th>申请时间</th>
       <th>查看</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${pdList}" varStatus="st" var="app">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}"><img class="little_img" src='${ctx}${app.resImgPath}'></img></a></td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}">${app.resName}[${app.orderNum}套]</a></td>
	       <td class='al_center'><code:codeList codeTable="B_RES_APP_STATUS" codeId="${app.auditStatus}"></code:codeList></td>
	       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	       	<td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}">详情</a></td>
		   <td class='al_center'><a href="${ctx}mb/resAppDel.form?sId=${app.id}&sTp=3">删除</a></td>
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