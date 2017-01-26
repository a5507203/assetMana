<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fml" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}js/YlMarquee.js"></script>
<script src="${ctx}js/jwindow.js" type="text/javascript"></script>

<c:if test="${!empty sessionScope.mb and sessionScope.mb.validMember}">

<body class ="body_user" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>




<div class ="user_body">


<TABLE WIDTH=1000 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=2 ROWSPAN=2>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_01.jpg"  width="325" height="461" ALT=""></TD>
		<TD>
			<IMG SRC='${ctx}imag88/NEW_USER_INDEX_02.jpg'></TD>
		<TD>
				<IMG SRC='${ctx}imag88/NEW_USER_INDEX_03.jpg'></TD>
		<TD>
				<IMG SRC='${ctx}imag88/NEW_USER_INDEX_04.jpg'></TD>
		<TD>
				<IMG SRC='${ctx}imag88/NEW_USER_INDEX_05.jpg'></TD>
		<TD ROWSPAN=2>   
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_06.jpg" width="228" height="461" ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_07.jpg" width="447" height="403"  ALT=""></TD>
	</TR>
	<TR>
		<TD><jsp:include page="/WEB-INF/jsp/user_left.jsp"></jsp:include></TD>
		<TD COLSPAN=6 valign="top">
		<div class ="tee_right">
		
			<IMG SRC="${ctx}imag88/agree_app.jpg" ALT="">	

	<div style ="height:500px;width :620px;overflow:scroll;margin-left:30px;font-size:18px;font-family:'仿宋_GB2312' ;">
		
		<p align="center" style ="font-size:20px;font-family:'宋体' ;"><strong>科普大篷车网络申报协议书<br><br></strong></p>
<p>甲方：中国科协科普活动中心</p>
<p>乙方：科普大篷车配车单位</p>
<p>&nbsp;</p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据《科普大篷车项目暂行管理办法》及《关于科普大篷车配发工作的通知》的规定，甲、乙双方就网络申报事项达成以下协议:<br><br></p>
<ul style="margin-left:20px">
  <li>1.  乙方采用网络方式进行科普大篷车车辆、车载设备和展品申报。乙方须保证所申报内容的真实性。</li>
  <li>2.  乙方须在规定的申报期限内，通过互联网登录科普大篷车网络申报系统，按照本单位实际情况填报单位信息、申报车辆、车载设备和车载展品。乙方办理申报日期以科普大篷车网络申报系统收到该数据电文的时间为准。</li>
  <li>3.  乙方在网上申报过程中要按照系统提示进行操作，认真核对申报数据，确保申报内容真实、准确和完整，并确认以甲方科普大篷车网络申报系统记录的接收数据为准。</li>
  <li>4.  乙方逾期申报的，网络申报系统不予受理，甲方默认乙方放弃当年科普大篷车的申报。</li>
  <li>5.  乙方申报结束后，系统将自动生成申报预览表，乙方核实申报预览表中内容后，保存申报预览表，打印并盖单位公章寄至甲方。</li>
  <li>6.  乙方首次登陆网络申报系统应修改密码，并填报完整的单位信息。如因乙方未修改密码而导致的第三方申报，所产生的后果由乙方负责。</li>
  <li>7.  甲方保留对此协议的最终解释权。</li>
</ul>


		
 </div>

	<div style="width:700px;overflow:hidden;float:top;text-align:center;">
 			<center>
			<table align="center" width="45%">
			<tr>
			<td ><a id = "theLink_agree" href="${ctx}mb/new_editRegInfo.form" onClick="goodwill();"></a></td>
			<td><a id = "theLink_disagree" href="${ctx}mb/logOut.form"></a></td>
			</tr>
			</table>
			</center>
			</div>
		
		
   </div></TD>
	</TR>
	<TR>
		<TD COLSPAN=7>
			<IMG SRC="${ctx}imag88/NEW_USER_INDEX_10.jpg" WIDTH=1000 HEIGHT=83 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=196 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=123 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=109 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=115 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=112 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=111 HEIGHT=1 ALT=""></TD>
		<TD>
			<IMG SRC="${ctx}imag88/spacer.gif" WIDTH=234 HEIGHT=1 ALT=""></TD>
	</TR>
</TABLE>


</div>


</body>

</c:if>




</html>
