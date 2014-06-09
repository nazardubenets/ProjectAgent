package org.dubenets.projects.projectagent.dao.local;

import java.util.List;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;
import org.dubenets.projects.projectagent.domain.models.Project;

@Local
public interface ProjectDAOLocal extends GenericDAO<Project> {
	List<Project> getByStages(ReadinessStage ... stages);
}
