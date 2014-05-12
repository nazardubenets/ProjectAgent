package org.dubenets.projects.projectagent.web.managedbeans.helper;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

@ManagedBean
@SessionScoped
public class LanguageBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1410430910073306320L;

	private String selectedLanguage;
	private Map<String, Object> languages;

	@PostConstruct
	public void initializeBean() {
		selectedLanguage = FacesContext.getCurrentInstance().getViewRoot().getLocale().toString();
		languages = new HashMap<String, Object>();
		languages.put("English", Locale.ENGLISH);
		languages.put("Українська", new Locale("uk"));
	}

	public Map<String, Object> getLanguages() {
		return languages;
	}
	
	public String getSelectedLanguage() {
		return selectedLanguage;
	}
	
	public void setSelectedLanguage(String selectedLanguage) {
		this.selectedLanguage = selectedLanguage;
	}

	public void changeLanguage(ValueChangeEvent e) {
		String newLanguageValue = e.getNewValue().toString();
		for (Map.Entry<String, Object> entry : languages.entrySet()) {
			if (entry.getValue().toString().equals(newLanguageValue)) {
				FacesContext.getCurrentInstance().getViewRoot()
						.setLocale((Locale) entry.getValue());
			}
		}
	}
}
