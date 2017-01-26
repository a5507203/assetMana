<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_user"/></jsp:include>
<div class="mainbody" style="height:1000px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid2">
<!--注册条款 -->
<div class="newreg">
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
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页</a>&gt;
 				项目管理

</td>
 		 </tr>
 		 	
 	</table>
 </li>
 </ul>
 
 <ul >
 <li class="hd" style="text-align: left">
 	<a href="${ctx}admin/batchInfo.form"><img  id="addUser" src="${ctx}imag66/add_batch.jpg" class="button"></a>
 </li>
 </ul>

   <div style="width:650px;height:${fn:length(btList)*50+100}px;overflow: auto;float:left">
   
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="35%">
       <col width="45%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
     <thead>
      <tr bgcolor="#E6F5FA">
       <th>项目名称</th>
       <th>描述</th>
       <th>编辑</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
  	
     <c:forEach items="${btList}" varStatus="st" var="bt">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td>${bt.name}</td>
	       <td>${bt.descript}</td>
	       <td class='al_center'><a href="${ctx}admin/batchInfo.form?sId=${bt.id}">编辑</a></td>
	       <td class='al_center'><a style="cursor:pointer" href="${ctx}admin/delBatchInfo.form?sId=${bt.id}">删除</a></td>
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