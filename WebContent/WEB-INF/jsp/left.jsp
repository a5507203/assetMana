<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="code" uri="/WEB-INF/tld/common.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${sessionScope.mb.username eq 'admin'}">
<div class="left">
<img src="${ctx}imag33/left_top.jpg" ><div class="admin_index_leftbox">
<table width="175" height="100%" border="0" cellpadding="0" cellspacing="0" background="${ctx}imag33/fff.jpg">
  <tr> 
    <td height="57" colspan="3" valign="top" background="${ctx}imag33/fff.jpg">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" height="100%" valign="top"><img src="${ctx}imag33/menu-left-1.jpg"></td>
        </tr>
        <tr>
          <td valign="top" height="100%" style="padding-left:8px; padding-right:0px; padding-top:5px;"> 
            <c:if test="${!empty sessionScope.mb}">
              <c:if test="${!empty sessionScope.mb.imgPath}">
                <div class="person_img">
                  <table border="1" bordercolor="#00CCFF">
                    <tr><td><img  src="${ctx}${sessionScope.mb.imgPath}" width="145" height="170"></img></td></tr>
                  </table>
                </div>
              </c:if>
              <c:if test="${empty sessionScope.mb.imgPath}">
                <div class="person_img">
                  <table border="1" bordercolor="#00CCFF">
                    <tr><td><img src="${ctx}images/nonephoto.jpg" width="145" height="170"></img></td></tr>
                  </table>
                </div>
              </c:if>
              <br/>
              <p  style="padding-top:5px; padding-left:0;">
                <font color="333399">亲爱的管理员${sessionScope.mb.username}
                  <c:if test="${2 ne sessionScope.mb.auditStatus}">
                    [<code:codeList codeTable="b_audit_status" codeId="${sessionScope.mb.auditStatus}"></code:codeList>]
                  </c:if>
                  <br/>你好!<br/> 欢迎使用本系统！</font>
              </p>
            </c:if>
          </td>
        </tr>
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
    </td>
  </tr>

  <tr>
          <td height="81" colspan="3" valign="top"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="175" height="100%" valign="top"><img src="${ctx}imag33/menu-left-1.jpg"></td>
              </tr>
              <tr align="center"> 
                	<td height="100"> 
          <c:if test="${!empty sessionScope.mb}">
									  <table width="100%" border="0" cellpadding="0" cellspacing="0">
									  	
						  			<tr align="center">
											<td><a href="${ctx}mb/logOut.form"><img src="${ctx}imag66/t_return.jpg"></a></td>
								   </tr>
								   
									<tr align="center">
											<td>
									 <c:if test="${sysTurnOn eq '1'}">
									 <a href="${ctx}admin/turnOffApp.form"><img src="${ctx}imag66/t_turnoff.jpg"></a>
									 </c:if>
									  <c:if test="${sysTurnOn eq '0'}">
									 <a href="${ctx}admin/turnOnApp.form"><img src="${ctx}imag66/t_turnon.jpg"></a>
									 </c:if>
									  	</td>
								   </tr>
								   
								 
								    <tr align="center">
									<td><a href="${ctx}admin/branchInfo.form"><img src="${ctx}imag66/t5.jpg"></a></td>
								   </tr>
								     
								 </table>
					</c:if>
						
					
					
					
					
					</td>
              </tr>
              <tr> 
                <td height="4"></td>
              </tr>
            </table></td>
        </tr>

		<tr align="center"> 
          <td height="81" colspan="3" valign="top"> <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="175" height="100%" valign="top"><img src="${ctx}imag33/menu-left-1.jpg"></td>
              </tr>
              <tr align="center"> 
                	<td height="200"> 
								<table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
											 <tr align="center">
											<td><a href="${ctx}admin/serviceInfo.form"><img src="${ctx}imag66/t1.jpg"></a></td>
								   </tr>
							 		<tr align="center">
											<td><a href="${ctx}admin/deviceInfo.form"><img src="${ctx}imag66/t2.jpg"></a></td>
								   </tr>
								 <tr align="center">
											<td><a href="${ctx}admin/productInfo.form"><img src="${ctx}imag66/t3.jpg"></a></td>
								   </tr>
						
								   
								</table>
					
					
					
					
					
					
					</td>
              </tr>
              <tr> 
                <td height="4"></td>
              </tr>
            </table></td>
        </tr>
		
		
        <tr> 
          <td height="20" colspan="3" valign="top"><img src="${ctx}imag33/menu-left-3.jpg"></td>
        </tr>
        <tr align ="center">
        	<td height="200"> 
        		
				     			<table >
				     				 <tr>
											<td height="49"><a href="http://www.cdstm.net.cn"><img class = "link_img" src="${ctx}imag66/cdstm_link.gif"></a></td>
								   </tr>
				     		 <tr>
											<td height="49"><a href="http://www.cast.org.cn"><img class = "link_img" src="${ctx}imag66/023.gif"></a></td>
								   </tr>
							 		<tr>
											<td height="49"><a href="http://castic.xiaoxiaotong.org"><img class = "link_img" src="${ctx}imag66/kjcx_link.gif"></a></td>
								   </tr>
								 <tr>
											<td height="49"><a href="http://www.uisp.org.cn"><img  class = "link_img" src="${ctx}imag66/uisp_link.gif"></a></td>
								   </tr>
								  <tr>
									<td height="49"><a href="http://www.cpst.net.cn"><img class = "link_img" src="${ctx}imag66/cpst_link.gif"></a></td>
								   </tr>
				     		</table>
				     		
				     		
     	</td> 
        </tr>

