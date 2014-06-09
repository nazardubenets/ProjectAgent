package org.dubenets.projects.projectagent.web.utility.helpermodels;

import java.util.Collections;
import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.dubenets.projects.projectagent.domain.enums.Role;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDetailsAccount implements UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = -237521420804302857L;
	
	private Long id;

	private String username;

	private String password;
	
	private String cv;
	
	private Role role;

	private Boolean blocked;

	@Override
	public Set<? extends GrantedAuthority> getAuthorities() {
		GrantedAuthority authority = new SimpleGrantedAuthority(role.toString());
		Set<GrantedAuthority> authorities = Collections.singleton(authority);
		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return !blocked;
	}

	@Override
	public boolean isAccountNonLocked() {
		return !blocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return !blocked;
	}

	@Override
	public boolean isEnabled() {
		return !blocked;
	}
}
