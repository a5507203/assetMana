<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>

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

	function printpage() {
	document.body.innerHTML=document.getElementById('printContent').innerHTML;
	window.print();
	window.location.reload();
	}

</script>

</head>

<body class="tz_body2"  onload="beginrefresh();">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>

<div class="tz_mainbody2" style="height:550px;">
<div class ="tz_center_content">
<div class="tz_right_content">


<img src="${ctx}images/stat_mg.gif"  />
<img id="print" style="cursor:pointer;" onClick="printpage();" src="${ctx}images/b_print.jpg" alt="打印" title="打印" />
<div id="printContent" class="tz_box" style="height:450px;">
  <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="15%">
       <col width="15%">
       <col width="15%">
       <col width="16%">
	     <col width="8%">
	       <col width="8%">
	       <col width="20%">
     </COLGROUP>
     <thead>
 
      <tr bgcolor="#E6F5FA">
       <th>用户Mac</th>
       <th>用户IP</th>
       <th>主机名</th>
       <th>交换机IP</th>
       <th>端口</th>
       <th>事件</th>
       <th>时间</th> 
      </tr>
     </thead>
     <tbody>
       <c:forEach items="${historyList}" varStatus="st" var="his">
        <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
          
          <td class='al_center'>${his.userMac}</td>
          <td class='al_center'>${his.userIp}</td>
          <td class='al_center'>${his.hostName}</td>
			<td class='al_center'>${his.switchIp}</td>
	        <td class='al_center'>${his.port}</td>
          <td class='al_center'>
            <c:if test="${his.upAndDown eq 1}">下线</c:if>
            <c:if test="${his.upAndDown eq 2}">上线</c:if>
          </td>
         <td class='al_center'>${his.time}</td>
        </tr>
      </c:forEach>
     </tbody>
   </table>
   
</div>

</div><!--end of right content-->

</div>
</div>

<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>