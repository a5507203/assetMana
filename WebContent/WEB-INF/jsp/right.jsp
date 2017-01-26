<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="comm" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="right">
<c:if test="${sessionScope.mb.username eq 'admin'}">
	<h3 style='background:url(${ctx}imag33/title_low.jpg);height:22px'>给我的留言</h3>
	<ul class="center_box">
		<c:forEach items="${msgList}" var="msg" varStatus="st">
			<li>
			  <span class="ph2">
			    <a href="${ctx}msg/viewMsg.form?sId=${msg.id}" target="_blank">
			     <comm:shortStr length="15" value="${msg.title}"></comm:shortStr>
			     [<fmt:formatDate value="${msg.createTime}" pattern="yy-MM-dd hh:mm:ss" />]
			    </a>
			  </span>
			  <div style="CLEAR: both;"></div>
			</li>
		</c:forEach>
		<c:if test="${empty msgList}">
			<li><span class="ph2">暂无</span>
			<div style="CLEAR: both;"></div>
			</li>
		</c:if>
	</ul>
</c:if>

<c:if test="${!empty sessionScope.mb and sessionScope.mb.validMember}">
<table width="209" align="right" border="0" cellspacing="0" cellpadding="0">
  <tr height="20">
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="${ctx}imag22/plumbing_03.png" width="209" height="34" alt=""></td>
  </tr>

  <c:forEach items="${servList}" var="serv">
    <tr>
      <td background="${ctx}imag22/plumbing_04.png" width="209" height="70">
        <div class="user_index_right_picbox">
          <img src="${ctx}${serv.imgPath1}" width="54" height="54" hspace="4">
          <div class="user_index_right_picbox_text">${serv.descript}</div>
        </div>
      </td>
    </tr>
  </c:forEach>

  <tr>
    <td background="${ctx}imag22/plumbing_06.png" width="209" height="63"></td>
  </tr> 
  <tr>
    <td background="${ctx}imag22/plumbing_07.png" width="209" height="47"></td>
  </tr>
  <c:forEach items="${devList}" var="dev">
  <tr>
    <td background="${ctx}imag22/plumbing_08.png" width="209" height="92">
		 <div class="user_index_right_picbox">
		 <img src="${ctx}${dev.imgPath1}" width="54" height="54" hspace="4">
		 <div class="user_index_right_picbox_text">
		 ${dev.descript}
		 </div>
		 </div></td>
  </tr>
  </c:forEach>   
  <!--
  <tr>
    <td background="${ctx}imag22/plumbing_09.jpg" width="209" height="90"></td>
  </tr>
  -->
  <tr>
    <td background="${ctx}imag22/plumbing_10.png" width="209" height="78"></td>
  </tr>
  <tr>
    <td background="${ctx}imag22/plumbing_11.png" width="209" height="37"></td>
  </tr>
</table>
</c:if>

</div>
