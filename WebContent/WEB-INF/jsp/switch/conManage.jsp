<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}css/toggleElements3.css" />
<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}js/jquery-latest.pack.js"></script>
<script type="text/javascript" src="${ctx}js/jquery.toggleElements.pack.js"></script>
<link type='text/css' href='${ctx}css/left_style.css' rel='stylesheet' media='screen' />

<link type='text/css' href='${ctx}css/basic2.css' rel='stylesheet' media='screen' />
<script type='text/javascript' src='${ctx}js/jquery.simplemodal.js'></script>


<script type="text/javascript">
var refreshPeriod=${refreshPeriod};
var autoRefreshFlag=${autoRefreshFlag};
	function beginrefresh(){
	  if (!autoRefreshFlag) {
	    return
	  }
	  if (refreshPeriod == 1) {
	    window.location.reload();
	  } else {
	    refreshPeriod -= 1;
	    curmin=Math.floor(refreshPeriod/60);
	    cursec=refreshPeriod%60;
	    if (curmin!=0) {
	      curtime=curmin+" min "+cursec+" sec ";
	    } else {
	      curtime=cursec+" sec ";
	    }
	    window.status=curtime;
	    setTimeout("beginrefresh()",1000);
	  }
	}
	$(document).ready(function(){
		$('div.tyy').toggleElements( { fxAnimation:'show', fxSpeed:'slow', className:'toggler3' } );
	});

	$(function(){
		$("#findUsers").click(function(){
			$("#frmQry").attr("target","").attr("action","${ctx}switch/authManage.form").submit();
		});
	});

	function SetToHubMode(telnetUserName,portId,switchIp,port,password,enable_password,hub_max) {


		var p0 =document.getElementById("telnetUserName");
		p0.value = telnetUserName;
		
		var p1= document.getElementById("p_switch");
		p1.innerText = switchIp;
		var p2 =document.getElementById("p_port");
		p2.innerText = port;
		var p3 =document.getElementById("password");
		p3.value = password;
		var p4 =document.getElementById("enablePassword");
		p4.value  = enable_password;
		var p5= document.getElementById("hubMax");
		p5.value  = hub_max;
		document.tohubfrm.id.value = portId;
		$('#basic-modal-content').modal();
	}

	function SetToNormalMode(portId) {
		document.toNormalfrm.portId.value = portId;
		document.toNormalfrm.submit();
	}

	function connPort(portId) {
		document.connportfrm.portId.value = portId;
		document.connportfrm.submit();
	}

	function disconnPort(portId) {
		document.disconnportfrm.portId.value = portId;
		document.disconnportfrm.submit();
	}

</script>
</head>

<body class="tz_body2" onload="beginrefresh();">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="tz_mainbody2" style="height:550px;">
<!--注册条款 -->
<div class ="tz_center_content">
<div class="tz_right_content">

<img src="${ctx}images/connect_mg.gif"  />
<div class ="tz_sub_left">
 <div class= "tz_sub_left_box">
 <div id="sidebar" style="height:550px" >
 <center>
	<ul>
		<li><h3 class="cat">查询</h3></li>
		<li><a href ="${ctx}switch/conManage.form">全部查询</a></li>
		<li><h3 class="cat"> 交换机列表</h3></li>
		<c:forEach items="${switchList}" varStatus="st" var="swt">
			<li><a<c:if test="${swt.id eq conQryItem.switchId}"> class="selected"</c:if>
			<c:if test="${empty conQryItem.switchId or swt.id ne conQryItem.switchId}"> class="good"</c:if>
			 href ="${ctx}switch/conManage.form?switchId=${swt.id}">${swt.switchIp}
			<c:if test="${not empty swt.switchName}">(${swt.switchName})</c:if></a></li>
		</c:forEach>
	</ul>
	</center>
</div>

 </div>
</div>

<div  class= "tz_sub_right">
<div class="tz_sub_right_box" style="height:550px;overflow: auto;">


<div class="tyy" style="width:610px;" title="打开操作面板 ">
<div class= "tz_panel_box" style="height:80px;width:590px;">
<form id="frmQry" method="post">
<p align="center">
详细查询 <br/>&nbsp;&nbsp;在线状态：
    <select size="1" name="connectStatus" class="input" style ="width:120px">
    <option value="">全部</option>
	<option value="1"<c:if test="${conQryItem.connectStatus eq 1}"> selected="selected"</c:if>>强制断开</option>
	<option value="2"<c:if test="${conQryItem.connectStatus eq 2}"> selected="selected"</c:if>>正常</option>
	<option value="3"<c:if test="${conQryItem.connectStatus eq 3}"> selected="selected"</c:if>>正在断开</option>
	<option value="4"<c:if test="${conQryItem.connectStatus eq 4}"> selected="selected"</c:if>>正在恢复</option>
    </select>&nbsp;&nbsp;端口模式：
    <select size="1" name="vlanName" class="input" style ="width:120px">
    <option value="">全部</option>
    </select>
<img id="findUsers" style="cursor:pointer;" src="${ctx}images/query.gif" alt="查询" title="查询" />
</p>
<input type="hidden" id="switchId" name="switchId" value="${conQryItem.switchId}"/>
</form>
<br>
<hr style="width:500px;">
</div>

</div>


