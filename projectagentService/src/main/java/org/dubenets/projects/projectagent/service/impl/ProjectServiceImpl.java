package org.dubenets.projects.projectagent.service.impl;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.ProjectDAOLocal;
import org.dubenets.projects.projectagent.domain.models.Project;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.ProjectServiceLocal;
import org.dubenets.projects.projectagent.service.remote.ProjectServiceRemote;

/**
 * Session Bean implementation class ProjectServiceImpl
 */
@Stateless(mappedName = "ProjectServiceImpl")
public class ProjectServiceImpl extends GenericServiceImpl<Project> implements ProjectServiceRemote, ProjectServiceLocal {
       
    public ProjectServiceImpl() {
        super();
    }

    @EJB(beanInterface = ProjectDAOLocal.class)
    public void setGenericDAO(GenericDAO<Project> genericDAO) {
    	this.genericDAO = genericDAO;
    }
}
