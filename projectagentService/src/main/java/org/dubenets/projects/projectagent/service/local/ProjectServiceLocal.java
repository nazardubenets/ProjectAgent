package org.dubenets.projects.projectagent.service.local;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Local
public interface ProjectServiceLocal  extends GenericService<Project> {

}
