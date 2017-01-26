package com.beauty.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import conf.ResourceConf;

@Controller
@RequestMapping( { "/*.htm" })
public class IndexController {

	private static Log log = LogFactory.getLog(IndexController.class.getName());
	public static final String INDEX_VIEW = "index";
	public static final String MAIN_VIEW = "main";
	@Autowired
	

	@RequestMapping
	public String index(HttpServletRequest request) {
		
		return INDEX_VIEW;
	}

	@RequestMapping
	public String main(HttpServletRequest request) {
		return MAIN_VIEW;
	}

	@RequestMapping
	public String login(HttpServletRequest request) {
		return MemberController.LOGIN;
	}
}
