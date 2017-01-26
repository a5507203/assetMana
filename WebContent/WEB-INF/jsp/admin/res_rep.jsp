<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<link href="${ctx}css/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" />
<script src="${ctx}js/jquery-ui.min.js" type="text/javascript"></script>
<style>
.rep_tb{
	width:650px;
	border:1px solid;
}
.rep_tb tr{
 height:30px;
}
.rep_tb td,table th{
	border-width:1px;
	border-style:solid;
	padding-left:2px;
	padding-right:2px;
	text-align: center;
}
</style>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_static"/></jsp:include>
<div class="mainbody" style="height:1000px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid2">
<div class="newreg" style="height:850px;">
<ul>
 <li style="line-height:33px;padding-bottom:3px;background:url(${ctx}imag33/title_low.jpg) repeat-x scroll 0px 3px;">
 <a href="${ctx}index.htm" >首页</a>&gt;统计分析
 </li>
 </ul>
  <form id="frmQry" method="GET" >
 <img  id="rep" src="${ctx}imag66/b_compute.jpg" class="button">
 <img  id="exportExcel" src="${ctx}imag66/b_excel.jpg" class="button">
 <img  id="saveExcel" src="${ctx}imag66/v_data_c.jpg" class="button">
 <a href='${ctx}admin/reportList.form'><img  id="saveExcel" src="${ctx}imag66/v_data_old.jpg" class="button"></a>

 <ul>
 <li class="hd" style="text-align: left">
	资源类型：<select size="1" name="sType" class="input">
	<code:codeList codeTable="B_RES_TYPE" value="${sType}"></code:codeList>
	</select>&nbsp;&nbsp;
	从<input type="text" id="from" name="from" value="${from}"readonly style="width:90px;"></input>&nbsp;&nbsp;
	到<input type="text" id="to" name="to" value="${to}"readonly style="width:90px;"></input>
	&nbsp;所属市区：<select name="sBranch"  class="input" size=1 style="width:90px;">
	<option value="">全部</option>
	<code:codeList codeTable="b_branch" value="${sBranch}" ></code:codeList>
	</select>
	&nbsp;项目归类：<select name="sBatch" class="input" size=1 style="width:90px;">
	<option value="">全部</option>
	<code:codeList codeTable="b_batch" value="${sBatch}"></code:codeList>
	</select>
 </li>
 </ul>
 <div style="width:680px;height:500px;overflow: auto;float:left">
   <table class="rep_tb" cellspacing="0" cellpadding="0" border="0" width="680" border="1">
    <c:out value="${rep}" escapeXml="false"></c:out>
   </table>
  </div>
 </form>
</div>
</div>
</div>
<div style="clear:both;"></div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
<iframe id="targFrm" name="targFrm" style="display:none"></iframe>
<script type="text/javascript">
  $(function(){
	  $("#from,#to").datepicker({'dateFormat': 'yy-mm-dd','currentText': '今天','closeText':'X','changeYear':true,'changeMonth':true,
		  dayNames: ['周日','周一','周二','周三','周四','周五','周六'],
		  dayNamesMin: ['周日','周一','周二','周三','周四','周五','周六'],
		  dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
		  monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
		  monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
		  nextText: '下',
		  prevText: '上'
		  });
	  $("#rep").click(function(){
		$("#frmQry").attr("target","").attr("action","${ctx}admin/resRep.form").submit();
	  });
	  $("#exportExcel").click(function(){
		$("#frmQry").attr("target","").attr("action","${ctx}admin/resRepXls.form").submit();
	  });
	  $("#saveExcel").click(function(){
		$("#frmQry").attr("target","targFrm").attr("action","${ctx}admin/saveRep.form").submit();
		alert('保存完毕');
	  });
  });
</script>
</html>