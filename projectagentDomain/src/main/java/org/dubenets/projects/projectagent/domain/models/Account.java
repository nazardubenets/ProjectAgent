package org.dubenets.projects.projectagent.domain.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "account")
public class Account implements Serializable{
	
	private static final long serialVersionUID = -5725977912503098106L;

	@Id
	private Long id;
	
	@Column(unique = true, nullable = false)
	private String username;

	@Column(unique = true, nullable = false)
	private String password;

	private Boolean blocked = true;
	
	 @OneToOne
	 @PrimaryKeyJoinColumn
	 private User accountOwner;
}
