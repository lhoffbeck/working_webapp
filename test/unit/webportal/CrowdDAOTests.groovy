package webportal



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
        
@TestFor(CrowdDAO)
class CrowdDAOTests {

    def dao = new CrowdDAO()
    def userValues = [username: 'unittest@leveldatainc.com', firstName: 'unit', lastName:'test', email:'unittest@leveldatainc.com', password:'test123']
    def user = new User(userValues)

@Before
    void testCreateUser() {
       def success = dao.createUser(user)
        if (!success)
        {
        } 
    }

@After
    void testDeleteUser() {
        def success = dao.removeUser(user)
        if (!success)
        {
        }
        
    }

    void testUpdateUser() {
        user.firstName = 'test'
        user.lastName = 'unit'
        user.email = 'testunit@leveldatainc.com'

        def success = dao.updateUser(user)
        if (!success)
        {
            fail 'Unable to update user'
        }
    }
/*
    void testUpdatePassword() {
        user.password = '123test'

        def success = dao.updatePassword('123test', user.username)
        if (!success)
        {
            fail 'Unable to update user password'
        }
    }
*/
    void testAddUserAttribute() {

        def attributes = [testing:'123', 123:'testing']

        def success = dao.addUserAttribute(attributes, user.username)
        if (!success)
        {
            fail 'Unable to add user attribute'
        }
    }

    void testAddUserToGroup() {

        def success = dao.addUserToGroup(user.username, 'Notifications')
        if (!success)
        {
            fail 'Unable to add user to group'
        }
    }


    void testGetAllUsersInGroup() {
        dao.addUserToGroup(user.username, 'Notifications')
        def success = dao.getAllUsersInGroup('Notifications')
        if (success.size() < 1)
        {
            fail 'Unable to get all users in a group'
        }
    }

    void testgetAllUsersInNestedGroup() {
        dao.addUserToGroup(user.username, 'Notifications')
        def success = dao.getAllUsersInNestedGroup('Notifications')
        if (success.size() < 1)
        {
            fail 'Unable to get all users in a nested group'
        }
    }

    void testGetUserGroupInfo() {
        dao.addUserToGroup(user.username, 'Notifications')
        def success = dao.getUserGroupInfo(user)
        if (success ==~ /Notifications/)
        {
            fail 'Unable to get user group info'
     
        }
    }
/*
    void testGetUserAttributes() {

        def success = dao.getUserAttributes(user.username)
        if (!success)
        {
            fail 'Unable to get user attributes'
     
        }
    }
*/
     void testRemoveUserFromGroup() {
        dao.addUserToGroup(user.username, 'Notifications')
        def success = dao.removeUserFromGroup(user.username, 'Notifications')
        if (!success)
        {
            fail 'Unable to remove user from group'
        }
    }
}
