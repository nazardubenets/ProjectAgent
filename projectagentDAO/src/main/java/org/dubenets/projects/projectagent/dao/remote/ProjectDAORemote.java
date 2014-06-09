package org.dubenets.projects.projectagent.dao.remote;

import java.util.List;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;
import org.dubenets.projects.projectagent.domain.models.Project;

@Remote
public interface ProjectDAORemote extends GenericDAO<Project> {
	List<Project> getByStages(ReadinessStage ... stages);
}
