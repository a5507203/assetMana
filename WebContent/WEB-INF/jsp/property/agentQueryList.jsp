<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="f_his"/></jsp:include>
 
		


<script type="text/javascript">

function showwin(id,name,type,address,suburb,state,postCode,mobile,email,note)
{

    document.getElementById( 'id' ).value = id;
    document.getElementById( 'name' ).value = name;
    document.getElementById( 'type' ).value = type;
    document.getElementById( 'address' ).value = address;
    document.getElementById( 'suburb' ).value = suburb;
    document.getElementById( 'state' ).value = state;
    document.getElementById( 'postCode' ).value = postCode;
    document.getElementById( 'mobile' ).value = mobile;
    document.getElementById( 'email' ).value = email;
    document.getElementById( 'note' ).value = note;
    var winNode = $("#win");
    winNode.fadeIn("slow");
}

function hide()
{
     
    var winNode = $("#win");
    winNode.fadeOut("slow");
}






function addAgentSubmit() {
	
	var frm = document.frmNew;

	frm.submit();
}
</script>
<body class="tz_body2">
<div class ="tz_mainbody2">
<br>

<div id="win" style="border: 1px red solid;display: none;   position: absolute;  top: 100px; left: 500px;">
     
     <div><jsp:include page="/WEB-INF/jsp/property/innerEditAgent.jsp"></jsp:include></div>
     <div ><center><input  onClick="hide()" value="Close "  type="button" class="button">
	</center>      
     </div>
     
</div>




<div >
<form   name="frmNew" id="frmNew"  method="GET"   action="${ctx}property/agentQuery.form">
<p align="center">
	id：<input type="text" name="id" class="input" style="width:150px" value=""/>
	name：<input type="text" name="name" class="input" style="width:150px" value=""/>
	mobile：<input type="text" name="mobile" class="input" style="width:150px" value=""/>
	<a onClick="addAgentSubmit()"  ><img src="${ctx}images/query.gif"  style="cursor:pointer;"></a>
	
	<br><br>
</p>
</form>
</div>




  <table id="agent_list"   cellspacing="0" cellpadding="0" border="0">
    <COLGROUP>
         <col width="2%">
      <col width="9%">
      <col width="9%">
      <col width="8%">
      <col width="9%">
      <col width="3%">
      <col width="4%">
      <col width="10%">
      <col width="20%">
      <col width="6%">
      <col width="6%">
           <col width="6%">
    </COLGROUP>
    <thead>
      <tr bgcolor="#36F5FA">
         <th>ID</th>
        <th>name</th>
        <th>type</th>
        <th>address</th>
        <th>suburb</th>
        <th>state</th>
        <th>postCode</th>
        <th>mobile</th>
        <th>email</th>
        <th>note</th>
		<th>修改</th>
		<th>删除</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${agentList}" varStatus="st" var="usr">
        <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
             <td class='al_center'>${usr.id}</td>
          <td class='al_center'>${usr.name}</td>
           <td class='al_center'>${usr.type}</td>
          <td class='al_center'>${usr.address}</td>
          <td class='al_center'>${usr.suburb}</td>
          <td class='al_center'>${usr.state}</td>
          <td class='al_center'>${usr.postCode}</td>
          <td class='al_center'>${usr.mobile}</td>
          <td class='al_center'>${usr.email}</td>
             <td class='al_center'>${usr.note}</td>
          <td class='al_center'>
            <a onclick="showwin('${usr.id}','${usr.name}','${usr.type}','${usr.address}','${usr.suburb}','${usr.state}','${usr.postCode}','${usr.mobile}','${usr.email}','${usr.note}')" href="#" id="tz_sub_b_set_up"> </a>
          </td>
      	<td class='al_center'>
          <a  href="${ctx}property/deleteAgent.form?userId=${usr.id}" id="tz_sub_b_del"> </a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>


</body>
</html>