<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if ("".equals(request.getContextPath()) || !request.getContextPath().endsWith("/")) {
		request.setAttribute("ctx", request.getContextPath() + "/");
	} else {
		request.setAttribute("ctx", request.getContextPath());
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="PropertySystem" />
<meta name="description" content="PropertySystem" />
<META name="copyright" content="sunlight" />
<!--<script  type="text/javascript">
 var mb = ${!empty sessionScope.mb};
 var ctx = '${ctx}';
 var mid = '';
</script>-->
<script src="${ctx}js/jquery.js" type="text/javascript"></script>
<script src="${ctx}js/index.js" type="text/javascript"></script>
<link rel="shortcut icon" href="${ctx}b_icon.ico" type="image/x-icon" />
<link href="${ctx}css/indexstyle.css" rel="stylesheet" type="text/css" />
<title>PropertySystem</title>
