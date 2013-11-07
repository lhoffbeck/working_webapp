package webportal

class Permission {

	static belongsTo = PendingUser
    static hasMany = [pendingUsers:PendingUser]

    String permName

    static constraints = {
    	permName blank: false
    }
}
