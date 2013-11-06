package webportal

class PendingUser {

	String email
	String token 
	String district

	def perm1
	def perm2
	def perm3

	


    static constraints = {
    	email email: true, blank: false // the email: true is a built in construct that validates that an email address is valid.
    	token blank: false
    	district blank: false
    }
}
