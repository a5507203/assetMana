<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
 %>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<body>
<div class="pop_main_mid">
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
			closethewindow();
		  }
	  );
	</script>
</c:if> 
<!--主区域 -->
<div class="newreg" style="height:935px;">
<ul>
 <li>
<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">
 				<c:if test="${sessionScope.mb.username eq 'admin'}">
	<a href="${ctx}index.htm">首页</a>
&gt;
<a href="${ctx}admin/resList.form" >资源管理</a>
&gt;
设备信息
	</c:if>
 
</td>
 		 </tr>
 		 	
 	</table>
 
 </li>
 <li class="hdxxx">
 	<font color = "#ffffff">设备基本信息</font>
 </li>
 <form name="frmNew" name="frmNew" msgModal='label'validate='true' >
 <li class="lft3">
 <font color="#cc0000">*</font>设备名称：
 </li>
 <li class="rt3">
	<input value="${dev.name}" name="name1" minlen=2 class="input" id="name1" maxlength="10" type="text" style="width:200px;">
	<span id='msg_name1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 <font color="#cc0000">*</font>设备描述：
 </li>
 <li class="rt3" style="height:90px;">
	<textarea name="descript1" minlen=1 class="input" id="descript1" cols="30" rows="3" style="width:200px;">${dev.descript}</textarea>
	<span id='msg_descript1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 <font color="#cc0000">*</font>设备类型：
 </li>
 <li class="rt3">
 <select class="input"  <c:if test="${!empty sessionScope.mb and sessionScope.mb.validMember}">disabled = "true"</c:if>  name="devType" id="devType" size=1 minlen=1 style="width:200px;" >
  <option value=''>请选择</option>
  <code:codeList codeTable="b_dev_type" value="${dev.devType}"></code:codeList>
 </select><span id='msg_devType'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3" sType='1'>
 车辆类型：
 </li>
 <li class="rt3" sType='1'>
 <select class="input"  <c:if test="${!empty sessionScope.mb and sessionScope.mb.validMember}">disabled = "true"</c:if> name="sType" id="sType" size=1 style="width:120px;">
  <code:codeList codeTable="b_service" value="${dev.sType}"></code:codeList>
 </select><span id='msg_sType'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 <font color="#cc0000">*</font>设备型号：
 </li>
 <li class="rt3">
	<input value="${dev.devMod}" name="devMod" minlen=2 class="input" id="devMod" maxlength="20" type="text" style="width:200px;">
	<span id='msg_devMod'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
  <li class="hdxxx">
 	<font color = "#ffffff">设备价格信息</font>
 </li>
 <li class="lft3">
 <font color="#cc0000">*</font>数量单位(如：个，套)：
 </li>
 <li class="rt3">
	<input value="${dev.numUnit}" name="numUnit" minlen=2 class="input" id="numUnit" maxlength="10" type="text" style="width:200px;">
	<span id='msg_numUnit'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 <font color="#cc0000">*</font>参考价格：
 </li>
 <li class="rt3">
	<input value='<fmt:formatNumber value="${dev.refPrice}" pattern="###.00"/>' name="refPrice" class="input" id="refPrice" decimal="1" type="text" style="width:200px;text-align: right;">
	<span id='msg_refPrice'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 </form>
 
  <li class="hdxxx">
 	<font color = "#ffffff">设备图片信息</font>
 </li>
 
 <li class="lft3">
 设备图片一：
 </li>
 <li class="rt3" style="height:160px;">
    <div class="service_img"><IMG id="bind_imgPath1" <c:if test="${!empty dev.imgPath1}">src="${ctx}${dev.imgPath1}"</c:if><c:if test="${empty dev.imgPath1}"> alt="暂无" </c:if> /></div>
	<input type="button" class="button"   id="del_bind_imgPath1" <c:if test="${empty dev.imgPath1}">style="display:none"</c:if> value="删除"></input>
	<form name="fu1Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
	<input type="hidden" name="catalog" value="2"></input>
	<input type="hidden" name="seq" value="1"></input>
	<input type="file" class="button"   value=""  accept="image/jpeg"  name="imageFile"></input>
	<input type="button" class="button"   name="ffup" value="上传"></input>
	</form>
 </li> 
 <li class="lft3">
 设备图片二：
 </li>
 <li class="rt3" style="height:160px;">
    <div class="service_img"><IMG id="bind_imgPath2" <c:if test="${!empty dev.imgPath2}">src="${ctx}${dev.imgPath2}"</c:if><c:if test="${empty dev.imgPath2}"> alt="暂无" </c:if> /></div>
	<input type="button" class="button"   id="del_bind_imgPath2" <c:if test="${empty dev.imgPath2}">style="display:none"</c:if> value="删除"></input>
	<form name="fu2Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
	<input type="hidden" name="catalog" value="2"></input>
	<input type="hidden" name="seq" value="2"></input>
	<input type="file" class="button"   value=""  accept="image/jpeg"  name="imageFile"></input>
	<input type="button" class="button"   name="ffup" value="上传"></input>
	</form>
 </li> 
 <li class="lft3">
 设备图片三：
 </li>
 <li class="rt3" style="height:160px;">
    <div class="service_img"><IMG id="bind_imgPath3" <c:if test="${!empty dev.imgPath3}">src="${ctx}${dev.imgPath3}"</c:if><c:if test="${empty dev.imgPath3}"> alt="暂无" </c:if> /></div>
	<input type="button" class="button"   id="del_bind_imgPath3" <c:if test="${empty dev.imgPath3}">style="display:none"</c:if> value="删除"></input>
	<form name="fu3Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
	<input type="hidden" name="catalog" value="2"></input>
	<input type="hidden" name="seq" value="3"></input>
	<input type="file" class="button"   value=""  accept="image/jpeg"  name="imageFile"></input>
	<input type="button" class="button"   name="ffup" value="上传"></input>
	</form>
 </li> 
 </ul>
