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
     
 
			
			

<form name="frmNew" msgModal='label' method="POST" validate='true'  action="${ctx}admin/branchInfoPost.form">
<input type="hidden" name="id" value="${br.id}" />
	<div class="tz_box" style="height:550px;">
<ul>
 <li>
  	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">
 <a href="${ctx}index.htm">首页</a>
&gt;
<a href="${ctx}admin/auditUser.form">单位管理</a>&gt;
 <a href="${ctx}admin/branchList.form">下级单位管理</a>&gt;添加新单位
 </td>
 </tr>
 </table> 

<c:if test="${!empty br}">编辑单位</c:if>
 </li>
 
 <li 	 style="text-align: right;">
 	<a href="${ctx}admin/branchList.form"><img   src="${ctx}imag66/b_return.jpg" border="0"></a>
 </li> 
 
 	<li class="hdxxx">
 	<font color = "#ffffff">请填写单位信息(前面加 * 的为必填项)</font>
 </li>
 
 <li class="hd">
 	&nbsp;
 </li>
 
	<li class="hdccc">
 	<font color = "#ffffff">单位名称不可重复,如果检查不通过，请重新命名</font>
 </li>

 <li class="lft3" >
 <font color="#cc0000">*</font>单位名称：
 </li>
 <li class="rt3" >
	<input id="name" validShopName='${br.id}' value="${br.name}" class="input" type="text" minlen="1" maxlength="10"  name="name" style="margin-bottom:3px;width:200px;"/>
	<span id='msg_name'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li>

 
 <li class="lft3">
联系人：
 </li>
 <li class="rt3">
	<input name="contact"  class="input" id="contact" style="width:200px;" value="${br.contact}"   maxlength="5" type="text">
	<span id='msg_contact'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li>
<li class="lft3">
 <font color="#cc0000">*</font>所属省份：
 </li>
 <li class="rt3">
	<select name="provinceId" id="provinceId" class="input" style="width:200px;" minlen="1" size=1>
	  <option value=''>请选择</option>
	  <code:codeList codeTable="B_PROVINCE" value="${br.provinceId}"/>
	</select>
	<span id='msg_provinceId'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 地址：
 </li>
 <li class="rt3">
	<input name="postAddress" class="input" id="postAddress"  value="${br.postAddress}"  maxlength="100" type="text" style="width:200px;">
	<span id='msg_postAddress'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 邮政编码：
 </li>
 <li class="rt3">
	<input name="postalcode"  number='1' class="input" id="postalcode"  value="${br.postalcode}" maxlength="6" type="text" style="width:200px;">
	<span id='msg_postalCode'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li>
 
 <li class="hdccc">
 	<font color = "#ffffff">请正确填写您的传真和固定电话号码，格式如:010-12345678</font>
 </li>
  
 <li class="lft3">
 电话：
 </li>
 <li class="rt3">
	<input name="phone" class="input" id="phone"   maxlength="12" value="${br.phone}"  type="text" style="width:200px;">
	<span id='msg_phone'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 传真：
 </li>
 <li class="rt3">
	<input name="fax" class="input" id="fax" value="${br.fax}"  maxlength="12"  type="text" style="width:200px;">
	<span id='msg_fax'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
	&nbsp;
 </li>

         	<li class="hdxxx">
 	<input id="miSubmit" name="Submit2" value=" 提交 "  type="button" class="button">
 	<input id="goback" class="button"  onclick="window.location='${ctx}admin/branchList.form';" name="goback" value=" 返回 "  type="button">
 </li>            

 </ul>
 	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">&nbsp;</td>
 		 </tr>
 		 	
 	</table>
 
</div>
</form>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>