package org.dubenets.projects.projectagent.service.remote;

import java.util.List;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Remote
public interface AccountServiceRemote extends GenericService<Account> {

	public Account findByUsername(String username);

	public List<Account> getBlockedAccounts();
}
