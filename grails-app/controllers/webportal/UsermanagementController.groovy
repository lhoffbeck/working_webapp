package webportal

class UsermanagementController {

    def index() { }

    def groupassignment(){

    	def dao = new CrowdDAO()

    	def allPendingUsers = dao.getAllUsersInGroup("pending_approval")
    	def groupList = dao.getAllGroups("Users")

    	return [userList:allPendingUsers, groupList:["school a","school b","school c","school d","school e"]]
    }
}
