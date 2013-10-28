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

            dao.sendPasswordResetEmail("testuser23@gmail.com")

           // dao.createUser(u.userXML)

        	/*try{
        		sendMail {     
				  to "ldwebportal@gmail.com"    
				  subject "Account creation request from ${u.firstName} ${u.lastName}"     
				  body "${u.firstName} ${u.lastName} requested a web portal account. Please follow the following link to confirm: "
				}
				println "email sent"
			}catch(Exception ex){ throw ex }*/

            /*withHttp(uri: "http://crowd.timothywebster.net:8095/rest/usermanagement/latest/user") {

               def client = getClient()
               client.setHttpRequestRetryHandler( new DefaultHttpRequestRetryHandler(1, true) )
               def httpParams = client.getParams()
               httpParams.setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, TIMEOUT)
               httpParams.setParameter(CoreConnectionPNames.SO_TIMEOUT, TIMEOUT)
               
               handler.failure = { resp ->
                return new Response(resp)
               }

               body = u.userXML
               
               request( GET, XML ) {  req ->   
                
                response.success = { resp ->
                 def payload = resp?.entity?.content?.text
                 rr = new Response(resp)
                }
               }
              }

            /*def response = withHttp(uri: "http://crowd.timothywebster.net:8095/rest/usermanagement/latest/user") {
                     // auth.basic 'user', 'pass'

                          //  have tried body: XmlUtil.serialize(orderText)
                      def r = post(path: '/invoke/document', body: orderText, contentType: XML, requestContentType: XML)
                        { resp, xml ->
                          log.info resp.status
                          log.info resp.data
                          resp.headers.each {
                            log.info "${it.name} : ${it.value}"
                          }
                        }
                     log.info r
                     return r   
                }*/

                /*HTTPBuilder builder = new HTTPBuilder( "http://crowd.timothywebster.net:8095/rest" )

                // need to post as TEXT instead of XML, since HTTPBuilder automagically puts the response in an XML slurper and returns only the SUCCESS/FAIL message from the response.
                builder.request(POST,TEXT){
                    uri.path = "/usermanagement/1/user"
                    body = u.userXML
                             
                    response.success = { resp, xmlText -> 
                        
                        println "successful request"
                    }
                    response.failure = { throw new Exception("ERROR: Unable to log in to S2NetBox - http request failed") }
                }*/

               /* System.err.println "before trying to post"

            HTTPBuilder builder = new HTTPBuilder( "http://crowd.timothywebster.net:8095/rest" )
            builder.request( Method.POST ) { 
                   // set uriPath, e.g. /rest/resource
                   uri.path = "/usermanagement/latest/user"

                   requestContentType = ContentType.XML
                   System.err.println "made it"


                   // set the xml body, e.g. <xml>...</xml>
                   body = u.userXML


                   // handle response
                   response.success = { HttpResponseDecorator resp, xml ->
                       String xmlResult = xml
                       System.err.println("success!!!!!!! added user ${u.firstName}")
                   }
            }*/


        	/*


            // create domain object and assign parameters using data binding
            def u = new User(params)
            u.passwordHashed = u.password.encodeAsPassword()
            if (! u.save()) {
                // validation failed, render registration page again
                return [user:u]
            } else {
                // validate/save ok, store user in session, redirect to homepage
                session.user = u
                redirect(controller:'main')
            }

            */

        } else if (session.user) {
            // don't allow registration while user is logged in
            redirect(controller:'main')
        } 
    }
 
    def login = {
        if (request.method == 'POST') {
            def passwordHashed = params.password.encodeAsPassword()
            def u = User.findByUsernameAndPasswordHashed(params.username, passwordHashed)
            if (u) {
                // username and password match -> log in
                session.user = u
                redirect(controller:'main')
            } else {
                flash.message = "User not found"
                redirect(controller:'main')
            }
        } else if (session.user) {
            // don't allow login while user is logged in
            redirect(controller:'main')
        }
    }
 
    def logout = {
        session.invalidate()
        redirect(controller:'logout')
    }
}