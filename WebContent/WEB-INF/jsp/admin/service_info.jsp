<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<% 
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
 %>
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
<!--注册条款 -->
<div class="newreg" style="height:1050px;">
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
车辆信息
	</c:if>
 
</td>
 		 </tr>
 		 	
 	</table>
<!--<li class="hd" style="text-align: left">
	  <img  id="miSubmit" src="${ctx}imag66/deliver.jpg" class="button">
 	    <img  id="goback" src="${ctx}imag66/return.jpg" class="button" onclick="window.location='${ctx}admin/resList.form';">
</li>-->
 </li>
 
 
 <li class="hdxxx">
 	<font color = "#ffffff">车辆基本信息</font>
 </li>
 <form name="frmNew" id="frmNew" msgModal='label'validate='true' >
 <li class="lft3" >
 <font color="#cc0000">*</font>车辆名称：
 </li>
 <li class="rt3" >
	<input value="${svc.name}" name="name1" minlen=2 class="input" id="name1" maxlength="10" type="text" style="width:200px;">
	<span id='msg_name1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
 <li class="lft3" >
 <font color="#cc0000">*</font>车辆描述：
 </li>
 <li class="rt3" style="height:90px;">
	<textarea name="descript1" minlen=1 class="input" id="descript1" cols="50" rows="10" style="width:200px;">${svc.descript}</textarea>
	<span id='msg_descript1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
  <li class="hdxxx">
 	<font color = "#ffffff">车辆价格及配置信息</font>
 </li>
 <li class="lft3">
 <font color="#cc0000">*</font>参考价格：
 </li>
 <li class="rt3" >
	<input value='<fmt:formatNumber value="${svc.refPrice}" pattern="###.00"/>' name="refPrice1" decimal='1' minlen=1 class="input" id="refPrice1"  style="width:200px;text-align: right;"></input>
	<span id='msg_refPrice1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 <li class="lft3">
 <font color="#cc0000">*</font>最少产品数目：
 </li>
 <li class="rt3" >
	<input value='${svc.limitPdCnt}' name="limitPdCnt1" number=1 minlen=1 class="input" id="limitPdCnt1"  style="width:200px;text-align: right;"></input>
	<span id='msg_limitPdCnt1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 
  <li class="lft3">
 <font color="#cc0000">*</font>最大产品数目：
 </li>
 <li class="rt3" >
	<input value='${svc.maxPdCnt}' name="maxPdCnt1" number=1 minlen=1 class="input" id="maxPdCnt1"  style="width:200px;text-align: right;"></input>
	<span id='msg_maxPdCnt1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 </li> 
 </form>
  
  <li class="hdxxx">
 	<font color = "#ffffff">车辆图片信息</font>
 </li>
 <li class="lft3">
 车辆图片一：
 </li>
 <li class="rt3" style="height:200px;">
    <div class="service_img"><IMG id="bind_imgPath1" <c:if test="${!empty svc.imgPath1}">src="${ctx}${svc.imgPath1}"</c:if><c:if test="${empty svc.imgPath1}"> alt="暂无" </c:if> /></div>
	<input type="button" class="button"  id="del_bind_imgPath1" <c:if test="${empty svc.imgPath1}">style="display:none"</c:if> value="删除"></input>
	<form name="fu1Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
	<input type="hidden" name="catalog" value="1"></input>
	<input type="hidden" name="seq" value="1"></input>
	<input type="file" class="button"  value=""  accept="image/jpeg"  name="imageFile"></input>
	<input type="button" class="button"  name="ffup" value="上传"></input>
	</form>
 </li> 
 <li class="lft3">
 车辆图片二：
 </li>  
 <li class="rt3" style="height:200px;">
    <div class="service_img"><IMG id="bind_imgPath2" <c:if test="${!empty svc.imgPath2}">src="${ctx}${svc.imgPath2}"</c:if><c:if test="${empty svc.imgPath2}"> alt="暂无" </c:if> /></div>
	<input type="button" class="button"  id="del_bind_imgPath2" <c:if test="${empty svc.imgPath2}">style="display:none"</c:if> value="删除"></input>
	<form name="fu2Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
	<input type="hidden" name="catalog" value="1"></input>
	<input type="hidden" name="seq" value="2"></input>
	<input type="file" class="button"  value=""  accept="image/jpeg"  name="imageFile"></input>
	<input type="button" class="button"  name="ffup" value="上传"></input>
	</form>
 </li> 
 <li class="lft3">
 车辆图片三：
 </li>
 <li class="rt3" style="height:200px;">
    <div class="service_img"><IMG id="bind_imgPath3" <c:if test="${!empty svc.imgPath3}">src="${ctx}${svc.imgPath3}"</c:if><c:if test="${empty svc.imgPath3}"> alt="暂无" </c:if> /></div>
	<input type="button" class="button"  id="del_bind_imgPath3" <c:if test="${empty svc.imgPath3}">style="display:none"</c:if> value="删除"></input>
	<form name="fu3Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
	<input type="hidden" name="catalog" value="1"></input>
	<input type="hidden" name="seq" value="3"></input>
	<input type="file" class="button"  value=""  accept="image/jpeg"  name="imageFile"></input>
	<input type="button" class="button"  name="ffup" value="上传"></input>
	</form>
 </li> 
  
  <li class="hdxxx">
 		<input id="miSubmit" class="button" name="Submit2" value=" 确认提交 "  type="button">&nbsp;&nbsp; 

	

 </li>
 </ul>
