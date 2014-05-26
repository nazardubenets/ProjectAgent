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
import org.dubenets.projects.projectagent.dao.local.ApplicationUserDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.ApplicationUserDAORemote;
import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.ApplicationUser;

/**
 * Session Bean implementation class UserDAOImpl
 */
@Stateless(mappedName = "ApplicationUserDAOImpl")
public class ApplicationUserDAOImpl extends GenericDAOImpl<ApplicationUser> implements ApplicationUserDAORemote, ApplicationUserDAOLocal {

    public ApplicationUserDAOImpl() {
    	super();
    }

	@Override
	public List<ApplicationUser> getUsersWithRoles(Role ... userRoles) {
		List<ApplicationUser> users = new ArrayList<ApplicationUser>();
		if (userRoles.length > 0) {
			CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
			CriteriaQuery<ApplicationUser> criteriaQuery = criteriaBuilder.createQuery(this.getEntityType());
			Root<ApplicationUser> root = criteriaQuery.from(this.getEntityType());
			criteriaQuery.select(root);
			Predicate predicate = root.get("userRole").in(Arrays.asList(userRoles));
			criteriaQuery.where(predicate);
			users = entityManager.createQuery(criteriaQuery).getResultList();
		}
		return users;
	}
    
}
