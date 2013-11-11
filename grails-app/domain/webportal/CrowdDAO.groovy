package webportal


import groovyx.net.http.*
import static groovyx.net.http.ContentType.XML
import static groovyx.net.http.Method.POST
import static groovyx.net.http.Method.GET
import groovy.xml.*
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler
import groovy.util.XmlSlurper

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

          addUserAttribute([district:u.district], u.username)

          return true
      }
           
      response.failure = { resp ->
	        println 'request failed: ' + resp.status
	        assert resp.status >= 400

          return false
      }
    }
	}

  def addUserAttribute(Map attributes, username){

    String xml = "<?xml version='1.0' encoding='UTF-8'?><attributes>"

    attributes.each{ attName, value -> xml += "<attribute name='${attName}'><values><value>${value}</value></values></attribute>" }
    xml += "</attributes>"

    println "+"*20 + xml


    HTTPBuilder builder = new HTTPBuilder( "${baseURL}/user/attribute?username=${username}" )

    builder.auth.basic appUser,appPas

    builder.request(POST, XML){
          
      body = xml
                   
      response.success = { resp, xmlText -> 

          assert resp.status == 204
          
          println "add attribute succeeded"

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

  def getAllUsersInGroup(groupname){

    def builder = new HTTPBuilder("${baseURL}/group/user/direct?groupname=${groupname}")
    builder.auth.basic appUser,appPas

    builder.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            assert resp.status < 400
            println "request succeeded"


            // Parse the response XML
            def records = new XmlSlurper().parseText(groovy.xml.XmlUtil.serialize(xmlText))
            def allRecords = records.user

            // Get all of the users as user objects
            def userMap = [:]

            int counter = 0

            allRecords.each{
              String userName = it.@name
              def user = getUser(userName)
              userMap.put(userName,user)
            }//-------------------------------------

            return userMap
            
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400
      }
    }

  }

  def getAllUsersInNestedGroup(groupname){

    def builder = new HTTPBuilder("${baseURL}/group/user/nested?groupname=${groupname}")
    builder.auth.basic appUser,appPas

    builder.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            assert resp.status < 400
            println "request succeeded"


            // Parse the response XML
            def records = new XmlSlurper().parseText(groovy.xml.XmlUtil.serialize(xmlText))
            def allRecords = records.user

            // Get all of the users as user objects
            def userMap = [:]

            int counter = 0

            allRecords.each{
              String userName = it.@name
              def user = getUser(userName)
              userMap.put(userName,user)
            }//-------------------------------------

            return userMap
            
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400
      }
    }

  }

  def getAllGroups(groupname){

    def builder = new HTTPBuilder("${baseURL}/group/child-group/direct?groupname=${groupname}")
    builder.auth.basic appUser,appPas

    builder.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            assert resp.status < 400
            
            println "request succeeded"

             // Parse the response XML
            def records = new XmlSlurper().parseText(groovy.xml.XmlUtil.serialize(xmlText))
            def allRecords = records.group

            // Get all of the users as user objects
            def groupMap = []

            int counter = 0

            allRecords.each{
              groupMap.add(it.@name)
            }

            return groupMap
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

    def builder = new HTTPBuilder("${baseURL}/user?username=${username}&expand=attributes")
    builder.auth.basic appUser,appPas

    builder.request(GET) { req ->

      response.success = { resp, xmlText -> 
            
            println "request succeeded"
            assert resp.status < 400

            def userRecord = new XmlSlurper().parseText(groovy.xml.XmlUtil.serialize(xmlText).replaceAll('..xml version="1.0" encoding="UTF-8"..',""))
            //println groovy.xml.XmlUtil.serialize(xmlText).replaceAll('..xml version="1.0" encoding="UTF-8"..',"")

            def user = new User()

            user.firstName = userRecord."first-name"
            user.lastName = userRecord."last-name"
            user.displayName = userRecord."display-name"
            user.username = userRecord.@name
            userRecord.attributes.attribute.each{ if( it.@name == "district") user.district = it.values }
            user.email = userRecord.email
            
            return user
        }
     
      response.failure = { resp ->
        println 'request failed: ' + resp.status
        assert resp.status >= 400

        return null
      }
    }

  }


  def getAllUsers(){

    def builder = new HTTPBuilder("${baseURL}/search?entity-type=user")
    builder.auth.basic appUser,appPas

    builder.request(GET) { req ->

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

    def builder = new HTTPBuilder("${baseURL}/user/attribute?username=${username}")
    builder.auth.basic appUser,appPas

    builder.request(GET) { req ->

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

    def builder = new HTTPBuilder("${baseURL}/user/mail/password?username=${username}")
    builder.auth.basic appUser,appPas

    builder.request(POST) { req ->

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
