package com.property.dao;

import java.util.List;

import com.property.entity.Agent;

public interface AgentDAO {
	void addAgent(Agent agent)throws Exception;
	List<Agent> findAgent(Agent agent);
	void modifyAgent(Agent agent) throws Exception;
	void delAgent(Integer agentId) throws Exception; 
}
