package org.dubenets.projects.projectagent.dao.remote;

import javax.ejb.Remote;

import org.dubenets.projects.projectagent.dao.generic.GenericDAO;
import org.dubenets.projects.projectagent.domain.models.Employee;

@Remote
public interface EmployeeDAORemote extends GenericDAO<Employee> {

}
