package webportal

class Permission {
	
    static hasMany = [pendingusers: PendingUser]
	static belongsTo = PendingUser

	public Permission(){}

	public Permission(permName){
		this.permName = permName
	}

    String permName

    static constraints = {
    	permName blank: false
    }
}
