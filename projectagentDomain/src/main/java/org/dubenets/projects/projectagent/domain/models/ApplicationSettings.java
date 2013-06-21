package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.dubenets.projects.projectagent.domain.enums.ApplicationState;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "aplicationSettings")
public class ApplicationSettings implements Serializable{

	private static final long serialVersionUID = 1891022439994389375L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "applicationSettingsIdGenereator")
	@SequenceGenerator(name = "applicationSettingsIdGenereator", sequenceName = "applicationSettingsIdSequence", initialValue = 1, allocationSize = 1)
	private Long id;
	
	@Enumerated(EnumType.STRING)
	private ApplicationState applicationState = ApplicationState.ACTIVE;
	
	private Integer maxAdministratorAmount = 1;
	
}
