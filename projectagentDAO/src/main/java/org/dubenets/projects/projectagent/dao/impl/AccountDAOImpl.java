package org.dubenets.projects.projectagent.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.dubenets.projects.projectagent.dao.generic.impl.GenericDAOImpl;
import org.dubenets.projects.projectagent.dao.local.AccountDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.AccountDAORemote;
import org.dubenets.projects.projectagent.domain.models.Account;

/**
 * Session Bean implementation class AccountDAOImpl
 */
@Stateless(mappedName = "AccountDAOImpl")
public class AccountDAOImpl extends GenericDAOImpl<Account> implements AccountDAORemote, AccountDAOLocal {

    public AccountDAOImpl() {
       super();
    }

	@Override
	public Account findByUsername(String username) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Account> criteriaQuery = criteriaBuilder.createQuery(this.getEntityType());
		Root<Account> root = criteriaQuery.from(this.getEntityType());
		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get("username"), username));
		return entityManager.createQuery(criteriaQuery).getSingleResult();
	}

	@Override
	public List<Account> getBlockedAccounts() {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Account> criteriaQuery = criteriaBuilder.createQuery(this.getEntityType());
		Root<Account> root = criteriaQuery.from(this.getEntityType());
		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get("blocked"), true));
		return entityManager.createQuery(criteriaQuery).getResultList();
	}
}
