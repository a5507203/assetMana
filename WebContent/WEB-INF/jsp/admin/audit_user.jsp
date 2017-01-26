<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>

<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>

<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
		
<body class="tz_body2">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="tz_mainbody2" style="height:450px;">
<!--注册条款 -->
<div class ="tz_center_content">
<div class="tz_right_content">

<img src="${ctx}images/user_mg.gif"  />				

	<div class="tz_box" style="height:450px;">
	 <a onClick="openthewindow2('${ctx}admin/switch_register.form','1')" style="cursor: pointer;"><img src="${ctx}images/add_uer.jpg" ></a>
<form name="frmNew" method="POST" action="${ctx}admin/auditUserPost.form" onsubmit="return false;">
	<input type="hidden" name="mbId" value=""></input>
	<input type="hidden" name="status" value=""></input>
 
</form>
  <div style="width:770px;height:400px;">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="16%">
       <col width="10%">
       <col width="12%">
       <col width="15%">
       <col width="8%">
       <col width="12%">
       <col width="8%">
     </COLGROUP>
     <thead>
 
      <tr bgcolor="#E6F5FA">
       <th>用户别名</th>
       <th>登录名</th>
       <th>座机</th>
       <th>电子邮件地址</th>
        <th>编辑</th>
       <th>密码重置</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${list}" varStatus="st" var="mb">
 
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	      
	      	<td>${mb.realName}</td>
	       <td><a href="${ctx}admin/register.form?sId=${mb.id}">${mb.username}</a></td>

	       <td>${mb.phone}</td>
	       <td>${mb.email}</td>
	             <td><a style="cursor:pointer" onClick="openthewindow('${ctx}admin/register.form?sId=${mb.id}','${mb.id}')">编辑 </a></td>
	       <td><a style="cursor:pointer" rsid='${mb.id}'>重置</a></td>
	       <td><a style="cursor:pointer" did='${mb.id}'>删除</a></td>
       </tr>

     </c:forEach>
     </tbody>
   </table>
   </div>
</div>
</div> <!-- end of right -->
</div>

</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>