<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.button{
 width:60px;
}
.bi_lft3{
  width:180px;
  float:left;
  text-align: right;
  line-height: 30px;
}
.bi_rt3{
  width:420px;
  float:left;
  text-align: left;
  line-height: 30px;
  padding-top:3px;
}
</style>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/msg/msg_info.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="msg"/></jsp:include>
<div class="mainbody" style="height:800px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 -->
<div class="newreg" style="height:630px;">
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
<form name="frmNew" method="POST" action="${ctx}msg/msgInfoPost.form" onSubmit="return false;">
<input type="hidden" name="toMbids" value=""></input>
<ul>
 <li>
 	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">
 <a href="${ctx}index.htm">首页</a>
 &gt;
<a href="${ctx}msg/msgList.form">我的消息</a>
&gt;
新增消息</td>
 		 </tr>
 		 	
 	</table>
 </li>
</ul>
<div style="width:720px;height:250px;">
<ul>
	<li class="hdxxx">
 	<font color = "#ffffff">消息基本信息</font>
 </li>
  <li class="bi_lft3">消息标题：</li>
  <li class="bi_rt3">
    <input name="title" type="text" value="${msg.title}" class="input" style="width:400px;"></input>
  </li>
  <li style="height:1px;clear:both;"></li>
  <li class="bi_lft3" style="height:120px;">消息内容：</li>
  <li class="bi_rt3" style="height:120px;width:400px">
     <textarea class="input" name="body" rows="8" cols="30" style="width:400px">${msg.body}</textarea>
  </li>
  <li style="height:1px;clear:both;"></li>
  	<li class="hdxxx">
 	<font color = "#ffffff">选择消息接收人</font>
 </li>
  <li class="bi_rt3">
  <span <c:if test="${sessionScope.mb.username eq 'admin'}">style="display:none"</c:if>><input type="checkbox" name="ccAdmin" id="ccAdmin" ></input><label for="ccAdmin">发送给管理员</label></span>
  </li>
  <li style="height:1px;clear:both;"></li>
  <li class="bi_lft3" style="height:300px;width:700px;text-align: center;">
	<table style="width:500px;" border=0>
	<colgroup>
	 <col width="45%">
	 <col width="5%">
	 <col width="45%">
	</colgroup>
	<tr style="height:150px;">
	<td>
	  <select class="input" id="branch" size=1 style="float:right;width:200px;"><code:codeList codeTable="b_branch"></code:codeList></select><br />
	  <select multiple  size='10' id="leftList" style="float:right;width:200px;height:250px;"></select>
	</td>
	<td>
	<input type="button" class="button" id="addSel" value="　&gt;　"></input><br />
	<input type="button" class="button" id="addAll" value="　&gt;&gt;　"></input><br />
	<input type="button" class="button" id="delSel" value="　&lt;　"></input><br />
	<input type="button" class="button" id="delAll" value="　&lt;&lt;　"></input>
	</td>
	<td style="text-align: left;">
	  已选：<br /><select multiple  class="input"  size='20' id="rightList" style="width:200px;height:270px;"></select>
	</td>
	</tr>
	</table>
 </li> 
   <li class="hdxxx">
 		<input type="button" class="button" id="miSubmit_down" value="提交"></input>
	<input id="goback" class="button"  onclick="window.location='${ctx}admin/msgList.form';" name="goback" value=" 返回 "  type="button"> 
 </li>
 		
</ul>
   
</div>
<c:if test="${empty msg.id}">
 <ul>
  <li class="hd" style="background:url(${ctx}imag33/title_low.jpg)">
 	
 </li>
 </ul>
</c:if>
</form> 
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(function(){
    $("#branch").change(function(){
         var me$ = $(this);
         if(this.selectedIndex > -1){
			$.ajax({
	              type:'GET',
	              url:'${ctx}mb/getMbListByBranchId.form',
	              data:{'branchId':me$.val()},
	              dataType:'json',
	              success:function(data){
	                 var l = $("#leftList").empty();
	                 $.each(data,function(i){
		                 $("<option value='"+data[i].id+"'>"+data[i].realName+"</option>").appendTo(l);
	                 });
	              }
				});
         }
    }).change();
    var r = $("#rightList");
    <c:forEach items="${msg.toMbArr}" var="mb">
     $("<option value='${mb.id}'>${mb.realName}</option>").appendTo(r);
    </c:forEach>
  });
  
  $("#addSel").click(function(){
	  var ls = $("#leftList option:selected");
	  add(ls);
  });
  $("#addAll").click(function(){
	  var ls = $("#leftList option");
	  add(ls);
  });
  $("#delSel").click(function(){
	  var rs = $("#rightList option:selected");
	  del(rs);
  });
  $("#delAll").click(function(){
	  var rs = $("#rightList option");
	  del(rs);
  });
  function add(ls){
	  var r =$("#rightList");
	  $.each(ls,function(i,op){
		 var exists = false;
         $("#rightList option").each(function(i,o){
			  if(o.value == op.value){
				  exists = true;
				  return false;
			  }
         });
         if(!exists){
        	 $("<option value='"+op.value+"'>"+op.text+"</option>").appendTo(r);
         }
	  }); 
  }
  function del(rs){
	  rs.remove();
  }
</script>
</html>