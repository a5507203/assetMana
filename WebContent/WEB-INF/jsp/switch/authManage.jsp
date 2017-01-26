<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}css/toggleElements3.css" />

<!-- Contact Form modual CSS files -->
<link type='text/css' href='${ctx}css/basic.css' rel='stylesheet' media='screen' />

<script src="${ctx}js/admin/audit_user.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}js/jquery-latest.pack.js"></script>
<script type="text/javascript" src="${ctx}js/jquery.toggleElements.pack.js"></script>

<script type='text/javascript' src='${ctx}js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='${ctx}js/basic.js'></script>

<script type="text/javascript" src="${ctx}js/jquery.dynDateTime.pack.js"></script>
<script type="text/javascript" src="${ctx}js/calendar-en.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}css/calendar-green.css"  />

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
	var curTime;
	$(document).ready(function(){
		$('div.tyy').toggleElements( { fxAnimation:'show', fxSpeed:'slow', className:'toggler3' } );
	});

	$(function(){
		$("#findUsers").click(function(){
			$("#frmQry").attr("target","").attr("action","${ctx}switch/authManageQuery.form").submit();
		});
	});

	function showDate() {
		$("#dateFlat").dynDateTime({
			showsTime: true,
			ifFormat: "%Y-%m-%d %H:%M",
			flat: ".next()"
		});
	}

function addSwitchSubmit() {
	var mac_addr = /^[A-Fa-f\d]{2}\-[A-Fa-f\d]{2}\-[A-Fa-f\d]{2}\-[A-Fa-f\d]{2}\-[A-Fa-f\d]{2}\-[A-Fa-f\d]{2}$/;
	var frm = document.frmSend;
	if (!mac_addr.test(frm.mac.value)) {
		alert("mac地址格式不正确！mac地址格式为00-24-21-19-BD-E4");
		frm.mac.focus();
		return;
	}
	frm.submit();
}

function upTimeSubmit() {
	var frm = document.frmUpDate;
	frm.submit();
}



function delUser(userId, userMac, checkStatus) {
	if (checkStatus == 2) {
		alert("已认证用户不能删除，请先取消其认证后再进行删除！");
		return;
	}
	if(confirm("确定要删除用户:"+userMac + "?")){
		document.delusrfrm.userId.value = userId;
		document.delusrfrm.userMac.value = userMac;
		var frm = document.delusrfrm;
		frm.submit();
    }else{    
   		return;
    }
}

function SetUpCurTime(userId, myTime) {
	document.frmUpDate.userId.value = userId;
	if (myTime.length <= 0){
		document.frmUpDate.dateDef.value = "2099-01-01 00:00";
	} else {
		document.frmUpDate.dateDef.value = myTime;
	}
	$('#time-content').modal({
		onShow:showDate
	});
}

function authUser(userId, userMac) {
	document.authusrfrm.userId.value = userId;
	document.authusrfrm.userMac.value = userMac;
	document.authusrfrm.submit();
}


function cancelAuthUser(userId, userMac) {
	document.canauthusrfrm.userId.value = userId;
	document.canauthusrfrm.userMac.value = userMac;
	document.canauthusrfrm.submit();
}

function refreshSetting(){
	   var period = window.prompt("请输入自动更新时间（单位为秒）","30");
	   if(period && period!='' && parseInt(period, 10) == period){
		   $.ajax({
			   type:'POST',
			   dataType:'json',
			   url:ctx + 'switch/autoRefSet.form',
			   data:{'flag':'true','period':period},
			   success:function(data){
				   alert('页面自动更新设置成功！');
				   window.location.reload();
			   }
		   });
		} else {
			alert('请输入正确的整数！');
		}
}

function refreshCancel(){
	if(confirm("确定要取消自动更新?")){
		$.ajax({
			   type:'POST',
			   dataType:'json',
			   url:ctx + 'switch/autoRefSet.form',
			   data:{'flag':'false','period':'30'},
			   success:function(data){
				   alert('取消自动更新设置成功！');
				   window.location.reload();
			   }
		 });
    }else{
   		return;
    }
}

