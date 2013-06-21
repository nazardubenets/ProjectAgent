package org.dubenets.projects.projectagent.dao.remote;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.Project;

@Remote
public interface ProjectDAORemote extends GenericDAO<Project> {

}
