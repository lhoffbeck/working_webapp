package webportal

class User {

    static mapWith = "none"

    // time stamps: automatically populated by GORM
    Date dateCreated
    Date lastUpdated
 
    // properties
    String firstName
    String lastName
    String username			
    String password        // plain text, not stored
    String confirm         // plain text, not stored
    String passwordHashed
    String email 
    String displayName
    String token
    String district
    List confirmedDistricts = []
    List permisions = []
    Map attributes = [:]
    Map groups = [:]

    def setToken(token){
        this.token = token
    }
 
    // transients
    //static transients = ['password', 'confirm']
 
    // constraints that get checked when the object is getting pushed to the database (doesn't happen here... need a way to check without pushing.)
    static constraints = {
        firstName blank:false
        lastName  blank:false
        username  blank:false, size:5..22, matches:/[\S]+/, unique:true
        password  blank:false, size:5..15, matches:/[\S]+/, validator:{ val, obj ->
        if (obj.password != obj.confirm)
            return 'user.password.dontmatch'
        }
    }
}