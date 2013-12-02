package webportal

import org.codehaus.grails.plugins.crowd.util.CrowdAuthUtils


class UsermanagementController {

    def index(){
        print CrowdAuthUtils.isAuthenticated(request)
    }

    def groupassignment(){

    	def dao = new CrowdDAO()

    	def allPendingUsers = dao.getAllUsersInGroup("pending_approval")
    	def districtList = dao.getAllGroups("Schools")

    	return [ userList:allPendingUsers, districtList:districtList ]
    }

    def adduser(){

        // get the information needed to populate the lists of district and permissions.
        def dao = new CrowdDAO()
        def districtList = dao.getAllGroups("Schools")
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
                flash.message = "User with email ${pendUser.email} was successfully created!"
            }else{
                flash.message = ""
                render(view: 'adduser', model:[pendUser: pendUser,districtList:districtList, permList:permList])
            }
    	} 


	    return [districtList:districtList, permList:permList]
    }


    private def sendTokenEmail(emailAddress, token)
    {

        def content = "Your Level Data web portal account is ready! Please follow the following link to complete the sign up process: " + 
                    "http://localhost:8080/webportal/user/register?token=${token}"
        try{
            sendMail {     
                multipart true
                to emailAddress   
                subject "Your Account Is Ready!"     
                body(view:"/mail/confirmation",model:[content: content])
            }
            println "email sent"
        }catch(Exception ex){ throw ex }
    }

    private def Map convertToMap(list){
        // convert user arraylist into a map so that it's easier to play with on the frontend
        def map = [:]
        list.each{
            map.put(it.key, it.value)
        }
        return map
    }

    private def Map getUserMap(params, dao){
        if(!params.district || params.submitButton == 'View All'){
            return convertToMap(dao.getAllUsersInNestedGroup("Schools"))
        }
        else{
            return convertToMap(dao.getAllUsersInNestedGroup(params.district))
        } 
    }

    def edituser(){

        def dao = new CrowdDAO()
        def districtList = dao.getAllGroups("Schools")  

        flash.message = ""


        if (request.method == 'POST') {

            def selectedDistrict

            // If the submit was caused by the dropdown change
            if(params.district && params.submitButton != 'View All' && !params.usertable_username)
            {
                return [districtList: districtList, userMap: getUserMap(params, dao), selectedDistrict: params.district]
            }
            else if(params.submitButton == 'View All')
            {
                return [districtList: districtList, userMap: getUserMap(params, dao), selectedDistrict: '']
            }
            else if(params.usertable_username){

                //throw new RuntimeException(userList.dump())

                def selectedUser = dao.getUser(params.usertable_username)

                // retrieve user group information, adds to user object.
                dao.getUserGroupInfo(selectedUser)

                // get the permissions of the user
                def permList = dao.getAllGroups("Permissions")
                def userPerms = selectedUser.permissions

                return [districtList: districtList, userMap: getUserMap(params, dao), selectedDistrict: params.district, selectedUser: selectedUser, permList: permList, userPerms: userPerms]
            } // end else if this is response to click on user
            else if(params.submitButton == 'Save')
            {

                //############################### update user information
                def user = new User()

                user.username = params.userName
                user.firstName = params.firstName
                user.lastName = params.lastName
                user.displayName = params.displayName
                user.email = params.email

                dao.updateUser(user)
                //#######################################################


                //########################################## update user district
                if(params.oldDistrict != params.newDistrict)
                {
                    dao.removeUserFromGroup(params.userName, params.oldDistrict)
                    dao.addUserToGroup(params.userName, params.newDistrict)
                }
                //###############################################################


                //####################################################### update user permissions
                def oldPerms = []

                // get the old permission values (they are hidden fields on the page) and remove any permissions that should be removed
                params.each{ key, value ->
                    if(key ==~ /^old_perm.*$/ && value == 'true'){

                        // permname might has underscores in the name if the permission has a space in the name (can't have a space in html id)
                        def permName = key.replace('old_perm','').replace('_',' ')

                        oldPerms.add(permName)
                        if(!params."perm${permName.replace(' ','_')}"){
                            dao.removeUserFromGroup(params.userName, permName) 
                        }
                    } 
                }
                params.each{ key, value ->
                    if(key ==~ /^perm.*$/){
                        def permName = key.replace('perm','').replace('_',' ')
                        
                        // if a new permission was added, add it.
                        if(value == 'on' && !oldPerms.contains(permName)){
                            "adding permission $permName"
                            dao.addUserToGroup(params.userName,key.replace("perm","").replace("_"," "))
                        }
                    }
                }
                //#################################################################################

                flash.message = "User ${user.displayName} was successfully updated"
                return [districtList: districtList, userMap: getUserMap(params, dao), selectedDistrict: params.district] 
            } // end else if this is a user save
        } // end if POST

        // if not a post request (i.e. initial pageload) just return the district list
        return [districtList: districtList]
    }
}