function printpage() {
document.body.innerHTML=document.getElementById('printContent').innerHTML;
window.print();
window.location.reload();
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


<img src="${ctx}images/check_mg.gif"  />

<div class="tz_box" style="height:550px;background:url(../images/center_bg.gif) no-repeat center top;overflow: auto;">

<div class="tyy" style="width:730px;" title="打开操作面板 ">
<div class= "tz_panel_box">
<form id="frmQry" method="post">
<p align="center">
	详细查询<br/>
	用户名：<input type="text" name="hostName" class="input" style="width:150px" value="${authQryItem.hostName}"/>
	用户MAC：<input type="text" name="userMac" class="input" style="width:150px" value="${authQryItem.userMac}"/>
	用户IP：<input type="text" name="userIp" class="input" style="width:150px" value="${authQryItem.userIp}"/><br/><br/>
	交换机：<select size="1" name="switchId" class="input" style ="width:200px">
    <option value="">全部</option>
    <c:forEach items="${switchList}" var='switch'>
	  <c:if test="${not empty switch.id}">
	  <option value="${switch.id}"<c:if test="${switch.id eq authQryItem.switchId}"> selected="selected"</c:if>>
	    ${switch.switchIp}<c:if test="${not empty switch.switchName}">(${switch.switchName})</c:if>
	  </option>
	  </c:if>
	</c:forEach>
    </select>&nbsp;&nbsp;Vlan：
    <select size="1" name="vlan" class="input" style ="width:80px">
    <option value="">全部</option>
    <c:forEach items="${vlanList}" var='vlanItem'>
      <c:if test="${not empty vlanItem}">
	  <option value="${vlanItem}"<c:if test="${vlanItem eq authQryItem.vlan}"> selected="selected"</c:if>>${vlanItem}</option>
	  </c:if>
	</c:forEach>
    </select>&nbsp;&nbsp;认证状态：
    <select size="1" name="checkStatus" class="input" style ="width:80px">
    <option value="">全部</option>
	<option value="1"<c:if test="${authQryItem.checkStatus eq 1}"> selected="selected"</c:if>>未认证</option>
	<option value="2"<c:if test="${authQryItem.checkStatus eq 2}"> selected="selected"</c:if>>已认证</option>
    </select>&nbsp;&nbsp;在线状态：
    <select size="1" name="connectStatus" class="input" style ="width:120px">
    <option value="">全部</option>
	<option value="1"<c:if test="${authQryItem.connectStatus eq 1}"> selected="selected"</c:if>>下线</option>
	<option value="2"<c:if test="${authQryItem.connectStatus eq 2}"> selected="selected"</c:if>>在线</option>
    </select>
    <br/> <br/>
<img id="findUsers" style="cursor:pointer;" src="${ctx}images/query.gif" alt="查询" title="查询" />
</p>
</form>

<hr style="width:700px">

<p align="center">
	用户操作 <br />
<img id="add_mac" style="cursor:pointer;" src="${ctx}images/b_add_mac.jpg" alt="" title="" />
<img id="data_refresh" style="cursor:pointer;" onClick="window.location.reload();" src="${ctx}images/b_data_refresh.jpg" alt="" title="" />
<img id="refresh_setting" style="cursor:pointer;" onClick="refreshSetting();" src="${ctx}images/b_refresh_setup.jpg" alt="自动更新设置" title="自动更新设置" />
<img id="refresh_cancel" style="cursor:pointer;" onClick="refreshCancel();" src="${ctx}images/b_refresh_stop.jpg" alt="取消自动更新" title="取消自动更新" />
<img id="print" style="cursor:pointer;" onClick="printpage();" src="${ctx}images/b_print.jpg" alt="打印" title="打印" />
</p>
<div id="basic-modal-content">
<form name="frmSend"  method="POST" action="${ctx}switch/addNewMac.form" > 
	<h3>添加Mac信息</h3><br/>
<br style ="line-height:50px;"/>
	<center>
	<p>添加     MAC 地址	|<input id="mac" name ="mac" type ="text" style ="width:200px"></input></p><br/><br/>
	<p>                  例如00-1d-72-56-ef-c4或00-1D-72-56-EF-C4</p>
<br style ="line-height:105px;"/>
	<a onClick="addSwitchSubmit()"  ><img src="${ctx}images/deliver.jpg"  style="cursor:pointer;"></a>
	</center>
</form>
</div>

</div>
</div>


<div id="time-content">
<form name="frmUpDate"  method="POST" action="${ctx}switch/updateVTime.form" > 
	<h3>输入本用户的有效认证时间 </h3><br/>
	<div style="float:left;margin-left:20px">
	<input id="userId" name ="userId" type ="hidden" value=""></input>
	<input type="text" name="dateDef" id="dateFlat" value="" style ="width:230px" />
	<div style="float: left;">&nbsp;</div>
	<div style="clear: both;"></div><br />
	<div style="float:left;margin-left:35px"><a onClick="upTimeSubmit()">
	<img src="${ctx}images/deliver.jpg"  style="cursor:pointer;"></a></div>
	</div>
</form>
</div>



<div id="printContent" style="width:770px;height:500px;overflow:visable;float:left">
  <br/>
  <table id="user_list2"   cellspacing="0" cellpadding="0" border="0">
    <COLGROUP>
         <col width="7%">
      <col width="9%">
      <col width="9%">
      <col width="8%">
      <col width="9%">
      <col width="3%">
      <col width="4%">
      <col width="7%">
      <col width="10%">
      <col width="6%">
      <col width="6%">
           <col width="6%">
    </COLGROUP>
    <thead>
      <tr bgcolor="#E6F5FA">
         <th>在线</th>
        <th>交换机</th>
        <th>MAC地址</th>
        <th>端口</th>
        <th>IP地址</th>
        <th>主机名</th>
        <th>Vlan</th>
        <th>状态</th>
        <th>有效期</th>
        <th>操作</th>
		<th>限期</th>
		<th>删除</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${userList}" varStatus="st" var="usr">
        <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
     	<td class='al_center'>
            <c:if test="${usr.connectStatus eq 1}"><img src="${ctx}images/m_leave5.png" width="24" height="24"  /></c:if>
            <c:if test="${usr.connectStatus eq 2}"><img src="${ctx}images/m_come.png"   width="24" height="24" /></c:if>
          </td>
          <td class='al_center'>${usr.switchIp}<c:if test="${not empty usr.switchName}">(${usr.switchName})</c:if></td>
          <td class='al_center'>${usr.userMac}</td>
          <td class='al_center'>${usr.localPort}</td>
          <td class='al_center'>${usr.userIp}</td>
          <td class='al_center'>${usr.hostName}</td>
          <td class='al_center'>${usr.vlan}</td>
          <td class='al_center'>
            <c:if test="${usr.checkStatus eq 1}">未认证</c:if>
            <c:if test="${usr.checkStatus eq 2}">已认证</c:if>
          </td>
          <td class='al_center'>${usr.volidateTime}</td>

          <td class='al_center'>
            <c:if test="${usr.checkStatus eq 1}"><a style="cursor:pointer" href="#" id="tz_sub_b_check" onclick="authUser('${usr.id}', '${usr.userMac}');"> </a></c:if>
            <c:if test="${usr.checkStatus eq 2}"><a style="cursor:pointer" href="#" id="tz_sub_b_un_check" onclick="cancelAuthUser('${usr.id}', '${usr.userMac}');"></a></c:if>
          </td>
          <td class='al_center'>
            <a onClick="SetUpCurTime('${usr.id}', '${usr.volidateTime}')" href="#" id="tz_sub_b_set_up"> </a>
          </td>
      	<td class='al_center'>
          <a onClick="delUser('${usr.id}', '${usr.userMac}', '${usr.checkStatus}')" href="#" id="tz_sub_b_del"> </a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</div>

</div><!--end of right content-->

</div>

</div>

<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
<c:if test="${not empty retMsg}">
	<script>
	  alert("${retMsg}");
	</script>
</c:if>
<form id="authusrfrm" name="authusrfrm" method="post" action="${ctx}switch/authUser.form">
	<input type="hidden" name="userId" value="" />
	<input type="hidden" name="userMac" value="" />
</form>
<form id="canauthusrfrm" name="canauthusrfrm" method="post" action="${ctx}switch/cancelAuthUser.form">
	<input type="hidden" name="userId" value="" />
	<input type="hidden" name="userMac" value="" />
</form>
<form id="delusrfrm" name="delusrfrm" method="post" action="${ctx}switch/delUser.form">
	<input type="hidden" name="userId" value="" />
	<input type="hidden" name="userMac" value="" />
</form>



</body>

</html>
