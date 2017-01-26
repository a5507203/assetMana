<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>

<script src="${ctx}js/jwindow.js" type="text/javascript"></script>
<body>
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_approve"/></jsp:include>
</center>
<div class="mainbody" style="height:1000px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid2">
<!--注册条款 -->
<div class="newreg" style="height:auto;width:730px;">
<ul>
 <li>
	<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页&gt;
审批管理</a></td>
 		 </tr>
 		 	
 	</table>
 </li>
 </ul>
 <form id="frmQry" method="GET" action="${ctx}admin/resAppList.form">
 <ul>
 <li class="hd" style="text-align: left">
	资源类型：<select size="1" name="sType" class="input">
	<option value="">全部</option>
	<code:codeList codeTable="b_res_type" value="${sType}"></code:codeList>
	</select>&nbsp;&nbsp;
	
	用户：<select size="1" name="sMbId" id="sMbId" class="input">
	<option value="">全部</option>
	<c:forEach items="${mbList}" var='mbb'>
	  <c:if test="${!empty mbb.batchId}">
	   <option value="${mbb.id}">${mbb.realName}</option>
	  </c:if>
	</c:forEach>
 
	</select>&nbsp;&nbsp;
	批次：<select size="1" name="sBid" class="input">
<option value="">全部</option>
	<code:codeList codeTable="b_batch" value="${sBid}"></code:codeList>	
	</select>&nbsp;&nbsp;
	最近
	<select size="1" name="interval" class="input">
			<option value="3652">10年</option>
				<option value="1827">5年</option>
					<option value="1096">3年</option>
						<option value="731">2年</option>
	<option value="365" SELECTED>1年</option>
	<option value="184" >6个月</option>

	</select>
	&nbsp;
	<c:if test="${sState eq 0}">
	<br />
	<input type="button" class="button"  id="btnPass" value="审核通过"></input>&nbsp;
	<input type="button" class="button"  id="btnDeny" value="审核不通过"></input>&nbsp;
	</c:if>
	<!--<img valign="bottom"  id="listHist" src="${ctx}imag66/v_old.jpg" class="button">-->
 </li>
 </ul>
 </form>
   <div style="width:720px;height:auto;overflow: auto;float:left">
   <br>
   <table id="user_list" width="680"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="10%">
       <col width="10%">
       <col width="15%">
       <col width="15%">
       <col width="15%">
       <col width="15%">
     
     </COLGROUP>
     <thead>
   
      <tr bgcolor="#E6F5FA">
       <th><input type="checkbox" id="ckAll"></input></th>
       <th>申请类别</th>
       <th>所属单位</th>
       <th>用户名</th>
       <th>资源图片</th>
       <th>标题</th>
       <th>申请时间</th>

      </tr>
     </thead>
     <tbody>
     <c:forEach items="${appList}" varStatus="st" var="app">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
           <td class='al_center'><input type="checkbox" ck="${app.id}"></input></td>
	       <td class='al_center'><code:codeList codeTable="B_RES_TYPE" codeId="${app.resType}"></code:codeList></td>
	       <td class='al_center'><code:codeList codeTable="B_BRANCH" codeId="${app.branchId}"></code:codeList></td>
	       <td class='al_center'>${app.userRealName}</td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}"><img class="little_img" src='${ctx}${app.resImgPath}'></img></a></td>
	       <td class='al_center'><a onClick="openthewindow('${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}','${app.resId}')" style="cursor:pointer;">${app.resName}[${app.orderNum}套]</a></td>
	       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	       
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
   <form name="frmNew" method="POST">
    <input type="hidden" name="reason" value=""></input>
    <input type="hidden" name="sId" value=""></input>
    <input type="hidden" name="sIds" value=""></input>
   </form>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
  $(function(){
		  if('' != '${interval}')
			 jQuery(":select[name='interval']").val('${interval}');
		  $("A[denySId]").click(function(){
		     var me$ = $(this);
		     var denyReason = window.prompt("请给个拒绝理由吧","");
		     if(null != denyReason && denyReason != ""){
			     document.frmNew.method="POST";
		         document.frmNew.action = "${ctx}admin/resAppDeny.form";
		         document.frmNew.sId.value = me$.attr("denySId");
		         document.frmNew.reason.value = denyReason;
		         document.frmNew.submit();
		     }
		  });
		  $("A[appSId]").click(function(){
		     var me$ = $(this);
		     document.frmNew.method="POST";
	         document.frmNew.action = "${ctx}admin/resAppApprove.form";
	         document.frmNew.sId.value = me$.attr("appSId");
	         document.frmNew.submit();
		  });
		  $("#btnPass,#btnDeny").click(function(){
		     var me$ = $(this);
		     var sIds = '';
		     $(":checked[ck]").each(function(){
		    	 sIds+= (this.getAttribute("ck") + ',');
		     });
		     if(sIds == ''){
	           alert('请选择资源');
	           return;
		     }
		     document.frmNew.method="POST";
		     if(this.id == 'btnPass')
	           document.frmNew.action = "${ctx}admin/resAppApprove.form";
	         if(this.id == 'btnDeny')
	           document.frmNew.action = "${ctx}admin/resAppDeny.form";
	         document.frmNew.sIds.value = sIds;
	         document.frmNew.submit();
		  });
		  $("#ckAll").click(function(){
	           var cked = this.checked;
	           $(":checkbox[ck]").each(function(){
	                   this.checked = cked;
	           });
		  });
		  $("#listHist").click(function(){
			  $(":select[name='interval']").val('184');
			  $(":select[name='sType'],:select[name='sMbId'],:select[name='sBid']").val('');
			  $("#frmQry").submit();
		  });
		  jQuery(":select[name='interval'],:select[name='sType'],:select[name='sMbId'],:select[name='sBid'],:select[name='sState']").change(function(){
			  $("#frmQry").submit();
		  });
		  <c:if test="${!empty sMbId}">
		  $("#sMbId").val('${sMbId}');
		  </c:if>
  });
</script>
</html>