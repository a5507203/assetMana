<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/header.jsp"><jsp:param name="mid" value="f_his"/></jsp:include>
 
<script src="${ctx}js/jquery.validator.js" type="text/javascript"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>


<body class="tz_body2">

<jsp:include page="/WEB-INF/jsp/property/innerEditAgent.jsp"></jsp:include>

</body>
</html>