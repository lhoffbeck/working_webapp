package webportal

class UsermanagementController {

    def index() { }

    def groupassignment(){

    	def dao = new CrowdDAO()

    	def allPendingUsers = dao.getAllUsersInGroup("pending_approval")
    	def groupList = dao.getAllGroups("Schools")
    	print groupList

    	return [userList:allPendingUsers, groupList:groupList]
    }
}
