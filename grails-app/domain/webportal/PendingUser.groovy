package webportal

class PendingUser {

	static hasMany = [permissions: Permission]

	public PendingUser(){}

	public PendingUser(email, district){
		this.email = email
		this.district = district
	}

	String email
	String token 
	String district
	def salt = "3kDj6(6woi3@1w" // random as they come

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
