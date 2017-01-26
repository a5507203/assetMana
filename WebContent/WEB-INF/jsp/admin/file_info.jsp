<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_file"/></jsp:include>
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
<!--主区域 -->
<div class="newreg" style="height:900px;">
<ul>
 <li>
 	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">
 <a href="${ctx}index.htm">首页</a>
&gt;
<a href="${ctx}admin/fileList.form" >文件管理</a>
&gt;
<a href="${ctx}admin/fileInfo.form">文件</a>
 </td>
 </tr>
 </table> 
 </li>
 <li class="hd">
 </li>
 <form name="frmNew" name="frmNew" msgModal='label'validate='true' >
 <li class="lft3">
 <font color="#cc0000">*</font>文件描述：
 </li>
 <li class="rt3" style="height:90px;">
	<textarea name="descript1" minlen=1 class="input" id="descript1" cols="30" rows="3" style="width:200px; height:200px">${fil.desc}</textarea>
	<span id='msg_descript1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 </form>
 <li class="lft3">
 附件：
 </li>
 <li class="rt3" style="height:100px;">
    <div >
    <c:if test="${!empty fil.name}"><a id="bind_file"  href="${ctx}${fil.path}">${fil.name}</a></c:if>
    <c:if test="${empty fil.name}"><a  id="bind_file"  href=""></a></c:if>
	<input type="button" class="button"   id="del_bind_file" <c:if test="${empty fil.name}">style="display:none"</c:if> value="删除"></input>
    </div>
	<form name="fu1Frm" action="${ctx}admin/uploadFile.form" target="fu" method="POST" enctype="multipart/form-data" >
	<input type="file" class="button"   value=""  name="attachFile"></input>
	<input type="button" class="button"   name="ffup" value="上传"></input>
	</form>
 </li> 
 </ul>
<form name="frmSvc" method="POST" action="${ctx}admin/fileInfoPost.form">
<c:if test="${!empty dev}">
<input type="hidden" name="id" value="${fil.id}"></input>
</c:if>
 <ul> 
<center>
 
 	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">
	<input id="miSubmit" name="Submit2" value=" 确认提交 "  type="button" class="button"  >(前面加<font color="#cc0000">*</font>的为必填项) 
	<input class="button" onClick="window.location='${ctx}admin/resList.form';" id="goback" name="goback" value=" 返回 "  type="button" > 
	  </td>
 </tr>
 </table> 
</center>
 <input type="hidden" name="name" id="name" class="input" maxlength="10" type="text" style="width:100px;" value="${fil.name}" />
 <input type="hidden" name="desc" id="desc" class="input" value="${fil.desc}"/>
 <input type="hidden" value="${fil.path}" name="path"  class="input" id="path" >
</form>
</div>
<iframe name="fu" style="display:none"></iframe>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
  function showFile(filePath,realName){
	  $("#bind_file").attr("href",'${ctx}'+filePath).html(realName);
	  $("#name").val(realName);
	  $("#path").val(filePath);
  }
  var frm = document.frmNew; 
  $(frm).submit(function(){return false;});
  $("#miSubmit").click(function(){
	   var ret = $.validateForm(frm);
	   if($("#name").val() == '')
		   return false;
	   if($("#path").val() == '')
		   return false;
	   if(ret){
		   document.frmSvc.elements["desc"].value=frm.elements["descript1"].value;
		   document.frmSvc.submit();
	   }
  });
  $(function(){
	  $("#del_bind_file").css("display","block").click(function(){
		  $("#bind_file").html("");
		  $("#name").val("");
		  $("#path").val("");
		  this.style.display = 'none';
	  });
	  $("INPUT[name='ffup']").click(function(){
		  var me$ = $(this);
		  var fm = me$.closest("FORM").get(0);
		  if(fm.attachFile.value=='' ||
		     fm.attachFile.value.toLowerCase().indexOf(".exe") == fm.attachFile.value.length - 4)
		  {
			  	     alert('请选择附件（如果是exe类型的文件请放到压缩文件中上传）!');
			  	     return;
		  }
		  fm.submit();
	  });
  });
</script>
</html>