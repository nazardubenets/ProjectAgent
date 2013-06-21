package org.dubenets.projects.projectagent.service.generic;

import java.util.List;

public interface GenericService<T> {

	public T findById(Long id);

	public void remove(T item);

	public boolean save(T item);

	public T update(T item);

	public List<T> getAll();
}
