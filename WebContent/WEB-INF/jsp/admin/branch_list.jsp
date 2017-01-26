<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}css/toggleElements3.css" />
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}js/jquery-latest.pack.js"></script>
<script type="text/javascript" src="${ctx}js/jquery.toggleElements.pack.js"></script>




<script type="text/javascript">
	$(document).ready(function(){
		
		$('div.tyy').toggleElements( { fxAnimation:'show', fxSpeed:'slow', className:'toggler3' } );
		
	});
	

</script>

		
<body class="tz_body2">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="tz_mainbody2" style="height:550px;">
<!--注册条款 -->
<div class ="tz_center_content">
<div class="tz_right_content">
     
 
			
			
	<div class="tz_box" style="height:550px;">
 <ul>
 <li class="hd" style="text-align: left">

 <a href="${ctx}admin/branchInfo.form"><img src="${ctx}imag66/add_new_company.jpg" border="0"></a>
 <a href="${ctx}admin/auditUser.form"><img src="${ctx}imag66/return.jpg" border="0"></a>

 </li>
  <li class="hdxxx">现有单位列表</li>
 </ul>
   <div style="width:780px;height:${fn:length(branchList)*50+160}px;overflow: auto;float:left">
   <table id="user_list"  style="width:650px;" cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="10%">
       <col width="10%">
       <col width="10%">
       <col width="15%">
       <col width="10%">
       <col width="10%">
       <col width="10%">
       <col width="8%">
       <col width="8%">
     </COLGROUP>
     <thead>
      <tr bgcolor="#E6F5FA">
       <th>所属省份</th>
       <th>单位名称</th>
       <th>联系人</th>
       <th>地址</th>
       <th>邮编</th>
       <th>分店电话</th>
       <th>传真</th>
       <th>编辑</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${branchList}" varStatus="st" var="br">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td ><code:codeList codeTable="B_PROVINCE" codeId="${br.provinceId}"></code:codeList></td>
	       <td >${br.name}</td>
	       <td >${br.contact}</td>
	       <td >${br.postAddress}</td>
	       <td >${br.postalcode}</td>
	       <td >${br.phone}</td>
	       <td >${br.fax}</td>
	       <td ><a href="${ctx}admin/branchInfo.form?sId=${br.id}">编辑</a></td>
	       <td ><a href="${ctx}admin/delBranchInfo.form?sId=${br.id}">删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>