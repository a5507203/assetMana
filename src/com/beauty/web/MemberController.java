package com.beauty.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
 

import conf.ResourceConf;

@Controller
@RequestMapping( { "/mb/*.form", "/mb/*.htm" })
public class MemberController {

	private static Log log = LogFactory.getLog(MemberController.class.getName());
	public static final String MB_ATTR_NAME = "mb";
	public static final String VIEW_EDIT_REG_INF = "/mb/edit_user_info";
	public static final String VIEW_NEW_MB = "mb/register";
	public static final String EDIT_VIEW_PSWD = "/mb/chgpswd";
	public static final String EDIT_VIEW_PSWD_SUCC = "/mb/chgpswdSucc";
	public static final String PUBLIST_VIEW = "mb_list";
	public static final String INDEX = "redirect:/index.htm";
	public static final String MAIN = "redirect:/main.htm";
	public static final String RD_LOGIN = "redirect:/login.htm";
	public static final String LOGIN = "/login";
	// RES application
	public static final String RD_RES_APP_LIST = "redirect:/mb/resAppList.form";
	public static final String RES_APP_LIST = "mb/res_app_list";
	public static final String RES_APP_INFO = "mb/res_app_info";
	public static final String RD_RES_APP_INFO = "redirect:/mb/resAppInfo.form";

	public static final String RES_APP_HISTORY = "mb/res_app_history";

	public static final String SERVICE_VIEW_INFO = "admin/service_info";
	public static final String DEVICE_VIEW_INFO = "admin/device_info";
	public static final String PRODUCT_VIEW_INFO = "admin/product_info";

	public static final String VIEW_NEWS = "mb/view_news";
	
	@RequestMapping(method = RequestMethod.GET)
	public String passwordSucc(Model model, HttpServletRequest request) throws Exception {
		return EDIT_VIEW_PSWD_SUCC;
	}

	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
