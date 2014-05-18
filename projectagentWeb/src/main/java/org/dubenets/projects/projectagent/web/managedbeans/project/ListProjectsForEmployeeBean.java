package org.dubenets.projects.projectagent.web.managedbeans.project;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.models.Employee;
import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.local.EmployeeServiceLocal;
import org.dubenets.projects.projectagent.service.local.ProjectServiceLocal;
import org.dubenets.projects.projectagent.web.utility.JSFUtility;
import org.dubenets.projects.projectagent.web.utility.SpringSecurityUtility;
import org.primefaces.context.RequestContext;

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
	private EmployeeServiceLocal employeeServiceLocal;
	
	private Employee employee;
	
	private List<Project> allProjects;
	
	private List<Project> filteredAllProjects = new ArrayList<Project>();
	
	private List<Project> myProjects = new ArrayList<Project>();
	
	private List<Project> filteredMyProjects = new ArrayList<Project>();
	
	@PostConstruct
	public void initializeBean() {
		Boolean isProjectOwner = (Boolean)JSFUtility.getSessionParameter("isProjectOwner");
		if (!isProjectOwner) {
			allProjects = projectServiceLocal.getAll();
			employee = employeeServiceLocal.findById(SpringSecurityUtility.getPrincipal().getId());
			for (Project project : allProjects) {
				if (project.getHiredEmployees().contains(employee)) {
					myProjects.add(project);
				}
			}
			allProjects.removeAll(myProjects);
		} else {
			JSFUtility.sendError(403, "Only Employee can sign for projects.");
		}
	}
	
	public String signFor(Project project) {
		project.getHiredEmployees().add(employee);
		//employee.getPartisipatedProjects().add(project);
		projectServiceLocal.update(project);
		allProjects.remove(project);
		myProjects.add(project);
		RequestContext.getCurrentInstance().addCallbackParam("projectId", project.getId());
		return null;
	}
	
	public String unsignFrom(Project project) {
		project.getHiredEmployees().remove(employee);
		//employee.getPartisipatedProjects().remove(project);
		projectServiceLocal.update(project);
		myProjects.remove(project);
		allProjects.add(project);
		RequestContext.getCurrentInstance().addCallbackParam("projectId", project.getId());
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
