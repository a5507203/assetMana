<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/msg/msg_info.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="msg"/></jsp:include>
<div class="mainbody" style="height:800px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 -->
<div class="newreg" style="height:700px;">
<form name="frmNew" method="POST" action="${ctx}msg/msgInfoPost.form" onsubmit="return false;">
<ul>
 <li>
 <a href="${ctx}index.htm">首页</a>
 &gt;
<a href="${ctx}msg/msgList.form">我的留言</a>
&gt;
查看留言
 </li>
</ul>
<div style="width:720px;height:250px;">
<ul>
  <li class="news_title">消息标题：
    ${msg.title}
  </li>
  <li class="news_title">发送者：
    ${msg.fromName}
  </li>
  <li class="news_title">发送时间：
    <fmt:formatDate value="${msg.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/> 
  </li>
  <li class="news_title" >消息内容：</li>
 </ul>
 <div class="news_content" style="height:320px;width:520px">
     ${msg.body}
 </div>
 <ul>
  <li class="news_title">选择消息接收人：</li>
 </ul>
 <div class="news_title" style="width:400px;height:100px;overflow: auto;">
      <c:forEach items="${toList}" var="mb" varStatus="st">
        <span style="padding:2 15 2 10px;"><c:if test="${empty msg.id}"><input type="checkbox"  id="i${st.index}" value="${mb.id}" name="toMbids"/>
        </c:if><label for="i${st.index}">${mb.realName}</label>
        <input type="hidden"  name="_toMbids"/>
        </span>
      </c:forEach>
 </div>
   
</div>
<c:if test="${empty msg.id}">
 <ul>
  <li class="hd">
	<input type="button" class="button" id="miSubmit_down" value="提交"></input>
 </li>
 </ul>
</c:if>
</form> 
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>