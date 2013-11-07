package webportal

class UsermanagementController {

    def index() { }

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
    		/*def pendUser = new PendingUser(params)
            pendUser.setToken()



            pendUser.save(failOnError: true)

            System.err.println(PendingUser.count() + "!"*30)*/

    		println params.dump()

    	} 

	    def dao = new CrowdDAO()
	    def groupList = dao.getAllGroups("Schools")
	    def permList = dao.getAllGroups("Permissions")

	    return [groupList:groupList, permList:permList]
    	
    }
}
