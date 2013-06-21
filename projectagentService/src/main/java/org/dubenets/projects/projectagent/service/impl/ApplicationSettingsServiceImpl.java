package org.dubenets.projects.projectagent.service.impl;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.ApplicationSettingsDAOLocal;
import org.dubenets.projects.projectagent.domain.models.ApplicationSettings;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.ApplicationSettingsServiceLocal;
import org.dubenets.projects.projectagent.service.remote.ApplicationSettingsServiceRemote;

/**
 * Session Bean implementation class ApplicationSettingsServiceImpl
 */
@Stateless(mappedName = "ApplicationSettingsServiceImpl")
public class ApplicationSettingsServiceImpl extends GenericServiceImpl<ApplicationSettings> implements ApplicationSettingsServiceRemote, ApplicationSettingsServiceLocal {
       
    public ApplicationSettingsServiceImpl() {
        super();
    }
    
    @EJB(beanInterface = ApplicationSettingsDAOLocal.class)
    public void setGenericDAO(GenericDAO<ApplicationSettings> genericDAO) {
    	this.genericDAO = genericDAO;
    }

}
