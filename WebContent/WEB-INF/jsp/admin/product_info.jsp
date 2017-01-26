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
<div class="newreg" style="height:980px;">
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
产品信息
	</c:if>
 
</td>
 		 </tr>
 		 	
 	</table>
 </li>
 
 
 
	

 	
 
 

  

 </ul>
 <form name="frmNew1"  msgModal='label' validate='true' >
 	<center>
 	<table cellspacing="0" cellpadding="0" border="1" bordercolor="#000000" width = "650" valign ="middle" align="center">
 		
 		<tr height ="25" align ="center">
 		<td colspan = "4">
 			<font size = "3">科普大蓬车车载展品</font>
 		</td>
 	</tr  >
 		
 		
 	<tr height ="39" >
 		<td >
 			展品名称：	
 		</td>
 			<td colspan = "3" align="center">
		<input value="${pd.pdname}" name="name1" minlen=1 class="input" id="name1" maxlength="100" type="text" style="width:490px;">
	        <span id='msg_name1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 		</td>
 		
 	</tr  >
 	
 		<tr height ="25">
 		<td width = "132">
 			参考价格：
 		</td>
 		<td width = "183">
 		<input value='<fmt:formatNumber value="${pd.refPrice}" pattern="###.00"/>' name="refPrice1" minlen=1 decimal='1' class="input" id="refPrice1" maxlength="10" type="text" style="text-align:right;width:150px;">
	        <span id='msg_refPrice1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 		</td>
 		<td width = "152">
 			规格尺寸(长*宽*高)(米)：	
 		</td>
 		<td width = "183">
 		<input value="${pd.size}" name="size" minlen=2 class="input" id="size" maxlength="100" type="text" style="width:150px;">
	        <span id='msg_name1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>	
 		</td>
 	</tr>
 		<tr>
 		<td colspan = "4">
 			<div style =" width:620px; height:180px;	overflow:hidden;	">
 				<div style =" width:120px; height:170px; 	float: left; 	">
			
	 					 	<div class="product_img" ><IMG id="bind_imgPath1" <c:if test="${!empty pd.imgPath1}">src="${ctx}${pd.imgPath1}"</c:if><c:if test="${empty pd.imgPath1}"> alt="产品图片(暂无)" </c:if> /></div>
							<c:if test="${sessionScope.mb.username eq 'admin'}"><input type="button" class="button"   id="del_bind_imgPath1" <c:if test="${empty pd.imgPath1}">style="display:none"</c:if> value="删除"></input></c:if>
				</div>

						<table cellspacing="0" cellpadding="0" height="160"  >
							<tr  height="30">
							<td >
								 &nbsp;&nbsp;展示的科学技术原理:</td>
						</tr>
						
						<tr height="130">
							<td>
								
									&nbsp;<textarea name="descript1" minlen=1 class="input" id="descript1" cols="39" rows="9" style =" width:468px; height:125px;">${pd.descript}</textarea>
									<span id='msg_descript1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
									
									
							</td>
						</tr>					
						
					</table>
				 				
 				</div>
 									   
				 		
 				
 				
 		
 			
 		</td>
 	</tr>
 	


 		<tr>
 		<td>
 			产品适用车辆
 		</td>
 		<td>
 	<c:forEach items="${serviceList}" var="svc">
        	  <input type="checkbox"  ck='${svc.id}' id='${svc.id}'></input><label ckLabel='${svc.id}' for="${svc.id}">${svc.name}</label>&nbsp;
        	</c:forEach>  
		 	<span id='msg_sType'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 		</td>
</form>
 			<td colspan = "2" height ="30">
 				<c:if test="${sessionScope.mb.username eq 'admin'}">	
 			   	<form name="fu1Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
									<input type="hidden" name="catalog" value="3"></input>
									<input type="hidden" name="seq" value="1"></input>
									<input type="file" class="button"   value=""  accept="image/jpeg"  name="imageFile" style =" width:200px; height:20px;"></input>
									<input type="button" class="button"  name="ffup" value="上传" style =" width:70px; height:20px;"></input>
							</form>
				</c:if>&nbsp;	
 		</td>
 	</tr>
 	 	
