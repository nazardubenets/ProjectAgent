package org.dubenets.projects.projectagent.dao.generic.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;

public abstract class GenericDAOImpl<T> implements GenericDAO<T> {

	@PersistenceContext(unitName = "projectagentDAO")
	protected EntityManager entityManager;

	private Class<T> entityType;

	public GenericDAOImpl() {
		this.entityType = getEntityType();
	}

	@SuppressWarnings("unchecked")
	public Class<T> getEntityType() {
		Type t = getClass().getGenericSuperclass();
		ParameterizedType pt = (ParameterizedType) t;
		return (Class<T>) pt.getActualTypeArguments()[0];
	}

	@Override
	public T findById(Long id) {
		return entityManager.find(entityType, id);
	}

	@Override
	public void remove(T item) {
		entityManager.remove(item);
	}

	@Override
	public boolean save(T item) {
		boolean success = true;
		try {
			entityManager.persist(item);
		} catch (EntityExistsException ex) {
			success = false;
		}
		return success;
	}

	@Override
	public T update(T item) {
		return entityManager.merge(item);
	}

	@Override
	public List<T> getAll() {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<T> criteriaQuery = criteriaBuilder
				.createQuery(entityType);
		Root<T> root = criteriaQuery.from(entityType);
		criteriaQuery.select(root);
		List<T> result = entityManager.createQuery(criteriaQuery)
				.getResultList();
		if (result == null) {
			result = new ArrayList<T>();
		}
		return result;
	}

	@Override
	public void updateAll(Collection<T> items) {
		int transactionSize = 0;
		entityManager.getTransaction().begin();
		for (T item : items) {
			entityManager.merge(item);
			transactionSize++;
			if ((transactionSize % 10000) == 0) {
				entityManager.getTransaction().commit();
				entityManager.clear();
				entityManager.getTransaction().begin();
			}
		}
		entityManager.getTransaction().commit();
	}

}
