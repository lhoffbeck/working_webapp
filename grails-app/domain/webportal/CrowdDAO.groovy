package webportal


import groovyx.net.http.*
import static groovyx.net.http.ContentType.XML
import static groovyx.net.http.Method.POST
import static groovyx.net.http.Method.GET
import groovy.xml.*
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler

class CrowdDAO {

	private final def appUser = "webportal"
	private final def appPas = "4787Campus"
  private final def baseURL = "http://crowd.timothywebster.net:8095/crowd/rest/usermanagement/latest"


	def createUser(User u){

    String xml = """
      <user name='${u.username}' expand='attributes'>
        <first-name>${u.firstName}</first-name>
        <last-name>${u.lastName}</last-name>
        <display-name>${u.firstName} ${u.lastName}</display-name>
        <email>${u.email}</email>
        <active>true</active>
        <attributes>
          <link rel='self' href='/user/attribute?username=${u.username}'/>
        </attributes>
        <password>
          <link rel='edit' href='/user/password?username=${u.username}'/>
          <value>${u.password}</value>
        </password>
      </user>"""

    HTTPBuilder builder = new HTTPBuilder( "${baseURL}/user" )

		builder.auth.basic appUser,appPas

    builder.request(POST, XML){
          
      body = xml
                   
 			response.success = { resp -> 

          assert resp.status == 201
          
          println "request succeeded"

          return true
      }
           
      response.failure = { resp ->
	        println 'request failed: ' + resp.status
	        assert resp.status >= 400

          return false
      }
    }
	}

  def addToDefaultGroup(username){

    String xml = "<?xml version='1.0' encoding='UTF-8'?><user name='${username}'/>"

    HTTPBuilder builder = new HTTPBuilder( "${baseURL}/group/user/direct?groupname=pending_approval" )

    builder.auth.basic appUser,appPas

    builder.request(POST, XML){
          
      body = xml
                   
      response.success = { resp, xmlText -> 

          assert resp.status == 201
          
          println "request succeeded"

          return true
      }
           
      response.failure = { resp ->
          println 'request failed: ' + resp.status
          assert resp.status >= 400

          return false
      }
    }

  }

  def getAllUsers(){

    def requester = new HTTPBuilder("${baseURL}/search?entity-type=user")
    builder.auth.basic appUser,appPas

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

    def requester = new HTTPBuilder("${baseURL}/user?username=${username}")
    builder.auth.basic appUser,appPas

    requester.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            println resp.dump()
            assert resp.status < 400
            
            println "request succeeded"
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400

        return null
      }
    }

  }


    /*
    *   Gets user attributes for a single user.
    */

  def getUserAttributes(username){

    def requester = new HTTPBuilder("${baseURL}/user/attribute?username=${username}")
    builder.auth.basic appUser,appPas

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

    def requester = new HTTPBuilder("${baseURL}/user/mail/password?username=${username}")
    builder.auth.basic appUser,appPas

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
