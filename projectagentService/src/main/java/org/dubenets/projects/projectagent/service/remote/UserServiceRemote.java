package org.dubenets.projects.projectagent.service.remote;

import java.util.List;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.domain.enums.UserRole;
import org.dubenets.projects.projectagent.domain.models.User;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Remote
public interface UserServiceRemote extends GenericService<User> {

	public List<User> getUsersWithRoles(UserRole ... userRoles);
	
}
