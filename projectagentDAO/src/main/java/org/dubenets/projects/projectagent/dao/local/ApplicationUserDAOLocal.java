package org.dubenets.projects.projectagent.dao.local;

import java.util.List;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;

@Local
public interface ApplicationUserDAOLocal extends GenericDAO<ApplicationUser> {

	public List<ApplicationUser> getUsersWithRoles(Role ... userRoles);	
	
}
