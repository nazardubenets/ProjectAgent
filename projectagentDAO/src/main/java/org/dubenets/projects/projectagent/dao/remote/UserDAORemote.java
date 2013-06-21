package org.dubenets.projects.projectagent.dao.remote;

import java.util.List;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.enums.UserRole;
import org.dubenets.projects.projectagent.domain.models.User;

@Remote
public interface UserDAORemote extends GenericDAO<User> {
	
	public List<User> getUsersWithRoles(UserRole ... userRoles);
	
}
