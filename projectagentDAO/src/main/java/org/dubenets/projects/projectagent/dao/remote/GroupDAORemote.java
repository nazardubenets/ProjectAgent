package org.dubenets.projects.projectagent.dao.remote;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.Group;

@Remote
public interface GroupDAORemote extends GenericDAO<Group> {

}
