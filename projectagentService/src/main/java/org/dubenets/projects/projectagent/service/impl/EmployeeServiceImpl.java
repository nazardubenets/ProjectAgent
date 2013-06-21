package org.dubenets.projects.projectagent.service.impl;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.dao.local.EmployeeDAOLocal;
import org.dubenets.projects.projectagent.domain.models.Employee;
import org.dubenets.projects.projectagent.service.generic.impl.GenericServiceImpl;
import org.dubenets.projects.projectagent.service.local.EmployeeServiceLocal;
import org.dubenets.projects.projectagent.service.remote.EmployeeServiceRemote;

/**
 * Session Bean implementation class EmployeeServiceImpl
 */
@Stateless(mappedName = "EmployeeServiceImpl")
public class EmployeeServiceImpl extends GenericServiceImpl<Employee> implements EmployeeServiceRemote, EmployeeServiceLocal {
       
    public EmployeeServiceImpl() {
        super();
    }

    @EJB(beanInterface = EmployeeDAOLocal.class)
    public void setGenericDAO(GenericDAO<Employee> genericDAO) {
    	this.genericDAO = genericDAO;
    }
}
