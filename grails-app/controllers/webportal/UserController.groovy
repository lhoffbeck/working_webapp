package webportal


import groovyx.net.http.*
import static groovyx.net.http.ContentType.TEXT
import static groovyx.net.http.Method.POST
import static groovyx.net.http.Method.GET
import groovy.xml.*
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler

class UserController {
 
    def register = {

        // if form submit on registration page and the honeypot wasn't filled out by spambots
        if (request.method == 'POST' && !params.body) {

            // data access object fro crowd
            def dao = new CrowdDAO()

            // Check if the username already exists in Crowd. If not, create the user.
            if(!dao.getUser(params.email)){

                // create user object and assign parameters using data binding
                def user = new User(params)
                user.username = user.email

                // make sure that the user token field gets populated regardless if it came in the URL or the form.
                if(params.containsKey('token')){user.token = params.token }

                // Check if the user with the specified token is located in the local GORM'd db so we can check against his token
                def query = PendingUser.where { email == user.email }
                PendingUser pendingUser = query.find()

                // if the user already exists in crowd and the token provided matches
                if(pendingUser && pendingUser.token == user.token){

                    // create the user in crowd
                    assert dao.createUser(user) == true

                    // Assign the user to the group assigned by the Level Data admin when creating the user.
                    assert dao.addUserToGroup(user.username, pendingUser.district) == true

                    // add the user to the appropriate permissions groups
                    for(perm in pendingUser.permissions){
                        System.err.println(perm.permName)
                        assert dao.addUserToGroup(user.username, perm.permName) == true
                    }

                    redirect(action:'success')

                }else{ // if the user's token doesn't match, stick him in the default group.

                    // create the user in crowd
                    assert dao.createUser(user) == true

                    // add the user to the pending users group, a level data admin will have to give them their group assignment.
                    assert dao.addUserToGroup(user.username, 'pending_approval') == true

                    /*try{
                        sendMail {
                          to "lhoffbeck@leveldatainc.com"    
                          subject "You have pending user accounts to confirm"     
                          body "Account creation request from ${u.firstName} ${u.lastName}. Please log in to the web portal to confirm group membership."
                        }
                        println "email sent"
                    }catch(Exception ex){ throw ex }*/

                    redirect(action:'pendingsuccess')

                    // return "You will recieve an email from us when your account is ready to be used."
                }
            }// end  "if user with username already exists in crowd"
            else{
                redirect(action:'failure')
            }
        } // end if this method was requested via POST
    } // end method register

    def success = {}

    def pendingsuccess = {}

    // failure occurs when a user is already in crowd and they try to create an account
    def failure = {}
}