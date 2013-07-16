package org.dubenets.projects.projectagent.web.auth;

import javax.ejb.EJB;

import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.service.local.AccountServiceLocal;
import org.dubenets.projects.projectagent.web.utility.AccountConverter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

	@EJB(mappedName = "java:app/projectagentService/AccountServiceImpl!org.dubenets.projects.projectagent.service.local.AccountServiceLocal")
	private AccountServiceLocal accountServiceLocal;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountServiceLocal.findByUsername(username);
		if (account == null) {
			throw new UsernameNotFoundException("User not found");
		}
		return AccountConverter.convertToUserDetails(account);
	}
}
