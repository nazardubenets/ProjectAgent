package org.dubenets.projects.projectagent.service.impl;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.ProjectOwnerDAOLocal;
import org.dubenets.projects.projectagent.domain.models.ProjectOwner;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.ProjectOwnerServiceLocal;
import org.dubenets.projects.projectagent.service.remote.ProjectOwnerServiceRemote;

/**
 * Session Bean implementation class ProjectOwnerServiceImpl
 */
@Stateless(mappedName = "ProjectOwnerServiceImpl")
public class ProjectOwnerServiceImpl extends GenericServiceImpl<ProjectOwner> implements ProjectOwnerServiceRemote, ProjectOwnerServiceLocal {
       
    public ProjectOwnerServiceImpl() {
        super();
    }

    @EJB(beanInterface = ProjectOwnerDAOLocal.class)
    public void setGenericDAO(GenericDAO<ProjectOwner> genericDAO) {
    	this.genericDAO = genericDAO;
    }
}
