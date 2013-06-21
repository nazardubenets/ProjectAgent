package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.dubenets.projects.projectagent.domain.enums.ReadinessStage;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "project")
public class Project implements Serializable {

	private static final long serialVersionUID = 9056710644922622079L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "projectIdGenereator")
	@SequenceGenerator(name = "projectIdGenereator", sequenceName = "projectIdSequence", initialValue = 1, allocationSize = 1)
	private Long id;

	@Column(unique = true, nullable = false)
	private String name;

	@Column(columnDefinition = "TEXT", nullable = false)
	private String description;

	@Temporal(TemporalType.TIMESTAMP)
	private Date creationTime;

	@Temporal(TemporalType.TIMESTAMP)
	private Date startTime;

	@Temporal(TemporalType.TIMESTAMP)
	private Date endTime;
	
	@Enumerated(EnumType.STRING)
	private ReadinessStage readinessStage = ReadinessStage.CREATED;

	@ManyToOne
	@JoinColumn(name = "projectOwner_id", referencedColumnName = "id")
	private ProjectOwner projectOwner;

	@OneToMany(mappedBy = "orderedProject", cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}, orphanRemoval = true)
	private Set<Group> hiredGroups = new LinkedHashSet<Group>();

	@OneToMany(mappedBy = "parentProject", cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH, CascadeType.REMOVE}, orphanRemoval = true)
	private Set<Project> childProjects = new LinkedHashSet<Project>();
	
	@ManyToOne
	@JoinColumn(name = "parentProject_id", referencedColumnName = "id", nullable = true)
	private Project parentProject;
}
