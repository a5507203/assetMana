<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/admin/news_info.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_news"/></jsp:include>
<div class="mainbody" style="height:1000px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 -->
<div class="newreg" style="height:800px;">
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
<form name="frmNew" method="POST" action="${ctx}admin/newsInfoPost.form" onSubmit="return false;">
<input type="hidden" value="${news.id}" name=id></input>
<ul>
 <li>
 	<table>
 		<tr>
 			<td width="650" background="${ctx}imag33/title_low.jpg" height="22">
 <a href="${ctx}index.htm">首页</a>
 &gt;
<a href="${ctx}admin/newsList.form">公告管理</a>
&gt;添加公告
</td>
<td background="${ctx}imag33/title_low.jpg" >
	<a href="${ctx}admin/newsList.form"><img   src="${ctx}imag66/b_return.jpg" border="0"></a>
</td>
 </tr>
 </table> 
 </li>
</ul>
<div style="width:720px;height:550px;">
<ul>
	
  <li class="news_title">公告标题：
    <input name="title" type="text" value="${news.title}" class="input" style="width:350px;"></input>
  </li>
  <li class="news_title">公告内容：</li>
  <li class="news_content" style="height:600px;width:605px;padding:0px;">
     <textarea class="input" name="desc" rows="40" cols="90" >${news.desc}</textarea>
  </li>
</ul>
   
</div>
<center>
<table >
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><input type="button" class="button" id="miSubmit_down" value="提&nbsp;交"></input></td>
 				<input id="goback" class="button"  onclick="window.location='${ctx}admin/newsList.form';" name="goback" value=" 返回 "  type="button">
 </tr>
 </table>
</center> 
</form> 
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>