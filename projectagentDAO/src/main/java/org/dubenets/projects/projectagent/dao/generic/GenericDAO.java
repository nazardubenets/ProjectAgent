package org.dubenets.projects.projectagent.dao.generic;

import java.util.List;

public interface GenericDAO<T> {
	
	public T findById(Long id);
	
	public void remove(T item);
	
	public boolean save(T item);
	
	public T update(T item);
	
	public List<T> getAll();

}
