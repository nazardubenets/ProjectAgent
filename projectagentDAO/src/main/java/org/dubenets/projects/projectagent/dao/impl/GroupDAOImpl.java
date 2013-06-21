package org.dubenets.projects.projectagent.dao.impl;

import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.impl.GenericDAOImpl;
import org.dubenets.projects.projectagent.dao.local.GroupDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.GroupDAORemote;
import org.dubenets.projects.projectagent.domain.models.Group;

/**
 * Session Bean implementation class GroupDAOImpl
 */
@Stateless(mappedName = "GroupDAOImpl")
public class GroupDAOImpl extends GenericDAOImpl<Group> implements GroupDAORemote, GroupDAOLocal {

    public GroupDAOImpl() {
        super();
    }

}
