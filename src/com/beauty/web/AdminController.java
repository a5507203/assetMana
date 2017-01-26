package com.beauty.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
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

import com.sun.javafx.scene.shape.PathUtils;

import conf.ResourceConf;

@Controller
@RequestMapping({"/admin/*.form", "/admin/*.htm"})
public class AdminController {
	    private static Log log = LogFactory.getLog(AdminController.class.getName());
	    public static final String AUDIT_USER = "admin/audit_user";
	    public static final String RES_LIST = "admin/res_list";
	    public static final String BATCH_LIST = "admin/batchitem_list";
	    public static final String RD_RES_LIST = "redirect:/admin/resList.form";
	    public static final String RD_BATCH_LIST = "redirect:/admin/batchList.form";
	    public static final String BATCH_INFO = "admin/batch_info";
	    public static final String RD_BATCH_INFO = "admin/batchInfo.form";
	    public static final String SERVICE_INFO = "admin/service_info";
	    public static final String DEVICE_INFO = "admin/device_info";
	    public static final String PRODUCT_INFO = "admin/product_info";
	    public static final String VIEW_EDIT_REG_INF = "/mb/edit_user_info";
	    
	    public static final String RD_AUDIT_USER = "redirect:/admin/auditUser.form";
	    public static final String VIEW_NEW_MB = "mb/register";
	    public static final String EDIT_VIEW_PSWD = "/mb/chgpswd";
	    public static final String EDIT_VIEW_PSWD_SUCC = "/mb/chgpswdSucc";
	    public static final String PUBLIST_VIEW = "mb_list";
	    public static final String INDEX = "redirect:/index.htm";
	    
	    //CONTROLLERS about news DML
	    public static final String NEWS_LIST = "admin/news_list";
	    public static final String RD_NEWS_LIST = "redirect:/admin/newsList.form";
	    public static final String NEWS_INFO = "admin/news_info";
	    public static final String RD_NEWS_INFO = "redirect:/admin/newsInfo.form";
	    
	    //pack
	    public static final String PACK_LIST = "admin/pack_list";
	    
	    //file
	    public static final String FILE_LIST = "/admin/file_list";
	    public static final String RD_FILE_LIST = "redirect:/admin/fileList.form";
	    public static final String FILE_INFO = "/admin/file_info";
	    public static final String RD_FILE_INFO = "redirect:/admin/fileInfo.form";
	    
	    public static final String RD_BRANCH_INFO = "redirect:/admin/branchInfo.form";
	    public static final String BRANCH_INFO = "admin/branch_info";
	    
	    public static final String RD_BRANCH_LIST = "redirect:/admin/branchList.form";
	    public static final String BRANCH_LIST = "admin/branch_list";
	    
	    private static final Integer IMG_TYPE_SERVICE = new Integer(1);
	    private static final Integer IMG_TYPE_DEVICE = new Integer(2);
	    private static final Integer IMG_TYPE_PRODUCT = new Integer(3);
	    
	    public static final String RD_RES_APP_LIST = "redirect:/admin/resAppList.form";
	    public static final String RES_APP_LIST = "admin/res_app_list";
	    
	    public static final String RES_REP = "admin/res_rep";
	    
	   
//		private Member getMemberInSession(HttpServletRequest request){
//			return (Member)request.getSession().getAttribute(MemberController.MB_ATTR_NAME);
//		}
		
		private void removeTempFile(HttpServletRequest request){
			String webRoot = request.getSession().getServletContext().getRealPath("/");
			File f1 = new File(webRoot + File.separator + ResourceConf.config.getProperty(ResourceConf.FILE_PATH) + File.separator + request.getSession().getId());
			if(f1.exists())
				f1.delete();
			f1 = null;
		}
		private void removeTempImg(HttpServletRequest request){
			String webRoot = request.getSession().getServletContext().getRealPath("/");
			File f1 = new File(webRoot + File.separator + ResourceConf.config.getProperty(ResourceConf.KEY_FOR_IMG_PATH_SERVICE) + File.separator + request.getSession().getId() + "_1.jpg");
			File f2 = new File(webRoot + File.separator + ResourceConf.config.getProperty(ResourceConf.KEY_FOR_IMG_PATH_SERVICE) + File.separator + request.getSession().getId() + "_2.jpg");
			File f3 = new File(webRoot + File.separator + ResourceConf.config.getProperty(ResourceConf.KEY_FOR_IMG_PATH_SERVICE) + File.separator + request.getSession().getId() + "_3.jpg");
			if(f1.exists())
				f1.delete();
			if(f2.exists())
				f2.delete();
			if(f3.exists())
				f3.delete();
			f1 = null;
			f2 = null;
			f3 = null;
		}
		private boolean isTempFile(String fPath){
			if(!StringUtils.isEmpty(fPath)){
				int from = fPath.lastIndexOf("/");
				return fPath.substring(from).length() > 30;
			}
			return false;
		}
		private void removeImg(HttpServletRequest request, String path,Integer id){
			String webRoot = request.getSession().getServletContext().getRealPath("/");
			String svcPath = path;
			if(null != svcPath)
				svcPath = svcPath.replace("/", File.separator);
			else
				svcPath = "";
			StringBuffer fn = new StringBuffer(webRoot).append(File.separator ).append(svcPath).append(File.separator).append(id)
			.append("_1.jpg");
			File f1 = new File(fn.toString());
			fn.setLength(fn.length() - 6);
			fn.append("_2.jpg");
			File f2 = new File(fn.toString());
			fn.setLength(fn.length() - 6);
			fn.append("_3.jpg");
			File f3 = new File(fn.toString());
			if(f1.exists())
				f1.delete();
			if(f2.exists())
				f2.delete();
			if(f3.exists())
				f3.delete();
			fn = null;
		}
		
		private String getExtNameFromFileName(String fName){
			int idxExt = fName.lastIndexOf(".");
			if(idxExt > 0)
				return fName.substring(idxExt+1);
			return null;
		}
		
		
	
	
	    @InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        dateFormat.setLenient(false);
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	    }
	    
}
