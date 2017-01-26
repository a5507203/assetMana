package com.beauty.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.ibatis.common.resources.Resources;

import conf.ResourceConf;

/**
 * Servlet implementation class ResConfig
 */
public class ResConfig extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
	public void init() throws ServletException {
    	try {
    		ResourceConf.config = Resources.getResourceAsProperties("conf/conf.properties");
    		ResourceConf.config.putAll(Resources.getResourceAsProperties("conf/sys_swither.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
