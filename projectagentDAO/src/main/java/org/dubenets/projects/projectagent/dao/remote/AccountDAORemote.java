package org.dubenets.projects.projectagent.dao.remote;

import java.util.List;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.Account;

@Remote
public interface AccountDAORemote extends GenericDAO<Account> {
	public Account findByUsername(String username);
	
	public List<Account> getBlockedAccounts();
}