<form name="frmSvc" method="POST" action="${ctx}admin/serviceInfoPost.form">
<c:if test="${!empty svc}">
<input type="hidden" name="id" value="${svc.id}"></input>
</c:if>

<center>
 <table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">
	</td>
	</tr>
	</table>
</center>
 <input type="hidden" name="name" id="name" class="input" maxlength="10" type="text" style="width:100px;" value="${svc.name}" />
 <input type="hidden" name="descript" id="descript" class="input" value="${svc.descript}"/>
 <input type="hidden" name="refPrice" id="refPrice" class="input" value="${svc.descript}"/>
 <input type="hidden" name="limitPdCnt" id="limitPdCnt" class="input" value="${svc.limitPdCnt}"/>
 <input type="hidden" name="maxPdCnt" id="maxPdCnt" class="input" value="${svc.maxPdCnt}"/>
 <input type="hidden" value="${svc.imgPath1}" name="imgPath1"  class="input" id="imgPath1" >
 <input type="hidden" value="${svc.imgPath2}" name="imgPath2"  class="input" id="imgPath2" >
 <input type="hidden" value="${svc.imgPath3}" name="imgPath3"  class="input" id="imgPath3" >
</form>
</div>
<iframe name="fu" style="display:none"></iframe>
</div>

</body>
<script type="text/javascript">
  function showImg(seq,imgPath){
	  $("#bind_imgPath"+seq).attr("src",'${ctx}'+imgPath);
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
		   if(frm.elements["maxPdCnt1"].value < frm.elements["limitPdCnt1"].value)
		   {
			   alert('最大展品数应大于最小展品数');
			   return false;
		   }
		   document.frmSvc.elements["name"].value=frm.elements["name1"].value;
		   document.frmSvc.elements["descript"].value=frm.elements["descript1"].value;
		   document.frmSvc.elements["refPrice"].value=frm.elements["refPrice1"].value;
		   document.frmSvc.elements["limitPdCnt"].value=frm.elements["limitPdCnt1"].value;
		   document.frmSvc.elements["maxPdCnt"].value=frm.elements["maxPdCnt1"].value;
		   document.frmSvc.submit();
	   }
  });
  $(function(){
	  showImg(1,'${svc.imgPath1}');
	  showImg(2,'${svc.imgPath2}');
	  showImg(3,'${svc.imgPath3}');
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
<script language="javascript"> 
</script> 
</html>