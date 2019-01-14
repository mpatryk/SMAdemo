/**
 * Created by miler_8zu3w9c on 7/7/2017.
 */
@IsTest
private class TestRestrictContactByName {

	@IsTest static void checkContact(){
		Contact contact = new Contact(LastName='INVALIDNAME');
		//insert contact;

		Test.startTest();
		Database.UpsertResult result = Database.upsert(contact, false);
		Test.stopTest();

		System.assert(!result.isSuccess());
		System.assert(result.getErrors().size() > 0);
		System.assertEquals('Cannot insert/update',result.getErrors()[0].getMessage());
	}



}