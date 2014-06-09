package org.dubenets.projects.projectagent.web.managedbeans.project;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;
import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.local.ApplicationUserServiceLocal;
import org.dubenets.projects.projectagent.service.local.ProjectServiceLocal;
import org.dubenets.projects.projectagent.web.utility.SpringSecurityUtility;

@ManagedBean
@ViewScoped
public class ListProjectsForEmployeeBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7793527755450836536L;

	@EJB
	private ProjectServiceLocal projectServiceLocal;
	
	@EJB
	private ApplicationUserServiceLocal applicationUserServiceLocal;
	
	private ApplicationUser employee;
	
	private List<Project> allProjects;
	
	private List<Project> filteredAllProjects = new ArrayList<Project>();
	
	private List<Project> myProjects = new ArrayList<Project>();
	
	private List<Project> filteredMyProjects = new ArrayList<Project>();
	
	@PostConstruct
	public void initializeBean() {
		allProjects = projectServiceLocal.getAll();
		employee = applicationUserServiceLocal.findById(SpringSecurityUtility.getPrincipal().getId());
		List<Project> tempList = new ArrayList<Project>();
		for (Project project : allProjects) {
			if (project.getHiredEmployees().contains(employee) || !project.getReadinessStage().equals(ReadinessStage.PUBLISHED)) {
				if (project.getHiredEmployees().contains(employee)) {
					myProjects.add(project);
				} else {
					tempList.add(project);
				}
			}
		}
		allProjects.removeAll(tempList);
		allProjects.removeAll(myProjects);
	}
	
	public String signFor(Project project) {
		project.getHiredEmployees().add(employee);
		projectServiceLocal.update(project);
		allProjects.remove(project);
		myProjects.add(project);
		return null;
	}
	
	public String unsignFrom(Project project) {
		project.getHiredEmployees().remove(employee);
		projectServiceLocal.update(project);
		myProjects.remove(project);
		allProjects.add(project);
		return null;
	}

	public ProjectServiceLocal getProjectServiceLocal() {
		return projectServiceLocal;
	}

	public void setProjectServiceLocal(ProjectServiceLocal projectServiceLocal) {
		this.projectServiceLocal = projectServiceLocal;
	}

	public ApplicationUserServiceLocal getApplicationUserServiceLocal() {
		return applicationUserServiceLocal;
	}

	public void setApplicationUserServiceLocal(
			ApplicationUserServiceLocal applicationUserServiceLocal) {
		this.applicationUserServiceLocal = applicationUserServiceLocal;
	}

	public ApplicationUser getEmployee() {
		return employee;
	}

	public void setEmployee(ApplicationUser employee) {
		this.employee = employee;
	}

	public List<Project> getAllProjects() {
		return allProjects;
	}

	public void setAllProjects(List<Project> allProjects) {
		this.allProjects = allProjects;
	}

	public List<Project> getFilteredAllProjects() {
		return filteredAllProjects;
	}

	public void setFilteredAllProjects(List<Project> filteredAllProjects) {
		this.filteredAllProjects = filteredAllProjects;
	}

	public List<Project> getMyProjects() {
		return myProjects;
	}

	public void setMyProjects(List<Project> myProjects) {
		this.myProjects = myProjects;
	}

	public List<Project> getFilteredMyProjects() {
		return filteredMyProjects;
	}

	public void setFilteredMyProjects(List<Project> filteredMyProjects) {
		this.filteredMyProjects = filteredMyProjects;
	}
}
