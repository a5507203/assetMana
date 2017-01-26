<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="f_his"/></jsp:include>
<div class="mainbody" style="height:${fn:length(appList)*100+350}px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 -->
<div class="newreg" style="height:${fn:length(appList)*100+300}px;">
<ul>
 <li>
<table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页</a>&gt;
申请历史</td>
 		 </tr>
 		 	
 	</table>

 </li>
 </ul>
 <form id="frmQry" method="GET" action="${ctx}mb/resAppHistory.form">
 <ul>
 <li class="hd" style="text-align: left">
	&nbsp;&nbsp;资源类型：<select size="1" name="sType" class="input"  style="width:180px;">
	<option value="">全部</option>
	<code:codeList codeTable="B_RES_TYPE" value="${sType}"></code:codeList>
	</select>&nbsp;&nbsp;
	申请状态：
	<select size="1" name="auditStatus" class="input" style="width:180px;">
	<option value="">全部</option>
	<code:codeList codeTable="B_AUDIT_STATUS" value="${auditStatus}"></code:codeList>
	</select>&nbsp;&nbsp;
	最近
	<select size="1" name="interval" class="input" style="width:100px;">
			<option value="3652">10年</option>
				<option value="1827">5年</option>
					<option value="1096">3年</option>
						<option value="731">2年</option>
	<option value="365" SELECTED>1年</option>
	<option value="184" >6个月</option>
	</select>
 </li>
 </ul>
 </form>
   <div style="width:720px;height:${fn:length(appList)*100+160}px;overflow: auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0" >
     <COLGROUP>
       <col width="15%">
       <col width="22%">
       <col width="15%">
       <col width="20%">
       <col width="15%">
       <col width="15%">
     </COLGROUP>
     <thead>
      <tr bgcolor="#E6F5FA">
       <th>申请状态</th>
       <th>资源图片</th>
       <th>标题</th>
       <th>申请时间</th>
       <th>查看</th>
       <th>退回原因</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${appList}" varStatus="st" var="app">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td class='al_center'><code:codeList codeTable="B_AUDIT_STATUS" codeId="${app.auditStatus}"/>[<code:codeList codeTable="B_RES_TYPE" codeId="${app.resType}"></code:codeList>]</td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}"><img class="little_img" src='${ctx}${app.resImgPath}'></img></a></td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}">${app.resName}[${app.orderNum}套]</a></td>
	       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.resId}&sTp=${app.resType}">详情</a> </td>
	       <td class='al_center'>${app.backReason}</td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
   </div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
 $(function(){
	 if('' != '${interval}')
		 jQuery(":select[name='interval']").val('${interval}');
	 jQuery(":select[name='interval'],:select[name='auditStatus'],:select[name='sType']").change(function(){
		  $("#frmQry").submit();
	 });
 });
</script>
</html>