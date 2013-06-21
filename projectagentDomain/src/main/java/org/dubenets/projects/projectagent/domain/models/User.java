package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.dubenets.projects.projectagent.domain.enums.UserRole;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "ApplicationUser")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "userType", discriminatorType = DiscriminatorType.STRING, length = 20)
@DiscriminatorValue("ApplicationUser")
public class User implements Serializable {

	private static final long serialVersionUID = 1957091296474340672L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userIdGenereator")
	@SequenceGenerator(name = "userIdGenereator", sequenceName = "userIdSequence", initialValue = 1, allocationSize = 1)
	private Long id;

	@OneToOne(cascade = CascadeType.ALL, mappedBy = "accountOwner")
	private Account account;
	
	@Enumerated(EnumType.STRING)
	private UserRole userRole = UserRole.USER;
}
