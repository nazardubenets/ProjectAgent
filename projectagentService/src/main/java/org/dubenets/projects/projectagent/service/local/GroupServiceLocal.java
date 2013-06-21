package org.dubenets.projects.projectagent.service.local;

import javax.ejb.Local;

import org.dubenets.projects.projectagent.domain.models.Group;
import org.dubenets.projects.projectagent.service.generic.GenericService;

@Local
public interface GroupServiceLocal  extends GenericService<Group> {

}
