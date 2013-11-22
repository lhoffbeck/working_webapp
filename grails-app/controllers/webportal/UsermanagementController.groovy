package webportal

class UsermanagementController {

    // memcached is a spring bean, this is it injected into this controller.
    def memcachedClient
    static final int expiry = 1800  // memcached stuff will be kept in memory for 1800s


    def index(){ }

    def groupassignment(){

    	def dao = new CrowdDAO()

    	def allPendingUsers = dao.getAllUsersInGroup("pending_approval")
    	def groupList = dao.getAllGroups("Schools")

    	return [ userList:allPendingUsers, groupList:groupList ]
    }


    /*
    *   Checks to see if an object is in memory. If so, it returns that object. If not, it performs the appropriate 
    *   Crowd REST call (I guess it could be any closure you pass in, really. Here it's just going to be Crowd though),
    *   caches the object in memory, and returns the object.
    *
    *   tl;dr this should be used to retrieve any object list that needs to be persisted between multiple view form submits.
    */
    private def checkMemcachedForObject(objectName, closure){

        def object

        // if the grouplist isn't already cached in memory, cache it in memory. If it is, update the local variable.
        def mem_obj = memcachedClient.get(objectName)
        if(!mem_obj){
            object = getClosure //
            memcachedClient.set(objectName, expiry, object)
        } else{
            object = mem_obj
        }

        return object
    }


    def adduser(){

        // get the information needed to populate the lists of district and permissions.
        def dao = new CrowdDAO()

        def groupList = checkMemcachedForObject('groupList',{return dao.getAllGroups("Schools")})
        throw new RuntimeException("Made it! list is: " + groupList.dump())
        def permList 




        // if the permission list isn't already cached in memory, cache it in memory. If it is, update the local variable.
        def mem_permList = memcachedClient.get('permList')
        if(!mem_permList){
            permList = dao.getAllGroups("Permissions")
            memcachedClient.set('permList', expiry, permList)
        } else{
            permList = mem_permList
        }


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

        // throw new RuntimeException(params.dump().toString())


        if (request.method == 'POST') {

            // If the submit was caused by the dropdown change
            if(!params.submitButton && ! params.usertable_username)
            {
                selectedDistrict = params.district
                userList = dao.getAllUsersInNestedGroup(URLEncoder.encode(params.district,'UTF-8'))
                /*userList.each{
                    dao.getUserGroupInfo(it.getValue())
                }*/
            }
            if(params.submitButton == 'View All')
            {
                selectedDistrict = ''
                userList = dao.getAllUsersInNestedGroup("Schools")
            }
            else if(params.submitButton == 'Save')
            {
                def user = new User()
                
                user.username = params.userName
                user.firstName = params.firstName
                user.lastName = params.lastName
                user.displayName = params.displayName
                user.email = params.email

                // change district logic
                if(params.oldDistrict != params.district)
                {
                    dao.removeUserFromGroup(params.userName, params.oldDistrict)
                    dao.addUserToGroup(params.userName, params.district)
                }

                // delete all, and than re add (no good way to keep track of a list i want to keep dynamic)
                permList.each{
                    dao.removeUserFromGroup(params.userName,(String)it) 
                }

                params.each{ key, value ->
                    if(key ==~ /perm.*/){
                        dao.addUserToGroup(params.userName,key.replace("perm","").replace("_"," "))
                    }
                }

                dao.updateUser(user)

            }else if(params.usertable_username){

                def selectedUser = dao.getUser(params.usertable_username)

                // retrieve user group information , adds to user object.
                dao.getUserGroupInfo(selectedUser) 

                return [userMap:userMap, selectedUser:selectedUser, groupList:groupList, permList:permList, selectedDistrict:selectedDistrict]
            }
        } 

        // convert user arraylist into a map so that it's easier to play with on the frontend
        def userMap = [:]
        userList.each{
            userMap.put(it.key, it.value)
        }

        return[userMap:userMap, groupList:groupList, permList:permList, selectedDistrict:selectedDistrict]
    }
}
