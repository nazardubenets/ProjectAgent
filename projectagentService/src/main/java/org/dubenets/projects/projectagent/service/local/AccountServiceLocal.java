package org.dubenets.projects.projectagent.service.local;

import java.util.List;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Local
public interface AccountServiceLocal extends GenericService<Account> {
	
	public Account findByUsername(String username);

	public List<Account> getBlockedAccounts();
}
