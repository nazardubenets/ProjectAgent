package org.dubenets.projects.projectagent.web.common;

import java.io.Serializable;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;
import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;
import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.local.ApplicationUserServiceLocal;
import org.dubenets.projects.projectagent.web.utility.JSFUtility;
import org.dubenets.projects.projectagent.web.utility.SpringSecurityUtility;

@ManagedBean
@ViewScoped
public class UpdateProfileBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6233705912638747556L;
	
	@EJB
	private ApplicationUserServiceLocal applicationUserServiceLocal;

	private ApplicationUser user;

	@PostConstruct
	public void initializeBean() {
		String userID = JSFUtility.getRequestParameter("userID");
		if ((userID != null) && (userID.length() > 0)) {
			user = applicationUserServiceLocal.findById(Long.valueOf(userID));
		} else {
			user = applicationUserServiceLocal.findById(SpringSecurityUtility.getPrincipal().getId());
		}
	}
	
	public void updateProfile() {
		applicationUserServiceLocal.update(user);
	}
	
	public int getFinishedProjectsCount() {
		int count = 0;
		Set<Project> projects =  user.getAccount().getRole().equals(Role.ROLE_EMPLOYEE) ? user.getPartisipatedProjects() : user.getOwnedProjects();
		for (Project project : projects) {
			if (project.getReadinessStage().equals(ReadinessStage.FINISHED)) {
				count++;
			}
		}
		return count;
	}
	
	public int getStoppedProjectsCount() {
		int count = 0;
		Set<Project> projects =  user.getAccount().getRole().equals(Role.ROLE_EMPLOYEE) ? user.getPartisipatedProjects() : user.getOwnedProjects();
		for (Project project : projects) {
			if (project.getReadinessStage().equals(ReadinessStage.STOPPED)) {
				count++;
			}
		}
		return count;
	}
	
	public int getPublishedProjectsCount() {
		int count = 0;
		Set<Project> projects =  user.getAccount().getRole().equals(Role.ROLE_EMPLOYEE) ? user.getPartisipatedProjects() : user.getOwnedProjects();
		for (Project project : projects) {
			if (project.getReadinessStage().equals(ReadinessStage.PUBLISHED)) {
				count++;
			}
		}
		return count;
	}

	public ApplicationUserServiceLocal getApplicationUserServiceLocal() {
		return applicationUserServiceLocal;
	}

	public void setApplicationUserServiceLocal(
			ApplicationUserServiceLocal applicationUserServiceLocal) {
		this.applicationUserServiceLocal = applicationUserServiceLocal;
	}

	public ApplicationUser getUser() {
		return user;
	}

	public void setUser(ApplicationUser user) {
		this.user = user;
	}
}
