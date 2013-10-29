package webportal

class User {
    // time stamps: automatically populated by GORM
    Date dateCreated
    Date lastUpdated
 
    // properties
    String firstName
    String lastName
    String username			// this little bastard isn't used, but not having it in blows everything to hell so it's staying in for now.
    String password        // plain text, not stored
    String confirm         // plain text, not stored
    String passwordHashed
    String district
    String email

    String createUserXML = """<?xml version='1.0' encoding='UTF-8'?>
                        <user name='${email}' expand='attributes'>
                          <first-name>${firstName}</first-name>
                          <last-name>${lastName}</last-name>
                          <display-name>${firstName} ${lastName}</display-name>
                          <email>${email}</email>
                          <active>true</active>
                          <attributes>
                            <link rel='self' href='/user/attribute?username=${email}'/>
                          </attributes>
                          <password>
                            <link rel='edit' href='/user/password?username=${email}'/>
                            <value>${password}</value>
                          </password>
                        </user>"""
 
 
    // transients
    static transients = ['password', 'confirm']
 
    // constraints
    static constraints = {
        firstName blank:false;
        lastName  blank:false;
        district  blank:false;
        username  blank:false, size:5..15, matches:/[\S]+/, unique:true
        password  blank:false, size:5..15, matches:/[\S]+/, validator:{ val, obj ->
            if (obj.password != obj.confirm)
                return 'user.password.dontmatch'
        }
    }
}