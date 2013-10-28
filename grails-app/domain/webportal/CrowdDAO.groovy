package webportal


import groovyx.net.http.*
import static groovyx.net.http.ContentType.TEXT
import static groovyx.net.http.Method.POST
import static groovyx.net.http.Method.GET
import groovy.xml.*
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler

class CrowdDAO {

	private def appUser = "webportal"
	private def appPas = "4787Campus"


	def createUser(String userXML){

		HTTPBuilder builder = new HTTPBuilder( "http://crowd.timothywebster.net:8095/rest/usermanagement/latest/user/" )

		builder.auth.basic "webportal","4787Campus"

    builder.request(POST, TEXT){
            
        body = userXML
                     
 				response.success = { resp, xmlText -> 
            
            println xmlText.dump()
            assert resp.status < 400
            
            println "request succeeded"
        }
             
        response.failure = { resp ->
	          println 'request failed: ' + resp.status
	          assert resp.status >= 400
        }
    }
	}

  def getAllUsers(){

    def requester = new HTTPBuilder('http://crowd.timothywebster.net:8095/crowd/rest/usermanagement/latest/search?entity-type=user')
    requester.auth.basic "webportal","4787Campus"

    requester.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            println resp.dump()
            assert resp.status < 400
            
            println "request succeeded"
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400
      }
    }

  }


    /*
     *  retrieves information for a single user.
     */
  def getUser(username){

    def requester = new HTTPBuilder("http://crowd.timothywebster.net:8095/crowd/rest/usermanagement/latest/user?username=${username}")
    requester.auth.basic "webportal","4787Campus"

    requester.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            println resp.dump()
            assert resp.status < 400
            
            println "request succeeded"
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400
      }
    }

  }


    /*
    *   Gets user attributes for a single user.
    */

  def getUserAttributes(username){

    def requester = new HTTPBuilder("http://crowd.timothywebster.net:8095/crowd/rest/usermanagement/latest/user/attribute?username=${username}")
    requester.auth.basic "webportal","4787Campus"

    requester.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            println resp.dump()
            assert resp.status < 400
            
            println "request succeeded"
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400
      }
    }

  }

    /*
    *   Sends a password reset email from crowd.
    */
   def sendPasswordResetEmail(username){

    def requester = new HTTPBuilder("http://crowd.timothywebster.net:8095/crowd/rest/usermanagement/latest/user/mail/password?username=${username}")
    requester.auth.basic "webportal","4787Campus"

    requester.request(POST) { req ->

      response.success = { resp, xmlText -> 
            
            println resp.dump()
            assert resp.status < 400
            
            println "request succeeded"
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400
      }
    }

  }

    static constraints = {
    }
}
