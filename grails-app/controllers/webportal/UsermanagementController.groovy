package webportal

class UsermanagementController {

    def index(){ }

    def groupassignment(){

    	def dao = new CrowdDAO()

    	def allPendingUsers = dao.getAllUsersInGroup("pending_approval")
    	def groupList = dao.getAllGroups("Schools")

    	return [userList:allPendingUsers, groupList:groupList]
    }


    def adduser(){

    	// if this is the form submit
    	if (request.method == 'POST') {

    		// save user to database
    		def pendUser = new PendingUser(params.email, params.district)
            pendUser.setToken()

            // add each permission to the pending user
            params.each{ key, value ->
                if(key ==~ /perm.*/ && value == 'on'){
                    pendUser.addToPermissions(new Permission(key.replace("perm_","")))
                }
            }

            pendUser.save(failOnError: true)

    	} 

        // get the information needed to repopulate the list.
	    def dao = new CrowdDAO()
	    def groupList = dao.getAllGroups("Schools")
	    def permList = dao.getAllGroups("Permissions")

	    return [groupList:groupList, permList:permList]
    	
    }
}
