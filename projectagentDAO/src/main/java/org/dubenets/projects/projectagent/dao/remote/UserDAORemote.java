package org.dubenets.projects.projectagent.dao.remote;

import java.util.List;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;

@Remote
public interface UserDAORemote extends GenericDAO<ApplicationUser> {
	
	public List<ApplicationUser> getUsersWithRoles(Role ... userRoles);
	
}
