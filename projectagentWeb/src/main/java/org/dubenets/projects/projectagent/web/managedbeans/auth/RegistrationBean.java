package org.dubenets.projects.projectagent.web.managedbeans.auth;

import java.io.Serializable;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.domain.models.Employee;
import org.dubenets.projects.projectagent.domain.models.ProjectOwner;
import org.dubenets.projects.projectagent.service.local.EmployeeServiceLocal;
import org.dubenets.projects.projectagent.service.local.ProjectOwnerServiceLocal;

@ManagedBean
@ViewScoped
public class RegistrationBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3965537739759107231L;

	@EJB
	private EmployeeServiceLocal employeeServiceLocal;
	
	@EJB
	private ProjectOwnerServiceLocal projectOwnerServiceLocal;
	
	private Account user = new Account();
	
	public String registerAsEmployee() {
		Employee employee = new Employee();
		employee.setAccount(user);
		employeeServiceLocal.save(employee);
		return "login?faces-redirect=true";
	}
	
	public String registerAsProjectOwner() {
		ProjectOwner projectOwner = new ProjectOwner();
		projectOwner.setAccount(user);
		projectOwnerServiceLocal.save(projectOwner);
		return "login?faces-redirect=true";
	}
	
	public Account getUser() {
		return user;
	}

	public void setUser(Account user) {
		this.user = user;
	}

	public EmployeeServiceLocal getEmployeeServiceLocal() {
		return employeeServiceLocal;
	}

	public void setEmployeeServiceLocal(EmployeeServiceLocal employeeServiceLocal) {
		this.employeeServiceLocal = employeeServiceLocal;
	}

	public ProjectOwnerServiceLocal getProjectOwnerServiceLocal() {
		return projectOwnerServiceLocal;
	}

	public void setProjectOwnerServiceLocal(
			ProjectOwnerServiceLocal projectOwnerServiceLocal) {
		this.projectOwnerServiceLocal = projectOwnerServiceLocal;
	}
}
