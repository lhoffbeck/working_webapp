package webportal


import groovyx.net.http.*
import static groovyx.net.http.ContentType.TEXT
import static groovyx.net.http.Method.POST
import static groovyx.net.http.Method.GET
import groovy.xml.*
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler
import java.text.SimpleDateFormat 

class UserController {
 
    def register = {

        // if form submit on registration page and the honeypot wasn't filled out by spambots
        if (request.method == 'POST' && !params.userphone) {

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

                    // the response message
                    def pageTitle = "Success!"
                    def titleMessage = "Your account was successfully created!"
                    def message = """You can now <a href='/webportal/login/index'>log in</a> to your Level Data Web Portal account."""
                    forward(action: "message", params:[titleMessage:titleMessage, message:message, title:pageTitle])

                }else{ // if the user's token doesn't match, stick him in the default group.

                    // create the user in crowd
                    assert dao.createUser(user) == true

                    // add the user to the pending users group, a level data admin will have to give them their group assignment.
                    assert dao.addUserToGroup(user.username, 'pending_approval') == true

                    try{
                        sendMail {
                          to "lhoffbeck@leveldatainc.com"    
                          subject "You have pending user accounts to confirm"     
                          body "Account creation request from ${u.firstName} ${u.lastName}. Please log in to the web portal to confirm group membership."
                        }
                        println "email sent"
                    }catch(Exception ex){ throw ex }

                    // the response message
                    def pageTitle = "Request Sent"
                    def titleMessage = "Thanks for requesting an account!"
                    def message = """Since you didn't use a token to create your account, a Level Data administrator 
                                    will have to confirm it. An email will be sent to you when your account is ready to be used."""
                    forward(action: "message", params:[titleMessage:titleMessage, message:message, title:pageTitle])
                }
            }// end  "if user with username already exists in crowd"
            else{

                // the response message
                def pageTitle = "Account Already Exists"
                def titleMessage = "An account with this email address already exists in our system."
                def message = """Having troubles logging in? <a href='/webportal/user/forgotpassword'>Forgot your password?</a> or contact support@leveldatainc.com."""
                forward(action: "message", params:[titleMessage:titleMessage, message:message, title:pageTitle])
            }
        } // end if this method was requested via POST
    } // end method register

    def success = {}

    def pendingsuccess = {}

    // failure occurs when a user is already in crowd and they try to create an account
    def failure = {}

    private def sendPasswordResetEmail(email, token){

        def content = """You can reset your password by clicking the following link:
                    http://localhost:8080/webportal/user/resetpassword?token=${token}&email=${email}"""
        try{
            sendMail {     
                multipart true
                to email   
                subject "Password Reset: Level Data Web Portal"     
                body content
            }
            println "reset email sent to ${email}"
        }catch(Exception ex){ throw ex }

    }

    // the token in the password reset email will be valid during the day that the email was sent.
    private def String getPasswordResetToken(email){
        def date = new Date()  
        def sdf = new SimpleDateFormat("MM/dd/yyyy")  
        def currDate = sdf.format(date)  

        def saltyEmail = email + currDate
        return saltyEmail.hashCode()
    }

    def forgotpassword = {

        if(request.method == 'POST' && !params.userphone){
            def dao = new CrowdDAO()

            // if the user already exists in Crowd, send the password reset email.
            if(dao.getUser(params.email)){

                def email = params.email.trim()
                sendPasswordResetEmail(email, getPasswordResetToken(email))

                // set up the response message
                def pageTitle = "Email Sent!"
                def titleMessage = "Password reset email sent"
                def message = """You should recieve an email from us in a couple of minutes. Follow the link in the email to reset your password."""
                forward(action: "message", params:[titleMessage:titleMessage, message:message, title:pageTitle])
            }
            else{

                // set up the response message
                def pageTitle = "Email not Found"
                def titleMessage = "Oh no!"
                def message = """It looks like we don't have your email address in our system. Please make sure that you 
                                entered the correct email address, or contact support@leveldatainc.com"""
                forward(action: "message", params:[titleMessage:titleMessage, message:message, title:pageTitle])
            }

        }
    }

    def resetpassword = {

        if(request.method == 'POST' && !params.userphone){

            def dao = new CrowdDAO()
            def email = params.email

            // if the user already exists in Crowd and their token matches, reset their password
            if(dao.getUser(email) != null && params.token.equals(getPasswordResetToken(email))){

                dao.updatePassword(params.password, email)

                // the response message
                def pageTitle = "Password Changed"
                def titleMessage = "Your password was successfully changed!"
                def message = """You can <a href='/webportal/login/index'>log in</a> to your Level Data Web Portal account with your new password."""
                forward(action: "message", params:[titleMessage:titleMessage, message:message, title:pageTitle])
            }
            else{

                // the response message
                def pageTitle = "Unsuccessful Request"
                def titleMessage = "Password not changed"
                def message = """There was an error resetting your password. Please contact support@leveldatainc.com"""
                forward(action: "message", params:[titleMessage:titleMessage, message:message, title:pageTitle])
            }
        }
    }

    def message = {}
}