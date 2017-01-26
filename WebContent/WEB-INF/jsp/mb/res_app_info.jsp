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
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="f_apply"/></jsp:include>
<div class="mainbody" style="height:1500px;">
<jsp:include page="/WEB-INF/jsp/left.jsp"></jsp:include>
<div class="main_mid">
<!--注册条款 -->
<div class="newreg" style="height:1450px;">
<c:if test="${'1' eq param.succ}">
	<div id="effect">
		<h3 ></h3>
		<p>
			恭喜！你的已提交成功！
		</p>
	</div>
	<script>
	  $("#effect").show(500,function(){
		  	window.setTimeout('$("#effect").hide()', 1500);
		  }
	  );
	</script>
</c:if>  
<form name="frmNew" method="POST" action="${ctx}mb/resAppInfoPost.form">
<input type="hidden" name="resType" value="${param.sTp}"></input>
<ul>
 <li>
 <table>
 		<tr>
 			<td width="780" background="${ctx}imag33/title_low.jpg" height="22"><a href="${ctx}index.htm">首页</a>
&gt;
<a href="${ctx}mb/resAppList.form">资源申请</a>
&gt;
申请</td>
 		 </tr>
 		 	
 	</table>
 </li>
 </ul>
 <div style="width:720px;height:${fn:length(resAppList)*100+160}px;overflow: auto;float:left">
   <table id="user_list"  cellspacing="0" cellpadding="0" border="0">
     <COLGROUP>
       <col width="15%">
       <col width="15%">
       <col width="18%">
      <col width="15%">
       <col width="15%">
       <col width="15%">
     </COLGROUP>
       <img src="${ctx}imag33/very-big.jpg">
     <thead>
      <tr bgcolor="#E6F5FA">
       <th><input type="checkbox" id="ckAll"></input></th>
       <th>资源图片</th>
       <th>名称</th>
       <th>申请套数</th>
       <th>创建时间</th>
        <th>查看详情</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach items="${resAppList}" varStatus="st" var="app">
       <tr <c:if test="${st.index mod 2 eq 1}">bgcolor="#F4F5F7"</c:if>>
	       <td class='al_center'><input name="resIds" type="checkbox" value="${app.id}" restp='${param.sTp}'></input>
	       </td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.id}&sTp=${param.sTp}"><img class="service_img" src='${ctx}${app.imgPath1}'></img></a></td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.id}&sTp=${param.sTp}">${app.name}</a></td>
	       <td class='al_center'>1</td>
	       <td class='al_center'><fml:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	       <td class='al_center'><a href="${ctx}mb/resView.form?sId=${app.id}&sTp=${param.sTp}">详情</a></td>
       </tr>
     </c:forEach>
     </tbody>
   </table>
</div>

 <ul>

 <li class="hd">
<center>
  <table align ="left" width="680">
 		<tr>
 			<td  background="${ctx}imag33/title_low.jpg" height="22"><input type="button" class="button" value="提交申请" id="miSubmit"></input>
<input id="goback" class="button"  onclick="window.location='${ctx}mb/resAppList.form';" name="goback" value=" 返回 "  type="button">
			</td>
			</tr>
</table>
</center> 
 </li>

 </ul>

</form>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>