package org.dubenets.projects.projectagent.service.generic.impl;

import java.util.List;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.service.generic.GenericService;

public abstract class GenericServiceImpl<T> implements GenericService<T> {
	
	protected GenericDAO<T> genericDAO;

	public GenericServiceImpl() {
		
	}

	@Override
	public T findById(Long id) {
		return genericDAO.findById(id);
	}

	@Override
	public void remove(T item) {
		genericDAO.remove(item);
	}

	@Override
	public boolean save(T item) {
		return genericDAO.save(item);
	}

	@Override
	public T update(T item) {
		return genericDAO.update(item);
	}

	@Override
	public List<T> getAll() {
		return genericDAO.getAll();
	}

}
