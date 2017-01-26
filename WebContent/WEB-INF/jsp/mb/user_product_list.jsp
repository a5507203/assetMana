<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/mb/res_app_info.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<body class ="body_user" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

<form name="frmNew" method="POST" action="${ctx}mb/step_new_resAppInfoPost.form">
<input type="hidden" name="resType" value="${param.sTp}"></input>
<div class ="user_body">


<TABLE WIDTH=1000 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<jsp:include page="/WEB-INF/jsp/user_header.jsp"></jsp:include>
	<TR>
		<TD><jsp:include page="/WEB-INF/jsp/user_left.jsp"></jsp:include></TD>
		<TD COLSPAN=6 valign="top">
		<div class ="tee_right">
		
			<IMG SRC="${ctx}imag88/product_app.jpg" ALT="">	
			

		 <div style="width:710px;height:466px;overflow: scroll;float:left">
		   <table id="user_list"  cellspacing="0" cellpadding="0" border="0" align="center">
		     <COLGROUP>
		       <col width="20%">
		       <col width="20%">
		       <col width="20%">
		       <col width="20%">
       		       <col width="20%">
		     </COLGROUP>
		  
		     <thead>
		      <tr bgcolor="#E6F5FA">
		       <th><input type="checkbox"  id="ckAll2"></input></th>
		       <th>展品图片</th>
		       <th>名称</th>
		       <th>申请套数</th>
		        <th>查看详情</th>
		      </tr>
		     </thead>
		     <tbody>
		     <c:forEach items="${resAppList}" varStatus="st" var="app">
		       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
			       <td class='al_center'><input name="resIds" type="checkbox" onClick="cur_count()" value="${app.id}" restp='${param.sTp}'></input>
			       </td>
			       <td class='al_center'><img class="little_img" src='${ctx}${app.imgPath1}'></img></td>
			       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.id}&sTp=${param.sTp}','${app.id}')" style="cursor:pointer;">${app.name}</a></td>
  <td class='al_center'><input name="orderNums" id="Inumber" class='input al_center' type="text" onblur ="if(value == '') value='1'; cur_count();"  onkeyup="value=value.replace(/[^\d]/g,'')
;N_check();" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace
(/[^\d]/g,''))" value="1" style="width:50px;"></input></td>
			       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.id}&sTp=${param.sTp}','${app.id}')" style="cursor:pointer;" target="_blank">详情</a></td>
		       </tr>
		     </c:forEach>
		     </tbody>
		   </table>
		</div>


		
			<div style="width:700px;font-size:14px;overflow:hidden;float:top;text-align:center;">
 			<center>
 			<font color="#660066">当前已经申请<label name ="sel_count"  id="sel_count"  style="width:200px;">0</label>件展品，总价格 .本型号大篷车</font><font color="#ff0000">至少需要申请${sCount}元 展品,至多${maxCount}元展品.</font><br>
 			
 			<br>
			<table align="center" width="60%">
			<tr>
			<!-- <td ><a id = "theLink_add_product" onClick="openthewindow('${ctx}mb/new_resAppInfo.form?sTp=3')" style="cursor:pointer;"></a></td> -->
			<td ><a id = "theLink_preview"  onClick="b_confirm()"; style="cursor:pointer;" ></a></td>
			<td><a id = "theLink_stop" href="${ctx}index.htm"></a></td>
			</tr>
			</table>
			</center>
			</div>

   </div></TD>
	</TR>
	<TR>
		<TD COLSPAN=7>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_10.jpg" WIDTH=1000 HEIGHT=83 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=196 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=123 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=109 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=115 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=112 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=111 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=234 HEIGHT=1 ALT=""></TD>
	</TR>
</TABLE>


</div>

</form>
</body>
<script  type="text/javascript">
function b_confirm()
{ 

	reconfirm(${sCount},${maxCount});
	

	

} 
function cur_count()
{ 

var countPrice=0;
var tableObj = document.getElementById("user_list");
var str = "";
for(var i=1;i<tableObj.rows.length;i++)
{
	
   	if(tableObj.rows[i].cells[0].firstChild.checked)
	{
		 var text = tableObj.rows[i].cells[3].firstChild;
  		 count += parseInt(text.value);

	}
}

var selc = document.getElementById("sel_count");
selc.innerText=count;


} 


function N_check() 
{       


} 

$(function(){
   var frm = document.frmNew; 
   $(frm).submit(function(){return false;});
   $("#ckAll2").click(function(){
	   var cked = this.checked;
	   $(":checkbox[name='resIds']").each(function(){
		   this.checked = cked;
	   });

cur_count();


   });
})




</script>
</html>