package org.dubenets.projects.projectagent.web.managedbeans.admin.accounts;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.service.local.AccountServiceLocal;
import org.dubenets.projects.projectagent.web.utility.AccountConverter;
import org.dubenets.projects.projectagent.web.utility.SpringSecurityUtility;


@ManagedBean
@ViewScoped
public class ListAccountsBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7097588487041468213L;

	@EJB
	private AccountServiceLocal accountServiceLocal;
	
	private List<Account> allAccounts;
	
	private List<Account> selectedAccounts = new ArrayList<Account>();
	
	@PostConstruct
	public void initializeBean() {
		allAccounts = accountServiceLocal.getAll();
		allAccounts.remove(AccountConverter.convertToAccount(SpringSecurityUtility.getPrincipal()));
	}
	
	public String block() {
		for (Account selectedAccount : selectedAccounts) {
			selectedAccount.setBlocked(true);
			accountServiceLocal.update(selectedAccount);
		}
		return null;
	}
	
	public String unblock() {
		for (Account selectedAccount : selectedAccounts) {
			selectedAccount.setBlocked(false);
			accountServiceLocal.update(selectedAccount);
		}
		return null;
	}

	public AccountServiceLocal getAccountServiceLocal() {
		return accountServiceLocal;
	}

	public void setAccountServiceLocal(AccountServiceLocal accountServiceLocal) {
		this.accountServiceLocal = accountServiceLocal;
	}

	public List<Account> getAllAccounts() {
		return allAccounts;
	}

	public void setAllAccounts(List<Account> allAccounts) {
		this.allAccounts = allAccounts;
	}

	public List<Account> getSelectedAccounts() {
		return selectedAccounts;
	}

	public void setSelectedAccounts(List<Account> selectedAccounts) {
		this.selectedAccounts = selectedAccounts;
	}
}
