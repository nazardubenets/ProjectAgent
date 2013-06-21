package org.dubenets.projects.projectagent.dao.impl;

import javax.ejb.Stateless;
import org.dubenets.projects.projectagent.dao.generic.impl.GenericDAOImpl;
import org.dubenets.projects.projectagent.dao.local.ProjectOwnerDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.ProjectOwnerDAORemote;
import org.dubenets.projects.projectagent.domain.models.ProjectOwner;

/**
 * Session Bean implementation class ProjectOwnerDAOImpl
 */
@Stateless(mappedName = "ProjectOwnerDAOImpl")
public class ProjectOwnerDAOImpl extends GenericDAOImpl<ProjectOwner> implements ProjectOwnerDAORemote, ProjectOwnerDAOLocal {

    public ProjectOwnerDAOImpl() {
        super();
    }
}
