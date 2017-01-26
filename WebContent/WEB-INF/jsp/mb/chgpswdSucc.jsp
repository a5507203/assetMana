<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>

<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>


		
<body class="tz_body2">
<center>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="z_resource"/></jsp:include>
</center>
<div class="tz_mainbody2" style="height:100px;">
<!--注册条款 -->
<div class ="tz_center_content">
<div class="tz_right_content">
     
 
<img src="${ctx}images/password_mg.gif"  />				
			
	<div class="tz_box" style="height:80px;">
<br>
<br>
<center>
<font size='3'>密码设置成功</font>
</center>
</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp"></jsp:include>
</body>
</html>