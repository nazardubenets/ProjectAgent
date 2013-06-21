package org.dubenets.projects.projectagent.dao.local;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.Project;

@Local
public interface ProjectDAOLocal extends GenericDAO<Project> {

}
