package org.dubenets.projects.projectagent.service.local;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.domain.models.ProjectOwner;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Local
public interface ProjectOwnerServiceLocal  extends GenericService<ProjectOwner> {

}
