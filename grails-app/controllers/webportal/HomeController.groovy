package webportal
import org.codehaus.grails.plugins.crowd.util.CrowdAuthUtils


class HomeController {
    def index() { 
    	def authenticated = CrowdAuthUtils.isAuthenticated(request)
    	def groups = CrowdAuthUtils.getAuthenticatedPrincipalGroups(request)

    	if(authenticated == true)
    	{
    		if(groups.contains('Admins') == true)
    		{
    			redirect(controller:"Usermanagement")
    		}
    	}
    	else
    	{
    		redirect(controller:"login")
    	}
	}
}
