package org.dubenets.projects.projectagent.dao.remote;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.ProjectOwner;

@Remote
public interface ProjectOwnerDAORemote extends GenericDAO<ProjectOwner> {

}
