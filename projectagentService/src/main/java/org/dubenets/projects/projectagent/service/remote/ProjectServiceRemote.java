package org.dubenets.projects.projectagent.service.remote;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Remote
public interface ProjectServiceRemote extends GenericService<Project> {

}
