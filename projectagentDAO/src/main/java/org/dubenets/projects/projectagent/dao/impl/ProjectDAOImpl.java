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
import org.dubenets.projects.projectagent.dao.local.ProjectDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.ProjectDAORemote;
import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;
import org.dubenets.projects.projectagent.domain.models.Project;

/**
 * Session Bean implementation class ProjectDAOImpl
 */
@Stateless(mappedName = "ProjectDAOImpl")
public class ProjectDAOImpl extends GenericDAOImpl<Project> implements ProjectDAORemote, ProjectDAOLocal {

    public ProjectDAOImpl() {
        super();
    }
    
    @Override
	public List<Project> getByStages(ReadinessStage ... stages) {
		List<Project> projects = new ArrayList<Project>();
		if (stages.length > 0) {
			CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
			CriteriaQuery<Project> criteriaQuery = criteriaBuilder.createQuery(this.getEntityType());
			Root<Project> root = criteriaQuery.from(this.getEntityType());
			criteriaQuery.select(root);
			Predicate predicate = root.get("readinessStage").in(Arrays.asList(stages));
			criteriaQuery.where(predicate);
			projects = entityManager.createQuery(criteriaQuery).getResultList();
		}
		return projects;
	}

}