<form name="frmNew2"  msgModal='label' validate='true' >
 		<tr valign="middle" align ="left"  height ="100">
 			<td colspan = "4">
 				&nbsp;&nbsp;&nbsp;<font color="#cc0000">*</font>演示操作说明：<br>
 				&nbsp;&nbsp;&nbsp;<textarea name="materials" minlen=1 class="input" id="materials" cols="72" rows="2" style =" width:610px; height:60px;">${pd.materials}</textarea>
	     <span id='msg_materials'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 		</td>
 	</tr>
 	
 	<tr valign="middle" align ="left"  height ="100" >
 			<td colspan = "4" >
 		 &nbsp;&nbsp;&nbsp;<font color="#cc0000">*</font>解说词：<br>
       &nbsp;&nbsp; &nbsp;<textarea name="useMethod" minlen=1 class="input" id="useMethod" cols="72" rows="2" style =" width:610px; height:60px;">${pd.useMethod}</textarea>
	     <span id='msg_useMethod'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 		</td>
 	</tr>
 	
 	
 	<tr valign="middle" align ="left" height ="80" >
 			<td colspan = "2" >		
 				&nbsp;&nbsp;<font color="#cc0000">*</font>产品构成：<br>
	         &nbsp;&nbsp;<textarea name="useStep" minlen=1 class="input" id="useStep" cols="40" rows="2" style =" width:278px; height:50px;">${pd.useStep}</textarea>
		    <span id='msg_useStep'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 	  
 		</td>

 			<td colspan = "2" rowspan ="4" align ="center" >
 				
 				<div style =" width:320px; height:290px; 	float: left;  text-align: center;		">
					 	 <div class="service_img200x400"><IMG id="bind_imgPath2"  <c:if test="${!empty pd.imgPath2}">src="${ctx}${pd.imgPath2}"</c:if><c:if test="${empty pd.imgPath2}"> alt="产品图片(暂无)" </c:if> /></div>
								<div style ="text-align: center;"><c:if test="${sessionScope.mb.username eq 'admin'}"><input type="button" class="button"   id="del_bind_imgPath2"  value="删除" style =" width:60px; height:20px; "></c:if></input></div>
					      </div>			      
 				 
 				
 		 
 			 </td>
 		
 		
 		
 	</tr>
 
	<tr valign="middle" align ="left" height ="80" >
 			<td colspan = "2" >
 		   &nbsp;&nbsp;<font color="#cc0000">*</font>技术要求：<br>
	       &nbsp;&nbsp; <textarea name="suitableTo" minlen=1 class="input" id="suitableTo" cols="40" rows="2"  style =" width:275px; height:50px;">${pd.suitableTo}</textarea>
	      <span id='msg_suitableTo'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 	  
 		</td>
 		
 	</tr>
 	
 
 	<tr valign="middle" align ="left" height ="25" >
 			<td colspan = "2" >
 		      &nbsp;&nbsp; <font color="#cc0000">*</font>电源条件：<textarea name="storageCond" minlen=1 class="input" id="storageCond" cols="40" rows="2" style =" width:196px; height:16px;">${pd.suitableTo}</textarea>
		     <span id='msg_storageCond'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 	  
 		</td>
 		
 		
 		
 		
 		
 	</tr>
 
 		<tr  valign="middle" align ="left" height ="80" >
 			<td colspan = "2" >
 		  &nbsp;&nbsp; <font color="#cc0000">*</font>注意事项：<br>
	        &nbsp;&nbsp; <textarea name="forbiddenTo" minlen=1 class="input" id="forbiddenTo" cols="40" rows="2" style =" width:275px; height:50px;">${pd.forbiddenTo}</textarea>
		      <span id='msg_forbiddenTo'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 	  
 		</td>
 		
 	</tr>
 	
 		<tr valign="middle" align ="left" height ="25" >
 			<td colspan = "2" >
 		 &nbsp;&nbsp; <font color="#cc0000">*</font>结构类型：<textarea name="pack" minlen=1 class="input" id="pack" cols="40" rows="2" style =" width:196px; height:16px;">${pd.pack}</textarea>
		 <span id='msg_pack'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 	  
 		</td>

 		</form>
 			<td colspan = "2" align ="center">		
 	 	<c:if test="${sessionScope.mb.username eq 'admin'}">	 
			<form name="fu2Frm" action="${ctx}admin/uploadProcess.form" target="fu" method="POST" enctype="multipart/form-data" >
			<input type="hidden" name="catalog" value="3"></input>
			<input type="hidden" name="seq" value="2"></input>
			<input type="file" class="button"   value=""  accept="image/jpeg"  name="imageFile" style =" width:200px; height:20px;"></input>
			<input type="button" class="button"   name="ffup" value="上传" style =" width:70px; height:20px;"></input>
			</form>      
 </c:if>&nbsp;	  
 		</td>
 	</tr>

 	
</table>

</center>
 	
 	
 	
<form name="frmSvc" method="POST" action="${ctx}admin/productInfoPost.form">
<c:if test="${!empty pd}">
<input type="hidden" name="id" value="${pd.id}"></input>
</c:if>
<br>
<table align="center" >
 		<tr align="center">
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22">
	<input id="miSubmit" name="Submit2" value="确认提交"  type="button" class="button"  >&nbsp;&nbsp; 
	
