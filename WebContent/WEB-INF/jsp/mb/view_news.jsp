<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/mb/res_app_info.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="f_apply"/></jsp:include>
<div class="mainbody" style="height:900px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<div class="newreg" style="height:800px;">
<ul>
 <li>
<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页</a>&gt;
最新公告</td>
 		 </tr>
 		 	
 	</table>

 </li>
 </ul>
 <ul style="width:720px;height:auto;float:left">
 <li class="news_title" >
 	公告标题：
  ${news.title}
 </li> 
 <li class="news_title" >
 	时间：
   <fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
 </li> 
 <li class="news_title" >
 	内容：
   &nbsp;
 </li> 
 <div class="news_content">
 ${news.desc}
 </div>
</ul>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>