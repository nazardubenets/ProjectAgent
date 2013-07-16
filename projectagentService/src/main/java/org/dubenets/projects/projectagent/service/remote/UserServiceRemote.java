package org.dubenets.projects.projectagent.service.remote;

import java.util.List;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Remote
public interface UserServiceRemote extends GenericService<ApplicationUser> {

	public List<ApplicationUser> getUsersWithRoles(Role ... userRoles);
	
}
