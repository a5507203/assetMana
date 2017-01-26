/**
 * 
 */
package com.property.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.property.dao.AgentDAO;
import com.property.entity.Agent;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * @author a
 *
 */
public class AgentDAOImpl implements AgentDAO {

	private SqlMapClient sqlMapClient;
	private static Log log = LogFactory.getLog(AgentDAO.class.getName());
	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	@Override
	public void addAgent(Agent agent) throws Exception {
		try {
			this.getSqlMapClient().insert("agent.addAgent", agent);
		} catch (SQLException e) {
			log.error("增加用户信息失败", e);
			throw e;
		}
		return;
	}

	@Override
	public List<Agent> findAgent(Agent agent) {
		List<Agent> agentList = null;
		if (agent != null) {
			/*String hostName = agent.getHostName();
			String userMac = authQryItem.getUserMac();
			String userIp = authQryItem.getUserIp();

			queryItem = authQryItem.duplicate();
			if (false == StringUtils.isEmpty(hostName)) {
				queryItem.setHostName("%" + hostName + "%");
			}
			if (false == StringUtils.isEmpty(userMac)) {
				queryItem.setUserMac("%" + userMac + "%");
			}
			if (false == StringUtils.isEmpty(userIp)) {
				queryItem.setUserIp("%" + userIp + "%");
			}*/
			if(agent.getName()!=null)
			if(agent.getName().isEmpty()== false)
				agent.setName("%" + agent.getName() + "%");
			
			if(agent.getMobile()!=null)
				if(agent.getMobile().isEmpty()== false)
					agent.setMobile("%" + agent.getMobile() + "%");
				
			
			
		} else {
			agent = new Agent();
		}
		
		try {
			//agentList = this.getSqlMapClient().queryForList("agent.listAgentAll",1);
			agentList = this.getSqlMapClient().queryForList("agent.listAgent", agent);
			
		} catch (SQLException e) {
			log.error("用户查询失败findAgent(Agent agent)", e);
		}
		return agentList;
		
	}

	@Override
	public void modifyAgent(Agent agent) throws Exception {
		
		
		try {
			this.getSqlMapClient().update("agent.modifyAgent", agent);
		} catch (SQLException e) {
			log.error("修改用户信息失败", e);
			throw e;
		}
		return;
		
		
	}

	@Override
	public void delAgent(Integer agentId) throws Exception {
		
		try {
			this.getSqlMapClient().delete("agent.deleteAgent", agentId);
		} catch (SQLException e) {
			log.error("删除用户信息失败", e);
			throw e;
		}
		return;
		
		
		
		
	}


}
