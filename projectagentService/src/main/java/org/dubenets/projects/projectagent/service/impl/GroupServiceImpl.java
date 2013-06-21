package org.dubenets.projects.projectagent.service.impl;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.GroupDAOLocal;
import org.dubenets.projects.projectagent.domain.models.Group;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.GroupServiceLocal;
import org.dubenets.projects.projectagent.service.remote.GroupServiceRemote;

/**
 * Session Bean implementation class GroupServiceImpl
 */
@Stateless(mappedName = "GroupServiceImpl")
public class GroupServiceImpl extends GenericServiceImpl<Group> implements GroupServiceRemote, GroupServiceLocal {
       
    public GroupServiceImpl() {
        super();
    }

    @EJB(beanInterface = GroupDAOLocal.class)
    public void setGenericDAO(GenericDAO<Group> genericDAO) {
    	this.genericDAO = genericDAO;
    }
}
