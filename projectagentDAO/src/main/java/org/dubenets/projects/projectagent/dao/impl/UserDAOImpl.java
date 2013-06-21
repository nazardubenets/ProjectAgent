package org.dubenets.projects.projectagent.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.dubenets.projects.projectagent.dao.generic.impl.GenericDAOImpl;
import org.dubenets.projects.projectagent.dao.local.UserDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.UserDAORemote;
import org.dubenets.projects.projectagent.domain.enums.UserRole;
import org.dubenets.projects.projectagent.domain.models.User;

/**
 * Session Bean implementation class UserDAOImpl
 */
@Stateless(mappedName = "UserDAOImpl")
public class UserDAOImpl extends GenericDAOImpl<User> implements UserDAORemote, UserDAOLocal {

    public UserDAOImpl() {
    	super();
    }

	@Override
	public List<User> getUsersWithRoles(UserRole ... userRoles) {
		List<User> users = new ArrayList<User>();
		if (userRoles.length > 0) {
			CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
			CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(this.getEntityType());
			Root<User> root = criteriaQuery.from(this.getEntityType());
			criteriaQuery.select(root);
			Predicate predicate = root.get("userRole").in(Arrays.asList(userRoles));
			criteriaQuery.where(predicate);
			users = entityManager.createQuery(criteriaQuery).getResultList();
		}
		return users;
	}
    
}
