package org.dubenets.projects.projectagent.dao.impl;

import javax.ejb.Stateless;
import org.dubenets.projects.projectagent.dao.generic.impl.GenericDAOImpl;
import org.dubenets.projects.projectagent.dao.local.ApplicationSettingsDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.ApplicationSettingsDAORemote;
import org.dubenets.projects.projectagent.domain.models.ApplicationSettings;

/**
 * Session Bean implementation class ApplicationSettingsDAOImpl
 */
@Stateless(mappedName = "ApplicationSettingsDAOImpl")
public class ApplicationSettingsDAOImpl extends GenericDAOImpl<ApplicationSettings> implements ApplicationSettingsDAORemote, ApplicationSettingsDAOLocal {
       
    public ApplicationSettingsDAOImpl() {
        super();
    }
}
