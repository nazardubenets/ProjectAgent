package org.dubenets.projects.projectagent.web.utility;

import java.io.IOException;

import javax.faces.context.FacesContext;

public class JSFUtility {
	public static void sendError(int code, String message) {
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.responseSendError(403, message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static Object getSessionParameter(String key) {
		return FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(key);
	}
	
	public static String getRequestParameter(String key) {
		return FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get(key);
	}
}
