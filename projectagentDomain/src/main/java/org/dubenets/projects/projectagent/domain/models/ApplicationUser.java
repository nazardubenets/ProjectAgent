package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(exclude={"partisipatedProjects", "ownedProjects"})
@Entity
@Table(name = "ApplicationUser")
public class ApplicationUser implements Serializable {

	private static final long serialVersionUID = 1957091296474340672L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userIdGenereator")
	@SequenceGenerator(name = "userIdGenereator", sequenceName = "userIdSequence", initialValue = 1, allocationSize = 1)
	private Long id;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Account account;
	
	@ManyToMany(mappedBy = "hiredEmployees", fetch = FetchType.EAGER)
	private Set<Project> partisipatedProjects = new LinkedHashSet<Project>();
	
//	@OneToMany(mappedBy = "leader", fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}, orphanRemoval = true)
//	private Set<Group> leadedGroups = new LinkedHashSet<Group>();
//	
//	@ManyToMany(mappedBy = "members", fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH})
//	private Set<Group> partisipatedGroups = new LinkedHashSet<Group>();
	
	@OneToMany(mappedBy = "projectOwner", fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}, orphanRemoval = true)
	private Set<Project> ownedProjects = new LinkedHashSet<Project>();
	
}
