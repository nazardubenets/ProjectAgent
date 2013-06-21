package org.dubenets.projects.projectagent.dao.local;

import java.util.List;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.Account;

@Local
public interface AccountDAOLocal extends GenericDAO<Account>{
	public Account findByUsername(String username);
	
	public List<Account> getBlockedAccounts();
}
