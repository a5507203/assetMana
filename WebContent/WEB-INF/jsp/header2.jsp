<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script  type="text/javascript">
 mid = '${param.mid}';
</script>
<div class="bigheader">
  <div class="logo" style="background-color:#ffffff;"><img src="${ctx}images/logo.gif" alt="logo" width="99" height="99" /></div>
  <div class="top"><span></span></div>
  <ul class="menu">
	<li>
		<a mid='index' href="${ctx}index.htm">　首页 &nbsp;&nbsp;</a>
	</li>
<c:if test="${sessionScope.mb.admin}">
	<li>
		<a mid='z_resource' href='${ctx}admin/resList.form' >资源管理</a>
	</li>
	<li>
		<a mid='z_user' href='${ctx}admin/auditUser.form'>用户管理</a>
	</li>
	<li>
		<a mid='z_approve' href='${ctx}admin/resAppList.form'>审批管理</a>
	</li>
	<li>
		<a mid='z_static' href='${ctx}admin/resRep.form'>统计分析</a>
	</li>
	<li>
		<a mid='z_file' href='${ctx}admin/fileList.form'>文件管理</a>
	</li>
	<li>
		<a mid='z_news' href='${ctx}admin/newsList.form'>新闻管理</a>
	</li>
</c:if>
<c:if test="${sessionScope.mb.validMember}">
	<li>
		<a mid='f_resource' href='${ctx}mb/editRegInfo.form'>资料维护</a>
	</li>
	<li>
		<a mid='f_apply' href='${ctx}mb/resAppList.form'>资源申请</a>
	</li>
	<li>
		<a mid='f_his' href='${ctx}mb/resAppHistory.form'>申请历史</a>
	</li>
</c:if>
<c:if test="${sessionScope.mb.admin or sessionScope.mb.validMember}">
	<li>
		<a mid='msg'  href='${ctx}msg/msgList.form'>我的留言</a>
	</li>
	<li>
		<a mid='security' href='${ctx}mb/password.form'>安全设置</a>
	</li>
</c:if>
	<li>
		<a mid='forum' href='/forum/forums/list.page'>　论坛&nbsp;&nbsp;</a>
	</li>
</ul>
</div>
<div style="clear: both;"></div>
<div class="bigline"><span></span></div>