package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
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
@DiscriminatorValue("Employee")
public class Employee extends User implements Serializable {

	private static final long serialVersionUID = -7751215401021455711L;
	
	@OneToMany(mappedBy = "leader", fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}, orphanRemoval = true)
	private Set<Group> leadedGroups = new LinkedHashSet<Group>();
	
	@ManyToMany(mappedBy = "members", fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH})
	private Set<Group> partisipatedGroups = new LinkedHashSet<Group>();
}