package org.dubenets.projects.projectagent.dao.impl;

import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.impl.GenericDAOImpl;
import org.dubenets.projects.projectagent.dao.local.ProjectDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.ProjectDAORemote;
import org.dubenets.projects.projectagent.domain.models.Project;

/**
 * Session Bean implementation class ProjectDAOImpl
 */
@Stateless(mappedName = "ProjectDAOImpl")
public class ProjectDAOImpl extends GenericDAOImpl<Project> implements ProjectDAORemote, ProjectDAOLocal {

    public ProjectDAOImpl() {
        super();
    }

}
