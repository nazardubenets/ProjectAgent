package org.dubenets.projects.projectagent.web.utility;


import org.dubenets.projects.projectagent.domain.enums.Role;
import org.dubenets.projects.projectagent.domain.models.Account;
import org.dubenets.projects.projectagent.web.utility.helpermodels.UserDetailsAccount;
import org.springframework.security.core.userdetails.UserDetails;


public class AccountConverter {
	public static UserDetails convertToUserDetails(Account account) {
		UserDetailsAccount userDetails = null;
		if (account != null) {
			Long id = account.getId();
			String username = account.getUsername();
			String password = account.getPassword();
			Role role = account.getRole();
			Boolean blocked = account.getBlocked();
			userDetails = new UserDetailsAccount(id, username, password, role, blocked);
		}
		return userDetails;
	}
	
	public static Account convertToAccount(UserDetailsAccount userDetails) {
		Account account = null;
		if (userDetails != null) {
			Long id = userDetails.getId();
			String username = userDetails.getUsername();
			String password = userDetails.getPassword();
			Role role = userDetails.getRole();
			Boolean blocked = userDetails.getBlocked();
			account = new Account(id, username, password, role, blocked);
		}
		return account;
	}
}
