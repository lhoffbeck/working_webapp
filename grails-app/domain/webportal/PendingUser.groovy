package webportal

class PendingUser {

	static hasMany = [perms:Permission]

	String email
	String token 
	String district
	def salt = "3kDj6(6woi3@1w"

	def void setToken(){
		def saltyEmail = email + salt
		token = saltyEmail.hashCode()
	}


    static constraints = {
    	email email: true, blank: false // the email: true is a built in construct that validates that an email address is valid.
    	token blank: false
    	district blank: false
    }
}
