package org.dubenets.projects.projectagent.dao.local;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.ProjectOwner;

@Local
public interface ProjectOwnerDAOLocal extends GenericDAO<ProjectOwner> {

}
