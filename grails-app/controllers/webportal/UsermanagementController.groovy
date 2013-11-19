package webportal

class UsermanagementController {


    def index(){ }

    def groupassignment(){

    	def dao = new CrowdDAO()

    	def allPendingUsers = dao.getAllUsersInGroup("pending_approval")
    	def groupList = dao.getAllGroups("Schools")

    	return [ userList:allPendingUsers, groupList:groupList ]
    }


    def adduser(){

        // get the information needed to populate the lists of district and permissions.
        def dao = new CrowdDAO()
        def groupList = dao.getAllGroups("Schools")
        def permList = dao.getAllGroups("Permissions")


    	// if this is the form submit
    	if (request.method == 'POST') {

    		// save user to database
    		def pendUser = new PendingUser(params.email, params.district)
            pendUser.setToken()

            // add each permission to the pending user
            params.each{ key, value ->
                if(key ==~ /perm.*/ && value == 'on'){
                    pendUser.addToPermissions(new Permission(key.replace("perm","").replace("_"," ")))
                }
            }

            pendUser.save()


            // if saving the user to the database succeded
            if(!pendUser.hasErrors()){
                sendTokenEmail(pendUser.email, pendUser.token)
                flash.message = "User with email ${pendUser.email} was successfuly created!"
            }else{
                flash.message = ""
                render(view: 'adduser', model:[pendUser: pendUser,groupList:groupList, permList:permList])
            }
    	} 

	    return [groupList:groupList, permList:permList]
    }


    private def sendTokenEmail(emailAddress,  token)
    {

        def content = "Your Level Data web portal account is ready! Please follow the following link to complete the sign up process: " + 
                    "http://localhost:8080/webportal/user/register?token=${token}"
        try{
            sendMail {     
                multipart true
                to emailAddress   
                subject "Your Account Is Ready!"     
                body(view:"/mail/confirmation",model:[content:content])
            }
            println "email sent"
        }catch(Exception ex){ throw ex }
    }

    def edituser(){

        def dao = new CrowdDAO()
        def groupList = dao.getAllGroups("Schools")
        def permList = dao.getAllGroups("Permissions")
        def userList = []
        def selectedDistrict


        if (request.method == 'POST') {

            // If the submit was caused by the dropdown change
            if(!params.submitButton)
            {
                selectedDistrict = params.district
                userList = dao.getAllUsersInNestedGroup(URLEncoder.encode(params.district,'UTF-8'))
                userList.each{
                    dao.getUserGroupInfo(it.getValue())
                }
            }
            if(params.submitButton == 'View All')
            {
                selectedDistrict = ''
                userList = dao.getAllUsersInNestedGroup("Schools")
                userList.each{
                    dao.getUserGroupInfo(it.getValue())
                }
            }
            else if(params.submitButton == 'Save')
            {
                def user = new User()
                
                user.username = params.userName
                user.firstName = params.firstName
                user.lastName = params.lastName
                user.displayName = params.displayName
                user.email = params.email
                if(params.oldDistrict != params.district)
                {
                    dao.removeUserFromGroup(params.userName,params.oldDistrict)
                    dao.addUserToGroup(params.userName,params.district)
                }

                permList.each{
                    dao.removeUserFromGroup(params.userName,(String)it) //delete all, and than re add (no good way to keep track of a list i want to keep dynamic)
                }

                params.each{ key, value ->
                    if(key ==~ /perm.*/){
                        dao.addUserToGroup(params.userName,key.replace("perm","").replace("_"," "))
                    }
                }

                dao.updateUser(user)
                           
            }
        } 

        
        return[userList:userList,groupList:groupList, permList:permList,selectedDistrict:selectedDistrict]
    }
}
