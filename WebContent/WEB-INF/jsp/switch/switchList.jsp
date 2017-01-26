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
<script type="text/javascript" src="${ctx}js/jquery-latest.pack.js"></script>
<script type='text/javascript' src='${ctx}js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='${ctx}js/basic.js'></script>

</head>	
<body class="tz_body2" onload="beginrefresh();">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="tz_mainbody2" style="height:550px;">
<!--注册条款 -->
<div class ="tz_center_content">
<div class="tz_right_content">
     
	
<img   src="${ctx}images/device_mg.gif"  />			
 
<div id="basic-modal-content">
<form name="frmSend"  method="POST" action="${ctx}switch/addNewSwitch.form" >
	<h3>手动添加交换机</h3>
<br style ="line-height:60px;"/>
<center>
	<p>交换机IP:   |<input id="switchIp" name="switchIp" type ="text" style ="width:200px"></input></p>
	 <br><br>
	<p>例如： 192.168.0.33</p><br>
 <br style ="line-height:105px;"/>
	 <a onClick="addSwitchSubmit()"  ><img src="${ctx}images/deliver.jpg"  style="cursor:pointer;"></a>
	</center>
</form>
</div>


		
	
	
			
	<div class="tz_box" style="height:550px;">
	<img src="${ctx}images/add_device.jpg" id="add_mac" style="cursor:pointer;"/>	
<br>
  <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="20%">
       <col width="15%">
       <col width="20%">
       <col width="35%">
       <col width="10%">
     </COLGROUP>
     <thead>
 
      <tr bgcolor="#E6F5FA">
       <th>交换机名</th>
       <th>交换机IP</th>
       <th>已启动时间 </th>
       <th>详细信息 </th>
       <th>删除</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${switchList}" varStatus="st" var="sw">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>     
	      	<td>${sw.switchName}</td>
	      	<td>${sw.switchIp}</td>
	       <td>${sw.upTime}</td>
	       <td>${sw.description}</td>
	       <td><a onClick="delSwitch('${sw.id}', '${sw.switchIp}')" href="#" id="tz_sub_b_del" ></a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>

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


<form id="delswitchfrm" name="delswitchfrm" method="get" action="${ctx}switch/delOneSwitch.form">
	<input type="hidden" name="switchId" value="" />
</form>

</body>
<script  type="text/javascript">
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
function addSwitchSubmit() {
	var ip_addr=/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
	var frm = document.frmSend;
	var ip = frm.switchIp.value;
	if (!ip_addr.test(ip)) {
		alert("IP地址格式不正确！IP地址格式为192.168.0.10");
		frm.switchIp.focus();
		return;
	}
	var ip_items = ip.split(".");
	if (ip_items[0] > 255 || ip_items[1] > 255 || ip_items[2] > 255 || ip_items[3] > 255) {
		alert("IP地址格式不正确！IP地址格式为192.168.0.10");
		frm.switchIp.focus();
		return;
	}
	frm.submit();
}

function delSwitch(switchId, switchIp) {
	if (confirm("确定要删除交换机:" + switchIp + "?")) {
		document.delswitchfrm.switchId.value = switchId;
		document.delswitchfrm.submit();
	} else {
		return;
	}
}

</script>
</html>
