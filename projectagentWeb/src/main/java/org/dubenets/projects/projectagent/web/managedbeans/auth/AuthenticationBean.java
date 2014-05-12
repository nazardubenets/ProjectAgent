package org.dubenets.projects.projectagent.web.managedbeans.auth;

import java.io.IOException;
import java.io.Serializable;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.domain.models.Employee;
import org.dubenets.projects.projectagent.domain.models.ProjectOwner;
import org.dubenets.projects.projectagent.service.local.AccountServiceLocal;
import org.dubenets.projects.projectagent.service.local.EmployeeServiceLocal;
import org.dubenets.projects.projectagent.service.local.ProjectOwnerServiceLocal;
import org.dubenets.projects.projectagent.web.utility.JSFUtility;
import org.dubenets.projects.projectagent.web.utility.SpringSecurityUtility;
import org.dubenets.projects.projectagent.web.utility.helpermodels.UserDetailsAccount;

@ManagedBean
@SessionScoped
public class AuthenticationBean implements Serializable{
	
	@EJB
	private ProjectOwnerServiceLocal projectOwnerServiceLocal;
	
	@EJB
	private EmployeeServiceLocal employeeServiceLocal;
	
	@EJB
	private AccountServiceLocal accountServiceLocal;
	/**
	 * 
	 */
	private static final long serialVersionUID = 7514218637918860250L;

	private String login() throws IOException, ServletException {
		forwardExecutionToSpringSecurityURL("/j_spring_security_check");
		return null;
	}
	public String loginAsEmployee() throws IOException, ServletException {
		Account account = accountServiceLocal.findByUsername(JSFUtility.getRequestParameter("j_username"));
		Employee employee = null;
		if (account != null) {
			employee = employeeServiceLocal.findById(account.getId());
		}
		if (employee != null) {
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("isProjectOwner", false);
			return login();
		} else {
			FacesContext.getCurrentInstance().addMessage("j_username", new FacesMessage("Employee doesn't exist."));
			return null;
		}
	}
	public String loginAsProjectOwner() throws IOException, ServletException {
		Account account = accountServiceLocal.findByUsername(JSFUtility.getRequestParameter("j_username"));
		ProjectOwner projectOwner = null;
		if (account != null) {
			projectOwner = projectOwnerServiceLocal.findById(account.getId());
		}
		if (projectOwner != null) {
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("isProjectOwner", true);
			return login();
		} else {
			FacesContext.getCurrentInstance().addMessage("j_username", new FacesMessage("ProjectOwner doesn't exist."));
			return null;
		}
	}

	public String logout() throws IOException, ServletException {
		forwardExecutionToSpringSecurityURL("/j_spring_security_logout");
		return null;
	}
	
	public UserDetailsAccount getPrincipal() {
		return SpringSecurityUtility.getPrincipal();
	}

	private void forwardExecutionToSpringSecurityURL(String url) throws ServletException, IOException {
		ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
		RequestDispatcher dispatcher = ((ServletRequest) context.getRequest()).getRequestDispatcher(url);
		dispatcher.forward((ServletRequest) context.getRequest(), (ServletResponse) context.getResponse());
		FacesContext.getCurrentInstance().responseComplete();
	}
	public ProjectOwnerServiceLocal getProjectOwnerServiceLocal() {
		return projectOwnerServiceLocal;
	}
	public void setProjectOwnerServiceLocal(
			ProjectOwnerServiceLocal projectOwnerServiceLocal) {
		this.projectOwnerServiceLocal = projectOwnerServiceLocal;
	}
	public EmployeeServiceLocal getEmployeeServiceLocal() {
		return employeeServiceLocal;
	}
	public void setEmployeeServiceLocal(EmployeeServiceLocal employeeServiceLocal) {
		this.employeeServiceLocal = employeeServiceLocal;
	}
	public AccountServiceLocal getAccountServiceLocal() {
		return accountServiceLocal;
	}
	public void setAccountServiceLocal(AccountServiceLocal accountServiceLocal) {
		this.accountServiceLocal = accountServiceLocal;
	}
}
