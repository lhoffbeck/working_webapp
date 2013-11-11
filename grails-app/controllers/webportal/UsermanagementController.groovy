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
    		new PendingUser(params).save(failOnError: true)

    		//println params.dump()

    	} 

	    def dao = new CrowdDAO()
	    def groupList = dao.getAllGroups("Schools")
	    def permList = dao.getAllGroups("Permissions")

	    return [groupList:groupList, permList:permList]
    	
    }

    def edituser(){

        if (request.method == 'POST') {

            // save user to database
            new PendingUser(params).save(failOnError: true)

            //println params.dump()

        } 

        def dao = new CrowdDAO()
        def groupList = dao.getAllGroups("Schools")
        def permList = dao.getAllGroups("Permissions")
        
        def userList = dao.getAllUsersInNestedGroup("Schools")
        print userList.get("ppsUser1").firstName

        return[userList:userList,groupList:groupList, permList:permList]
    }
}
