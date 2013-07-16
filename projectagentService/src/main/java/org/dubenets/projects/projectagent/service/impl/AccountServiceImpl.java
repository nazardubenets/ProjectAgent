package org.dubenets.projects.projectagent.service.impl;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.AccountDAOLocal;
import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.AccountServiceLocal;
import org.dubenets.projects.projectagent.service.remote.AccountServiceRemote;

/**
 * Session Bean implementation class AccountServiceImpl
 */
@Stateless
public class AccountServiceImpl extends GenericServiceImpl<Account> implements AccountServiceRemote, AccountServiceLocal {
	
    public AccountServiceImpl() {
        super();
    }
    
    @EJB(beanInterface = AccountDAOLocal.class)
    public void setGenericDAO(GenericDAO<Account> genericDAO) {
    	this.genericDAO = genericDAO;
    }

	@Override
	public Account findByUsername(String username) {
		return ((AccountDAOLocal) genericDAO).findByUsername(username);
	}

	@Override
	public List<Account> getBlockedAccounts() {
		return ((AccountDAOLocal) genericDAO).getBlockedAccounts();
	}
    
}
