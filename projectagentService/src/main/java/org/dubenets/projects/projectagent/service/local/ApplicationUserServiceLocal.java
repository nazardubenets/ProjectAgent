package org.dubenets.projects.projectagent.service.local;

import java.util.List;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Local
public interface ApplicationUserServiceLocal extends GenericService<ApplicationUser> {

	public List<ApplicationUser> getUsersWithRoles(Role ... userRoles);
}
