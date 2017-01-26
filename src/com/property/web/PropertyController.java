package com.property.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
 



import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;



import com.property.dao.AgentDAO;
import com.property.entity.Agent;
@Controller
@RequestMapping( { "/property/*.form", "/property/*.htm" })

public class PropertyController {
	 private static Log log = LogFactory.getLog(PropertyController.class.getName());
 
	
	@Autowired
	private AgentDAO agentDAO;

	
	
	public AgentDAO getAgentDAO() {
		return agentDAO;
	}

	public void setagentDAO(AgentDAO agentDAO) {
		this.agentDAO = agentDAO;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String headerAddnew(@ModelAttribute() Agent queryAgent,HttpSession session, ModelMap model) {
	
		if(queryAgent == null)
		{
			queryAgent= new Agent();
		}
		model.addAttribute("agent",queryAgent);
			return "property/addNewAgent";
	}
		
	
	@RequestMapping(method = RequestMethod.GET)
	public String deleteAgent(@RequestParam(value = "userId", required = false) Integer userId,HttpSession session, ModelMap model) {
	
		try {
			  this.getAgentDAO().delAgent(userId);
			} catch (Exception e) {
		 
				log.error("delete agent信息失败,reason："+e.getMessage());
				return "redirect:/property/agentQuery.form" + "?err=1";
				
			}
			return "redirect:/property/agentQuery.form"+"?succ=1";
	}
	
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String updateAgent(@ModelAttribute() Agent postAgent,HttpSession session, ModelMap model) {
		 
		boolean isEdit = true;
		
		try {
			if (null == postAgent.getId()){
				isEdit = false;        
				this.getAgentDAO().addAgent(postAgent);
			}else
				this.getAgentDAO().modifyAgent(postAgent);
			} catch (Exception e) {
			if(isEdit)
			{
				log.error("更新agent信息失败,reason："+e.getMessage());
				return "redirect:/property/agentQuery.form" + "?err=1";
				
			}
			else
			{
				log.error("添加agent信息失败,reason："+e.getMessage());
				return "redirect:/property/headerAddnew.form" + "?err=1";
				
			}
			
		
		}
			if(isEdit)
			return "redirect:/property/agentQuery.form"+"?succ=1";
			else
				return "redirect:/property/headerAddnew.form"+"?succ=1";
	
 

}

	@RequestMapping(method = RequestMethod.GET)
	public String agentQuery(@ModelAttribute() Agent queryAgent,HttpSession session, ModelMap model) {
		 
		
		log.error("_____________————_____________________begin");
		
		   
		//model.addAttribute("retMsg", "");
		/*Agent authQryItem = (Agent) session.getAttribute("authQryItem");
		if (authQryItem == null) {
			authQryItem = new UserInfoQueryItem();
		}*/
		List<Agent> agentList = this.getAgentDAO().findAgent(queryAgent);
		model.addAttribute("agentList", agentList);
		log.error("_____________————_____________________begin"+agentList.size());
		log.error("_________________________________end");
		
		
		return "property/agentQueryList";
	}

}
