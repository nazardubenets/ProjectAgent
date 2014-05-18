package org.dubenets.projects.projectagent.web.managedbeans.project;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.local.ProjectServiceLocal;

@ManagedBean
@ViewScoped
public class ListProjectsForEmployeeBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7793527755450836536L;

	@EJB
	private ProjectServiceLocal projectServiceLocal;
	
	private List<Project> allProjects;
	
	private List<Project> filteredAllProjects = new ArrayList<Project>();
	
	private List<Project> myProjects = new ArrayList<Project>();
	
	private List<Project> filteredMyProjects = new ArrayList<Project>();
	
	@PostConstruct
	public void initializeBean() {
		allProjects = projectServiceLocal.getAll();
	}
	
	public String signFor(Project project) {
		allProjects.remove(project);
		myProjects.add(project);
		return null;
	}
	
	public String unsignFrom(Project project) {
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
