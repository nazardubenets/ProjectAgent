package org.dubenets.projects.projectagent.dao.local;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.ApplicationSettings;

@Local
public interface ApplicationSettingsDAOLocal extends GenericDAO<ApplicationSettings>{

}