<div id="basic-modal-content">
<form name="tohubfrm"  method="POST" action="${ctx}switch/updateToHub.form" > 
	<h3>转换端口为普通模式</h3>
	<br/><input type="hidden" name="id" id="id" value=""/>
	<center>
		<h2>交换机：<label id ="p_switch" style ="width:100px;"></label>
		&nbsp;&nbsp;Port:&nbsp;&nbsp;<label id ="p_port"  style ="width:100px;"></label></h2> 
		<br>
	<p>登录名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="telnetUserName" name ="telnetUserName" type ="text" style ="width:200px"></input></p>
	<p>登录密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="password" name ="password" type ="password" style ="width:200px"></input></p>
	<p>系统权限密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="enablePassword" name ="enablePassword" type ="password" style ="width:200px"></input></p>
	<p>最大使用用户数:&nbsp;&nbsp;<input id="hubMax" name ="hubMax" type ="text" style ="width:200px"></input></p>
	<br/>
	<input type="hidden" id="switchId" name="switchId" value="${conQryItem.switchId}"/>
	<input type="image" src="${ctx}images/deliver.jpg" />
	</center>
</form>
</div>

<div style="width:610px;height:400px;float:left">
  <br/>
  <table id="user_list" style="width:570px;" cellspacing="0" cellpadding="0" border="0">
    <COLGROUP>
      <col width="20%">
      <col width="10%">
      <col width="20%">
      <col width="20%">
      <col width="20%">
      <col width="10%">
    </COLGROUP>
    <thead>
      <tr bgcolor="#E6F5FA">
 		<th>交换机</th>
        <th>端口</th>
        <th>端口状态</th>
        <th>端口模式</th>
        <th>端口控制 </th>
        <th>模式 </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${portList}" varStatus="st" var="pl">
        <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
          <td class='al_center'>${pl.switchIp}<c:if test="${not empty pl.switchName}">(${pl.switchName})</c:if></td>
          <td class='al_center'>${pl.port}</td>
          <td class='al_center'>
            <c:if test="${pl.connectStatus eq 1}">强制断开</c:if>
            <c:if test="${pl.connectStatus eq 2}">正常</c:if>
            <c:if test="${pl.connectStatus eq 3}">正在断开</c:if>
            <c:if test="${pl.connectStatus eq 4}">正在恢复</c:if>
          </td>
             <td class='al_center'>
            <c:if test="${pl.hubModeStatus eq 1}">认证模式</c:if>
            <c:if test="${pl.hubModeStatus eq 2}">普通模式 </c:if>
            <c:if test="${pl.hubModeStatus eq 3}">正在设置为普通模式</c:if>
            <c:if test="${pl.hubModeStatus eq 4}">正在恢复为认证模式</c:if>
          </td>
          <td class='al_center'>
            <c:if test="${pl.connectStatus eq 1}"><a style="cursor:pointer" href="#" id="tz_sub_b_connect"  onclick="connPort('${pl.id}');"> </a></c:if>
            <c:if test="${pl.connectStatus eq 2}"><a style="cursor:pointer" href="#" id="tz_sub_b_dis_connect"  onclick="disconnPort('${pl.id}');"> </a></c:if>
  			  <c:if test="${pl.connectStatus eq 3}"><a style="cursor:pointer" href="#" id="tz_sub_b_connect"  onclick="connPort('${pl.id}');"> </a></c:if>
            <c:if test="${pl.connectStatus eq 4}"><a style="cursor:pointer" href="#" id="tz_sub_b_dis_connect"  onclick="disconnPort('${pl.id}');"> </a></c:if>
          </td>
             <td class='al_center'>

            <c:if test="${pl.hubModeStatus eq 1}"><a style="cursor:pointer" href="#" onClick="SetToHubMode('${pl.telnetUserName}','${pl.id}','${pl.switchIp}','${pl.port}','${pl.password}','${pl.enablePassword}','${pl.hubMax}')" id="tz_sub_b_hub_mode"> </a></c:if>
            <c:if test="${pl.hubModeStatus eq 2}"><a style="cursor:pointer" href="#" onClick="SetToNormalMode('${pl.id}')" id="tz_sub_b_check_mode"> </a></c:if>
  			<c:if test="${pl.hubModeStatus eq 3}"><a style="cursor:pointer" href="#" onClick="SetToHubMode('${pl.telnetUserName}','${pl.id}','${pl.switchIp}','${pl.port}','${pl.password}','${pl.enablePassword}','${pl.hubMax}')" id="tz_sub_b_hub_mode"> </a></c:if>
            <c:if test="${pl.hubModeStatus eq 4}"><a style="cursor:pointer" href="#" onClick="SetToNormalMode('${pl.id}')" id="tz_sub_b_check_mode"> </a></c:if>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</div>
</div><!--end of sub right content-->
</div><!--end of right content-->


</div>

</div>

<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>

<c:if test="${not empty retMsg}">
	<script>
	  alert("${retMsg}");
	</script>
</c:if>

<form id="connportfrm" name="connportfrm" method="get" action="${ctx}switch/connPort.form">
	<input type="hidden" name="portId" value="" />
	<input type="hidden" name="switchId" value="${conQryItem.switchId}" />
</form>
<form id="disconnportfrm" name="disconnportfrm" method="get" action="${ctx}switch/disconnPort.form">
	<input type="hidden" name="portId" value="" />
	<input type="hidden" name="switchId" value="${conQryItem.switchId}" />
</form>
<form name="toNormalfrm"  method="POST" action="${ctx}switch/updateToNormal.form" > 
	<input type="hidden" name="portId" value=""/>
	<input type="hidden" name="switchId" value="${conQryItem.switchId}" />
</form>
</body>
</html>
