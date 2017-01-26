<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<!-- Contact Form modual CSS files -->
<link type='text/css' href='${ctx}css/basic.css' rel='stylesheet' media='screen' />

<link rel="stylesheet" type="text/css" href="${ctx}css/GooCalendar.css"/>
<script  type="text/javascript" src="${ctx}js/GooFunc.js"></script>
<script  type="text/javascript" src="${ctx}js/GooCalendar.js"></script>

<script type="text/javascript">

var property2={
	divId:"tz_box",//日历控件最外层DIV的ID
	needTime:true,//是否需要显示精确到秒的时间选择器，即输出时间中是否需要精确到小时：分：秒 默认为FALSE可不填
	yearRange:[1970, 2099],//可选年份的范围,数组第一个为开始年份，第二个为结束年份,如[1970,2030],可不填
	week:['日','一','二','三','四','五','六'],//数组，设定了周日至周六的显示格式,可不填
	month:['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],//数组，设定了12个月份的显示格式,可不填
	format:"yyyy-MM-dd hh:mm:ss"
	/*设定日期的输出格式,可不填*/
};

$(document).ready(function(){
	//canva1=$.createGooCalendar("calen",property);
	vdate=$.createGooCalendar("vdate",property2);
	vdate.setDate('${vTime}');
});

function upTimeSubmit() {
	var frm = document.frmUpDate;
	frm.submit();
}

</script>

</head>

<body class="tz_body2">
<div class="tz_mainbody2" style="height:550px;">
<!--注册条款 -->
<div class ="tz_center_content">
<div class="tz_right_content">

<form name="frmUpDate"  method="POST" action="${ctx}switch/updateVDateTime.form" > 
<div>
	<h3>输入本用户的有效认证时间 </h3><br/>
	<p>有效时间 	<input id="vdate" name ="vdate" type ="text" style ="width:200px" value="${vTime}"></input></p><br/>
	<input type="hidden" id="uid" name="uid" value="${userId}" />
	&nbsp;&nbsp;&nbsp;&nbsp;<a onClick="upTimeSubmit()"  ><img src="${ctx}images/deliver.jpg"  style="cursor:pointer;"></a>
</div>
</form>

</div><!--end of right content-->

</div>

</div>

</body>

</html>
