package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "ApplicationGroup")
public class Group implements Serializable {

	private static final long serialVersionUID = 7847387456697889383L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "groupIdGenereator")
	@SequenceGenerator(name = "groupIdGenereator", sequenceName = "groupIdSequence", initialValue = 1, allocationSize = 1)
	private Long id;

	@Column(unique = true, nullable = false)
	private String name;

	@ManyToOne
	@JoinColumn(name = "leader_id", referencedColumnName = "id")
	private Employee leader;

	@ManyToMany(cascade = { CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH })
	@JoinTable(joinColumns = { @JoinColumn(name = "groupId", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "employeeId", referencedColumnName = "id") })
	private Set<Employee> members = new LinkedHashSet<Employee>();
	
	@ManyToOne
	@JoinColumn(name = "orderedProject_id", referencedColumnName = "id", nullable = false)
	private Project orderedProject;
}