<c:if test="${sessionScope.mb.username eq 'admin'}">
	<input class="button" onclick="window.location='${ctx}admin/resList.form';" id="goback" name="goback" value="返  回"  type="button" class="button"  > 
	</c:if>
	

	 	
	 	
</td>
</tr>
</table>
 <input type="hidden" name="servTps" id="servTps" class="input" value="${pd.servTps}" />
 <input type="hidden" name="servTpName" id="servTpName" class="input"  value="${pd.servTpName}" />

 <input type="hidden" name="pdname" id="pdname" value="${pd.pdname}" />
 <input type="hidden" name="refPrice" id="name"  value="${pd.refPrice}" />
 <input type="hidden" name="descript" id="descript"value="${pd.descript}"/>
 <input type="hidden" name="size" class="input" value="${pd.size}"/>
 <input type="hidden" name="materials" value="${pd.materials}"/>
 <input type="hidden" name="useMethod" value="${pd.useMethod}"/>
 <input type="hidden" name="useStep"  value="${pd.useStep}"/>
 <input type="hidden" name="suitableTo"  value="${pd.suitableTo}"/>
 <input type="hidden" name="storageCond"  value="${pd.storageCond}"/>
 <input type="hidden" name="forbiddenTo"  value="${pd.forbiddenTo}"/>
 <input type="hidden" name="pack"  class="input" value="${pd.pack}"/>
 <input type="hidden" value="${pd.imgPath1}" name="imgPath1"  class="input" id="imgPath1" >
 <input type="hidden" value="${pd.imgPath2}" name="imgPath2"  class="input" id="imgPath2" >
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
  var frm1 = document.frmNew1; 
  var frm2 = document.frmNew2; 
  $(frm1).submit(function(){return false;});
  $(frm2).submit(function(){return false;});
  $("#miSubmit").click(function(){
	   var ret = $.validateForm(frm1);	   
	   if(ret){
		   document.frmSvc.elements["pdname"].value=frm1.elements["name1"].value;
		   document.frmSvc.elements["refPrice"].value=frm1.elements["refPrice1"].value;
		   document.frmSvc.elements["size"].value=frm1.elements["size"].value;
		   document.frmSvc.elements["descript"].value=frm1.elements["descript1"].value;
	   }else
		   return;
	   if($(":checked[ck]").length == 0){
		   alert('请选择服务类型!');
		   return;
	   }
	   var svc = '';
	   var svcNms = '';
	   $(":checked[ck]").each(function(){
		   svc += (this.id+',');
		   svcNms += ($("label[ckLabel='"+this.id+"']").html() + ',');
	   });
	   if(svcNms.length > 0)
		   svcNms = svcNms.substr(0,svcNms.length-1);
	   document.frmSvc.elements["servTps"].value = svc;
	   document.frmSvc.elements["servTpName"].value = encodeURIComponent(svcNms);
	   ret = $.validateForm(frm2);
	   if(ret){
		   if($("#imgPath1").val() == ''){
		       alert('请至选择第一张图片');
			   return false;
		   }
		   document.frmSvc.elements["materials"].value=frm2.elements["materials"].value;
		   document.frmSvc.elements["useMethod"].value=frm2.elements["useMethod"].value;
		   document.frmSvc.elements["useStep"].value=frm2.elements["useStep"].value;
		   document.frmSvc.elements["suitableTo"].value=frm2.elements["suitableTo"].value;
		   document.frmSvc.elements["storageCond"].value=frm2.elements["storageCond"].value;
		   document.frmSvc.elements["forbiddenTo"].value=frm2.elements["forbiddenTo"].value;
		   document.frmSvc.elements["pack"].value=frm2.elements["pack"].value;
	   }else
		   return;
	   document.frmSvc.submit();
  });
  $(function(){
	  showImg(1,'${pd.imgPath1}');
	  showImg(2,'${pd.imgPath2}');
	  <c:forEach items="${pd.serviceList}" var="svc">
        var ckbox = $(":checkbox[ck='${svc.id}']");
        if(ckbox.size())
            ckbox.get(0).checked = true;
	  </c:forEach>
	  $("INPUT[name='ffup']").click(function(){
		  var me$ = $(this);
		  var fm = me$.closest("FORM").get(0);
		  if(fm.imageFile.value=='' ||
		     fm.imageFile.value.toLowerCase().indexOf(".jpg") != fm.imageFile.value.length - 4)
		  {
			  	     alert('请选择.jpg类型的图片文件!');
			  	     return;
		  }
		  fm.submit();
	  });
	  if('1' == '${readonly}'){
		$("input,textarea,select").attr("readonly","true");
		$("#miSubmit").hide();
		$("#goback").closest("A").attr("href","${ctx}mb/resAppList.form");
	  }
  });
</script>
</html>