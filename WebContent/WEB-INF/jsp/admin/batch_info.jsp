<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
<div class="mainbody" style="height:1000px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<c:if test="${!empty param.succ or !empty param.err}">
	<div id="effect">
		<h3 ></h3>
		<p>
			<c:if test="${'1' eq param.succ}">
			恭喜！你的已提交成功！
			</c:if>
			<c:if test="${'1' eq param.err}">
			抱歉！提交时错误！
			</c:if>
		</p>
	</div>
	<script>
	  $("#effect").show(500,function(){
		  	window.setTimeout('$("#effect").hide()', 1500);
		  }
	  );
	</script>
</c:if> 
<div class="newreg" style="height:590px;">
<form name="frmbt" method="POST" action="${ctx}admin/batchInfoPost.form" msgModal='label'validate='true'>
<c:if test="${!empty bt}">
<input type="hidden" name="id" value="${bt.id}"></input>
</c:if>
<input type="hidden" name="mbIds" value=""></input>
<ul style="height:500px;">
 <li>
 	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页</a>&gt;
 			<a href="${ctx}admin/batchList.form">项目管理</a>&gt;
项目信息
</td>
 		 </tr>
 		 	
 	</table>

 </li>
 
 
<li class="hdxxx"><font color="#ffffff">请填写项目信息</font>
 <li class="bi_lft3">
 <font color="#cc0000">*</font>项目名称：
 </li>
 <li class="bi_rt3">
	<input value="${bt.name}" name="name" minlen=1 class="input" id="name" maxlength="100" type="text" style="width:400px;">
	<span id='msg_name'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li style="height:1px;clear:both;"></li>
 <li class="bi_lft3" style="height:100px;">
 <font color="#cc0000">*</font>项目描述：
 </li>
 <li class="bi_rt3" style="height:100px;">
	<textarea name="descript" minlen=1 class="input" id="descript" cols="30" rows="6" style="width:400px;">${bt.descript}</textarea>
	<span id='msg_descript'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li style="height:1px;clear:both;"></li>
 <li class="hdxxx"><font color="#ffffff">请选择参与本次申请项目的单位</font>
 </li>
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
	  已选单位：<br /><select multiple  class="input"  size='20' id="rightList" style="width:200px;height:270px;"></select>
	</td>
	</tr>
	</table>
 </li> 
 
 <li class="hdxxx">
 <input id="miSubmit" class="button" name="Submit2" value=" 确认提交 "  type="button">&nbsp;&nbsp; 
	<input id="goback" class="button"  onclick="window.location='${ctx}admin/batchList.form';" name="goback" value=" 返回 "  type="button">
</li>
 </ul>

<center>
 <table width='780px'>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"> 
	</td>
	</tr>
	</table>
</center>
</form>
</div>
<iframe name="fu" style="display:none"></iframe>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
  var frm = document.frmbt; 
  $(frm).submit(function(){return false;});
  $("#miSubmit").click(function(){
	   var ret = $.validateForm(frm);
	   if(ret){
		   var mbIds = '';
		   var rs = $("#rightList option");
		   $.each(rs,function(i,op){
			   mbIds += (op.value+',');
		   });
		   if(mbIds == ''){
				alert('请选择用户');
				return false;
		   }
		   frm.mbIds.value = mbIds;
		   frm.submit();
	   }
  });
  $(function(){
    $("#branch").change(function(){
         var me$ = $(this);
         if(this.selectedIndex > -1){
			$.ajax({
	              type:'GET',
	              url:'${ctx}mb/getMbListByBranchId.form',
	              data:{'branchId':me$.val(),'batchFilter':1},
	              dataType:'json',
	              cache: false,
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
    <c:forEach items="${bt.toMbArr}" var="mb">
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