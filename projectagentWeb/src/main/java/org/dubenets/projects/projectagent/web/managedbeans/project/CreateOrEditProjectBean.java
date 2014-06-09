package org.dubenets.projects.projectagent.web.managedbeans.project;

import java.io.Serializable;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;
import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.local.ApplicationUserServiceLocal;
import org.dubenets.projects.projectagent.service.local.ProjectServiceLocal;
import org.dubenets.projects.projectagent.web.utility.JSFUtility;
import org.dubenets.projects.projectagent.web.utility.SpringSecurityUtility;

@ManagedBean
@ViewScoped
public class CreateOrEditProjectBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6809302444524081932L;

	@EJB
	private ProjectServiceLocal projectServiceLocal;
	
	@EJB
	private ApplicationUserServiceLocal applicationUserServiceLocal;

	private Project project;

	private ApplicationUser selectedEmployee;
	
	@PostConstruct
	public void initializeBean() {
		Long projectID = getProjectIDFromRequest();
		if (projectID == null) {
			initalizeBeanForProjectCreation();
		} else {
			initalizeBeanForProjectEditing(projectID);
		}
	}

	private Long getProjectIDFromRequest() {
		String projectID = JSFUtility.getRequestParameter("projectID");
		if ((projectID != null) && (projectID.length() > 0)) {
			return Long.valueOf(projectID);
		} else {
			return null;
		}
	}

	private void initalizeBeanForProjectCreation() {
		project = new Project();
		project.setProjectOwner(applicationUserServiceLocal.findById(SpringSecurityUtility.getPrincipal().getId()));
	}

	private void initalizeBeanForProjectEditing(Long projectID) {
		project = projectServiceLocal.findById(projectID);
		if (project == null) {
			JSFUtility.sendError(404, "This project doesn't exist.");
		} else if (!project.getProjectOwner().getId().equals(SpringSecurityUtility.getPrincipal().getId())) {
			JSFUtility.sendError(403, "You are not an owner of this project.");
		}
	}
	
	public String remove(ApplicationUser employee) {
		project.getHiredEmployees().remove(employee);
		projectServiceLocal.update(project);
		return null;
	}
	
	public String saveProject() {
		projectServiceLocal.update(project);
		return "listOwnerProjects";
	}
	
	public String publishProject() {
		project.setReadinessStage(ReadinessStage.PUBLISHED);
		projectServiceLocal.update(project);
		return "listOwnerProjects";
	}
	
	public String startProject() {
		project.setReadinessStage(ReadinessStage.STARTED);
		projectServiceLocal.update(project);
		return "listOwnerProjects";
	}
	
	public String stopProject() {
		project.setReadinessStage(ReadinessStage.STOPPED);
		projectServiceLocal.update(project);
		return "listOwnerProjects";
	}

	public String finishProject() {
		project.setReadinessStage(ReadinessStage.FINISHED);
		projectServiceLocal.update(project);
		return "listOwnerProjects";
	}
	
	public boolean isReadyToFinish() {
		return project.getReadinessStage().equals(ReadinessStage.STARTED) && new Date().after(project.getEndTime());
	}
	
	public boolean isReadyToStart() {
		return project.getReadinessStage().equals(ReadinessStage.PUBLISHED) && new Date().after(project.getStartTime()) && (project.getHiredEmployees().size() == project.getMaxHiredEmployees());
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

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ApplicationUser getSelectedEmployee() {
		return selectedEmployee;
	}

	public void setSelectedEmployee(ApplicationUser selectedEmployee) {
		this.selectedEmployee = selectedEmployee;
	}
}
