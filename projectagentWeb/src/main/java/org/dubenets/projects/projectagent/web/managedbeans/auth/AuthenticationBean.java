package org.dubenets.projects.projectagent.web.managedbeans.auth;

import java.io.IOException;
import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.dubenets.projects.projectagent.web.utility.SpringSecurityUtility;
import org.dubenets.projects.projectagent.web.utility.helpermodels.UserDetailsAccount;

@ManagedBean
@SessionScoped
public class AuthenticationBean implements Serializable{
	/**
	 * 
	 */
	public static final long serialVersionUID = 7514218637918860250L;

	public String login() throws IOException, ServletException {
		forwardExecutionToSpringSecurityURL("/j_spring_security_check");
		return null;
	}

	public String logout() throws IOException, ServletException {
		forwardExecutionToSpringSecurityURL("/j_spring_security_logout");
		return null;
	}
	
	public UserDetailsAccount getPrincipal() {
		return SpringSecurityUtility.getPrincipal();
	}

	private void forwardExecutionToSpringSecurityURL(String url) throws ServletException, IOException {
		ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
		RequestDispatcher dispatcher = ((ServletRequest) context.getRequest()).getRequestDispatcher(url);
		dispatcher.forward((ServletRequest) context.getRequest(), (ServletResponse) context.getResponse());
		FacesContext.getCurrentInstance().responseComplete();
	}
}