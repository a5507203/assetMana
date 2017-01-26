/**
 * CopyRight: 
 * Company: SK C&C Systems Global Delivery Center (Beijing) 
 * Time: 2008-2009
 * Author: WangZhenHua
 */
package com.beauty.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

/**
 * @author wzh
 *
 */
public class AuthorizationHandler extends HttpServlet implements Filter {

	private static final long serialVersionUID = 1682664094573435063L;
    private static final String SESSION_KEY_MB = "mb";
    private static final Integer ADMIN_ROLE = new Integer(3);
    private static final Integer MB_ROLE = new Integer(2);
    private static final Integer ANONYMOUS_ROLE = new Integer(1);

    private Map<String, Boolean> escapeURI = new HashMap<String, Boolean>(23);
    private Map<String, Integer> checkURI = new HashMap<String, Integer>(23);
    private String ctx;
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		/*	HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		String uri = req.getRequestURI().toLowerCase();
		boolean needCk = needCheck(uri);
		Member mb = (Member)req.getSession().getAttribute(SESSION_KEY_MB);
		if(null == mb && needCk) {//未登录检查
			res.sendRedirect(ctx + "/login.htm");
		} else {
			if (needCk && mb != null && mb.isValidMember()) {
			
			}
			if(needCk) {//普通用户[注册审核，未审核]检查
				Integer authVal = getValOfAuthority(uri);
				authVal = authVal == null? 0 : authVal;
				if(!mb.isAdmin() && ADMIN_ROLE.equals(authVal)){
					res.sendRedirect(ctx + "/index.htm");
					return;
				}
				if(!mb.isAdmin()&&!mb.isValidMember() && //未审核用户不能进消息路径和用户msg or mb or 下载文件和图片
					ANONYMOUS_ROLE.compareTo(authVal) == -1
				 ){
					res.sendRedirect(ctx + "/index.htm");
					return;
				}
			}
			chain.doFilter(request, response);
		}*/
		chain.doFilter(request, response);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		ctx = filterConfig.getServletContext().getContextPath();
		escapeURI.put(ctx + "/mb/validatorcode.form", Boolean.TRUE);
//		escapeURI.put(ctx + "/mb/register*", Boolean.TRUE);
		escapeURI.put(ctx + "/mb/checkemail.form", Boolean.TRUE);
		escapeURI.put(ctx + "/mb/checkname.form", Boolean.TRUE);
		escapeURI.put(ctx + "/login.htm", Boolean.TRUE);
		escapeURI.put(ctx + "/mb/login.form", Boolean.TRUE);
		escapeURI.put(ctx + "/mb/logout.form", Boolean.TRUE);
		checkURI.put(ctx + "/mb/news*", ANONYMOUS_ROLE);
		checkURI.put(ctx + "/mb/*", MB_ROLE);
		checkURI.put(ctx + "/msg/*", MB_ROLE);
		checkURI.put(ctx + "/admin/*", ADMIN_ROLE);
		checkURI.put(ctx + "/images/device/*", MB_ROLE);
		checkURI.put(ctx + "/images/product/*", MB_ROLE);
		checkURI.put(ctx + "/images/service/*", MB_ROLE);
		checkURI.put(ctx + "/files/*", MB_ROLE);
	}

	

	public void destroy() {
	}

}
