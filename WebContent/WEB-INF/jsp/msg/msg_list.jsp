<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="msg"/></jsp:include>
<div class="mainbody" style="height:1000px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 --> 
<div class="newreg" style="height:965px;">
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
我的消息</td>
 		 </tr>
 		 	
 	</table>

 </li>
 </ul>
 
 <ul>
<li class="hd" style="text-align: left">
	<a href="${ctx}msg/msgInfo.form"><img src="${ctx}imag66/add_mg.jpg" border="0"></a>
	</li>
 <li class="hd" style="text-align: left">
	提给我的消息
 </li>
 </ul>
   <div style="width:720px;height:auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="15%">
       <col width="15%">
       <col width="60%">
       <col width="10%">
       <col width="10%">
     </COLGROUP>
     <thead>
     	   <img src="${ctx}imag33/very-big.jpg">
      <tr bgcolor="#E6F5FA">
       <th>发件人</th>
       <th>标题</th>
       <th>内容</th>
       <th>发送时间</th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${msgList2me}" varStatus="st" var="msg">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td>${msg.fromName}</td>
	       <td><a style="cursor:pointer" href="${ctx}msg/viewMsg.form?sId=${msg.id}" target="_blank">${msg.title}</a></td>
	       <td>${msg.body}</td>
	       <td class='al_center'><fml:formatDate value="${msg.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	       <td class='al_center'><a style="cursor:pointer" href="${ctx}msg/delMsgByDest.form?msgId=${msg.id}" >删除</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
   
  <ul style = "	margin-top:20px;">
 <li class="hd" style="text-align: left">
	我给别人的消息&nbsp;&nbsp;
 </li>
 </ul>
  <div style="width:720px;height:auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="10%">
       <col width="15%">
       <col width="60%">
       <col width="15%">
     </COLGROUP>
     <thead>
     	   <img src="${ctx}imag33/very-big.jpg">
      <tr bgcolor="#E6F5FA">
       <th>收件人</th>
       <th>标题</th>
       <th>内容</th>
       <th>发送时间</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${msgList2others}" varStatus="st" var="msg">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td>${msg.toMbArrAsStr}</td>
	       <td><a style="cursor:pointer" href="${ctx}msg/msgInfo.form?sId=${msg.id}">${msg.title}</a></td>
	       <td>${msg.body}</td>
	       <td class='al_center'><fml:formatDate value="${msg.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
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