package org.dubenets.projects.projectagent.dao.impl;

import javax.ejb.Stateless;
import org.dubenets.projects.projectagent.dao.generic.impl.GenericDAOImpl;
import org.dubenets.projects.projectagent.dao.local.EmployeeDAOLocal;
import org.dubenets.projects.projectagent.dao.remote.EmployeeDAORemote;
import org.dubenets.projects.projectagent.domain.models.Employee;

/**
 * Session Bean implementation class EmployeeDAOImpl
 */
@Stateless(mappedName = "EmployeeDAOImpl")
public class EmployeeDAOImpl extends GenericDAOImpl<Employee> implements EmployeeDAORemote, EmployeeDAOLocal {

    public EmployeeDAOImpl() {
        super();
    }

}
