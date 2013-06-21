package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "ApplicationUser")
@DiscriminatorValue("ProjectOwner")
public class ProjectOwner extends User implements Serializable {

	private static final long serialVersionUID = 1024480758785642239L;

	@OneToMany(mappedBy = "projectOwner", fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}, orphanRemoval = true)
	private Set<Project> ownedProjects = new LinkedHashSet<Project>();
}
