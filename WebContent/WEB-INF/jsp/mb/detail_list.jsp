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
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="f_detail"/></jsp:include>
<div class="mainbody" style="height:990px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 -->
<div class="newreg" style="height:980px; overflow: auto; ">
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
资源明细</td>
 		 </tr>
 		 	
 	</table>

 </li>
 </ul>

   
<div style="width:700px;height:890px;overflow:scroll;float:left">
					  
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
		   </div>


</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>