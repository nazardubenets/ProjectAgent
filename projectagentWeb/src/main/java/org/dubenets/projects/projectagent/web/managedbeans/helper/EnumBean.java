package org.dubenets.projects.projectagent.web.managedbeans.helper;

import java.io.Serializable;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;

@ManagedBean
@ApplicationScoped
public class EnumBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7642945546640237892L;

	public ReadinessStage[] getReadinessStages() {
		return ReadinessStage.values();
	}
}
