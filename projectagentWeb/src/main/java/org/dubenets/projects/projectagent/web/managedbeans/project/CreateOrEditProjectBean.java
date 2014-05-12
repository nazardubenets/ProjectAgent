package org.dubenets.projects.projectagent.web.managedbeans.project;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.local.ProjectOwnerServiceLocal;
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
	private ProjectOwnerServiceLocal projectOwnerServiceLocal;

	private Project project;

	@PostConstruct
	public void initializeBean() {
		Boolean isProjectOwner = (Boolean)JSFUtility.getSessionParameter("isProjectOwner");
		if (isProjectOwner) {
			Long projectID = getProjectIDFromRequest();
			if (projectID == null) {
				initalizeBeanForProjectCreation();
			} else {
				initalizeBeanForProjectEditing(projectID);
			}
		} else {
			JSFUtility.sendError(403, "Only ProjectOwner can create or update projects.");
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
		project.setProjectOwner(projectOwnerServiceLocal.findById(SpringSecurityUtility.getPrincipal().getId()));
	}

	private void initalizeBeanForProjectEditing(Long projectID) {
		project = projectServiceLocal.findById(projectID);
		if (project == null) {
			JSFUtility.sendError(404, "This project doesn't exist.");
		} else if (!project.getProjectOwner().getId().equals(SpringSecurityUtility.getPrincipal().getId())) {
			JSFUtility.sendError(403, "You are not an oner of this project.");
		}
	}
	
	public String saveProject() {
		projectServiceLocal.update(project);
		return "main";
	}

	public ProjectServiceLocal getProjectServiceLocal() {
		return projectServiceLocal;
	}

	public void setProjectServiceLocal(ProjectServiceLocal projectServiceLocal) {
		this.projectServiceLocal = projectServiceLocal;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
}
