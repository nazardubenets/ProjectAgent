package org.dubenets.projects.projectagent.service.impl;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.UserDAOLocal;
import org.dubenets.projects.projectagent.domain.enums.UserRole;
import org.dubenets.projects.projectagent.domain.models.User;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.UserServiceLocal;
import org.dubenets.projects.projectagent.service.remote.UserServiceRemote;

/**
 * Session Bean implementation class UserServiceImpl
 */
@Stateless(mappedName = "UserServiceImpl")
public class UserServiceImpl extends GenericServiceImpl<User> implements UserServiceRemote, UserServiceLocal {
       
    public UserServiceImpl() {
        super();
    }

    @EJB(beanInterface = UserDAOLocal.class)
    public void setGenericDAO(GenericDAO<User> genericDAO) {
    	this.genericDAO = genericDAO;
    }

	@Override
	public List<User> getUsersWithRoles(UserRole... userRoles) {
		return ((UserServiceLocal) genericDAO).getUsersWithRoles(userRoles);
	}
}