package org.dubenets.projects.projectagent.web.utility;

import org.dubenets.projects.projectagent.web.utility.helpermodels.UserDetailsAccount;
import org.springframework.security.core.context.SecurityContextHolder;

public class SpringSecurityUtility {
	public static UserDetailsAccount getPrincipal() {
		return (UserDetailsAccount) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
