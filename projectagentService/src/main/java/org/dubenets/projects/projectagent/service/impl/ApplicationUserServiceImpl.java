package org.dubenets.projects.projectagent.service.impl;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.ApplicationUserDAOLocal;
import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.ApplicationUserServiceLocal;
import org.dubenets.projects.projectagent.service.remote.ApplicationUserServiceRemote;

/**
 * Session Bean implementation class UserServiceImpl
 */
@Stateless(mappedName = "ApplicationUserServiceImpl")
public class ApplicationUserServiceImpl extends GenericServiceImpl<ApplicationUser> implements ApplicationUserServiceRemote, ApplicationUserServiceLocal {
       
    public ApplicationUserServiceImpl() {
        super();
    }

    @EJB(beanInterface = ApplicationUserDAOLocal.class)
    public void setGenericDAO(GenericDAO<ApplicationUser> genericDAO) {
    	this.genericDAO = genericDAO;
    }

	@Override
	public List<ApplicationUser> getUsersWithRoles(Role... userRoles) {
		return ((ApplicationUserServiceLocal) genericDAO).getUsersWithRoles(userRoles);
	}
}
