package org.dubenets.projects.projectagent.dao.local;

import java.util.List;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.enums.UserRole;
import org.dubenets.projects.projectagent.domain.models.User;

@Local
public interface UserDAOLocal extends GenericDAO<User> {

	public List<User> getUsersWithRoles(UserRole ... userRoles);	
	
}