<form name="frmSvc" method="POST" action="${ctx}admin/deviceInfoPost.form">
<c:if test="${!empty dev}">
<input type="hidden" name="id" value="${dev.id}"></input>
</c:if>
 <ul> 
  <li class="hdxxx">
 		<input id="miSubmit" class="button" name="Submit2" value=" 确认提交 "  type="button">&nbsp;&nbsp; 
 </li>
 </ul>
 <input type="hidden" name="name" id="name" class="input" maxlength="10" type="text" style="width:100px;" value="${dev.name}" />
 <input type="hidden" name="descript" id="descript" class="input" value="${dev.descript}"/>
 <input type="hidden" name="sType" class="input" value="${dev.sType}"/>
 <input type="hidden" name="devType" class="input" value="${dev.devType}"/>
 <input type="hidden" name="devMod" class="input" value="${dev.devMod}"/>
 <input type="hidden" name="numUnit" class="input" value="${dev.numUnit}"/>
 <input type="hidden" name="refPrice"  class="input" value="${dev.refPrice}"/>
 <input type="hidden" value="${dev.imgPath1}" name="imgPath1"  class="input" id="imgPath1" >
 <input type="hidden" value="${dev.imgPath2}" name="imgPath2"  class="input" id="imgPath2" >
 <input type="hidden" value="${dev.imgPath3}" name="imgPath3"  class="input" id="imgPath3" >
</form>
</div>
<iframe name="fu" style="display:none"></iframe>
</div>
</body>
<script type="text/javascript">
  function showImg(seq,imgPath){
	  $("#bind_imgPath"+seq).attr("src",'${ctx}'+imgPath).attr("alt","图片位");
	  $("#imgPath"+seq).val(imgPath);
	  $("#del_bind_imgPath"+seq).css("display","block").click(function(){
		  $("#bind_imgPath"+seq).attr("src","");
		  $("#imgPath"+seq).val("");
		  this.style.display = 'none';
	  });
  }
  var frm = document.frmNew; 
  $(frm).submit(function(){return false;});
  $("#miSubmit").click(function(){
	   var ret = $.validateForm(frm);
	   if(ret){
		   if($("#imgPath1").val() == ''){
		       alert('请至选择第一张图片');
			   return false;
		   }
		   document.frmSvc.elements["name"].value=frm.elements["name1"].value;
		   document.frmSvc.elements["descript"].value=frm.elements["descript1"].value;
		   document.frmSvc.elements["sType"].value=frm.elements["sType"].value;
		   document.frmSvc.elements["devType"].value=frm.elements["devType"].value;
		   document.frmSvc.elements["devMod"].value=frm.elements["devMod"].value;
		   document.frmSvc.elements["numUnit"].value=frm.elements["numUnit"].value;
		   document.frmSvc.elements["refPrice"].value=frm.elements["refPrice"].value;
		   document.frmSvc.submit();
	   }
  });
  $(function(){
	  showImg(1, "${dev.imgPath1}");
	  showImg(2, "${dev.imgPath2}");
	  showImg(3, "${dev.imgPath3}");
	  $("#devType").change(function(){
		  var sT = $("li[sType]");
		  this.value == '1'? sT.show() : sT.hide();
	  }).change();
	  $("INPUT[name='ffup']").click(function(){
		  var me$ = $(this);
		  var fm = me$.closest("FORM").get(0);
		  if(fm.imageFile.value=='' ||
		     fm.imageFile.value.toLowerCase().indexOf(".jpg") != fm.imageFile.value.length - 4)
		  {
			  	     alert('请选择.jpg类型的图片文件(请确保文件大小在1M以内)!');
			  	     return;
		  }
		  fm.submit();
	  });
	  $("IMG[id^='bind_imgPath']").attr("title","点击看大图").css("cursor","pointer")
	  .click(function(){
			window.open(this.src);
	  });
	  if('1' == '${readonly}'){
			$("input,textarea,select").attr("readonly","true");
			$(":button,:file").hide();
			$("#miSubmit").hide();
			$("#goback").show().closest("A").attr("href","${ctx}mb/resAppList.form");
	  }
  });
</script>
</html>