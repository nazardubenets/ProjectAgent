package org.dubenets.projects.projectagent.web.managedbeans.auth;

import java.io.Serializable;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;
import org.dubenets.projects.projectagent.service.local.ApplicationUserServiceLocal;

@ManagedBean
@ViewScoped
public class RegistrationBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3965537739759107231L;

	@EJB
	private ApplicationUserServiceLocal applicationUserServiceLocal;
	
	private Account user = new Account();
	
	public String registerAsEmployee() {
		register(Role.ROLE_EMPLOYEE);
		return "login?faces-redirect=true";
	}
	
	public String registerAsProjectOwner() {
		register(Role.ROLE_PROJECTOWNER);
		return "login?faces-redirect=true";
	}
	
	private void register(Role role) {
		user.setRole(role);
		ApplicationUser applicationUser = new ApplicationUser();
		applicationUser.setAccount(user);
		applicationUserServiceLocal.save(applicationUser);
	}
	
	public Account getUser() {
		return user;
	}

	public void setUser(Account user) {
		this.user = user;
	}

	public ApplicationUserServiceLocal getApplicationUserServiceLocal() {
		return applicationUserServiceLocal;
	}

	public void setApplicationUserServiceLocal(
			ApplicationUserServiceLocal applicationUserServiceLocal) {
		this.applicationUserServiceLocal = applicationUserServiceLocal;
	}
}
