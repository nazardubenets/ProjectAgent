package org.dubenets.projects.projectagent.service.local;

import java.util.List;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.domain.enums.UserRole;
import org.dubenets.projects.projectagent.domain.models.User;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Local
public interface UserServiceLocal extends GenericService<User> {

	public List<User> getUsersWithRoles(UserRole ... userRoles);
}