</table>
<div style="clear: both;height:5px;"></div>
</div>
</div>
</c:if>


<c:if test="${!empty sessionScope.mb and sessionScope.mb.validMember}">
<div class="user_index_left">
<img src="${ctx}imag22/side01.gif" width="188" height="11"><table align="center"  border="0" cellpadding="0" cellspacing="0" class="text" width="188">
  	<tr> 
                  <td height="27" align="center" background="${ctx}imag22/bar01.gif"><table width="175" border="0" cellpadding="0" cellspacing="0" class="text">
                      <tr align="center"> 
                        <td width="7">&nbsp;</td>
                        <td><strong><font color="00000">
   		<c:if test="${!empty sessionScope.mb}">
			${sessionScope.mb.username}<c:if test="${2 ne sessionScope.mb.auditStatus}">[<code:codeList codeTable="b_audit_status" codeId="${sessionScope.mb.auditStatus}"></code:codeList>]</c:if> 欢迎您
   		 </c:if>
	       </font></strong></td>
                      </tr>
                    </table></td>
                </tr>

	<tr align="center" height="300"> 
                  <td align="center" valign="top" background="${ctx}imag22/sidebg01.gif">
				  <br />
                      <c:if test="${!empty sessionScope.mb}">
					  
					  <c:if test="${!empty sessionScope.mb.imgPath}">
             <div class="person_img">
			 <table border="1" bordercolor="#00CCFF" width="145" height="170">
			 <tr><td>
             <img  src="${ctx}${sessionScope.mb.imgPath}" ></img>
			 </td></tr>
			 </table>
             </div>
           </c:if>
           <c:if test="${empty sessionScope.mb.imgPath}">
             <div class="person_img">
			 	 <table border="1" bordercolor="#00CCFF">
			 <tr><td>
             <img src="${ctx}images/nonephoto.jpg" width="145" height="170"></img>
			  </td></tr>
			  	 </table>
             </div>
           </c:if>

		 <p  style="padding-top:5px; padding-left:0;"><font color="333399">
		 亲爱的${sessionScope.mb.realName}<c:if test="${2 ne sessionScope.mb.auditStatus}">[<code:codeList codeTable="b_audit_status" codeId="${sessionScope.mb.auditStatus}"></code:codeList>]</c:if>，你好!<br>
		 欢迎使用本系统！</font></p>
		
	         </c:if>
	</td>
                </tr>


<tr align="center" > 
                  <td height="27" align="center"  background="${ctx}imag22/bar01.gif"><table width="175" border="0" cellpadding="0" cellspacing="0" class="text">
                      <tr align="center"> 
                        <td width="7">&nbsp;</td>
                        <td><strong>
   		<c:if test="${!empty sessionScope.mb}">
			 <a href="${ctx}mb/logOut.form"><font color="00000">安全退出</font></a>
		</c:if>
	       </strong></td>
                      </tr>
                    </table></td>
                </tr>

