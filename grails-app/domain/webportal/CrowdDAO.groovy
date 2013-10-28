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

		/*def requester = new HTTPBuilder('http://crowd.timothywebster.net:8095/crowd/rest/usermanagement/latest/search?entity-type=user')
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
            }*/

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


    static constraints = {
    }
}
