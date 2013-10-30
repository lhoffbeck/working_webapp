package webportal


import groovyx.net.http.*
import static groovyx.net.http.ContentType.TEXT
import static groovyx.net.http.Method.POST
import static groovyx.net.http.Method.GET
import groovy.xml.*
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler

class UserController {
 
    def register = {

        // new user posts his registration details
        if (request.method == 'POST') {

        	// create domain object and assign parameters using data binding
            def u = new User(params)

            def dao = new CrowdDAO()

            // Check if the username already exists in Crowd. If not, create the user. If so, render back acceptable usernames for the user to pick from.
            if(!dao.getUser(u.username)){
                assert dao.createUser(u) == true
                assert dao.addToDefaultGroup(u.username) == true
               /*try{
                    sendMail {     
                      to "ldwebportal@gmail.com"    
                      subject "You have pending user accounts to confirm"     
                      body "Account creation request from ${u.firstName} ${u.lastName}. Please follow the following link to confirm the group membership: "
                    }
                    println "email sent"
                }catch(Exception ex){ throw ex }*/
                redirect(controller:'login')
            }else{

                //TODO: return usernames that the user can pick from
                throw new RuntimeException("username already exists")
            }



        	

        } /*else if (session.user) {
            // don't allow registration while user is logged in
            redirect(controller:'main')
        } */
    }
}