<tr align="center">
                  <td height="27" align="center" background="${ctx}imag22/bar01.gif"><table align="center" width="175" border="0" cellpadding="0" cellspacing="0" class="text">
                      <tr align="center"> 
                        <td width="7">&nbsp;</td>
                        <td><strong>
   		<c:if test="${!empty sessionScope.mb}">
			 <a href="${ctx}msg/msgInfo.form"><font color="00000">发送消息</font></a>
		</c:if>
	       </strong></td>
                      </tr>
                    </table></td>
                </tr>

<tr align="center">
                  <td height="27" align="center" background="${ctx}imag22/bar01.gif"><table width="175" border="0" cellpadding="0" cellspacing="0" class="text">
                      <tr align="center"> 
                        <td width="7">&nbsp;</td>
                        <td><strong>
   		<c:if test="${!empty sessionScope.mb}">
			 <a id='msg' href='${ctx}msg/msgList.form'><font color="00000">我的消息</font></a>
		</c:if>
	       </strong></td>
                      </tr>
                    </table></td>
                </tr>

 <tr align="center" height="258"> 
                  <td align="center" valign="top" background="${ctx}imag22/sidebg01.gif">
				  <div class ="user_index_left_msgbox">
					 <ul class="center_box">
			 <c:forEach items="${msgList}" var="msg" varStatus="st">
				<li >
					<span class="ph2"><a href="${ctx}msg/viewMsg.form?sId=${msg.id}" target="_blank">
					<code:shortStr length="15" value="${msg.title}"></code:shortStr>[<fmt:formatDate value="${msg.createTime}" pattern="yy-MM-dd hh:mm:ss"/>]</a></span>
					<div style="CLEAR: both"></div>
				</li>
			 </c:forEach>
			 <c:if test="${empty msgList}">
				<li >
 					<span class="ph2">暂无</span>
					<div style="CLEAR: both"></div>
				</li>
			 </c:if>
</ul>

				
					<br/>
					</div></td>
                </tr>
	<tr>
<td height="27" align="center" background="${ctx}imag22/bar01.gif"><table width="175" border="0" cellpadding="0" cellspacing="0" class="text">
                      <tr align="center"> 
                        <td width="7">&nbsp;</td>
                        <td><strong>
   		<c:if test="${!empty sessionScope.mb}">
			 <a id='msg' href='${ctx}msg/msgList.form'><font color="00000">快速连接</font></a>
		</c:if>
	       </strong></td>
                      </tr>
                    </table></td>
                </tr>

 <tr height="270"> 
                  <td align="center" valign="top" background="${ctx}imag22/sidebg01.gif">
                  	<br>
                  		<table>
				     				 <tr>
											<td height="49"><a href="http://www.cdstm.net.cn"><img class = "link_img" src="${ctx}imag66/cdstm_link.gif"></a></td>
								   </tr>
				     		 <tr>
											<td height="49"><a href="http://www.cast.org.cn"><img class = "link_img" src="${ctx}imag66/023.gif"></a></td>
								   </tr>
							 		<tr>
											<td height="49"><a href="http://castic.xiaoxiaotong.org"><img class = "link_img" src="${ctx}imag66/kjcx_link.gif"></a></td>
								   </tr>
								 <tr>
											<td height="49"><a href="http://www.uisp.org.cn"><img  class = "link_img" src="${ctx}imag66/uisp_link.gif"></a></td>
								   </tr>
								  <tr>
									<td height="49"><a href="http://www.cpst.net.cn"><img class = "link_img" src="${ctx}imag66/cpst_link.gif"></a></td>
								   </tr>
				     		</table>
				     		
				 </td>
                </tr>

	<tr> 
                  <td height="27" align="center" background="${ctx}imag22/bar01.gif"><table width="175" border="0" cellpadding="0" cellspacing="0" class="text">
                      <tr> 
                        <td width="7"></td>
                        <td><strong>
   		
	       </strong></td>
                      </tr>
                    </table></td>
                </tr>

             	</table>
</div>
</c:if>
