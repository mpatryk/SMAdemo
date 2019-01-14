/**
 * Created by miler_8zu3w9c on 7/18/2017.
 */
@IsTest
private class AccountManagerTest {

	@isTest static void testGetAccount() {
		Id recordId = createTestRecord();
		// Set up a test request
		RestRequest request = new RestRequest();
		request.requestUri =
				'https://praktyki-mp-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
				+ recordId+'/contacts';
		request.httpMethod = 'GET';
		RestContext.request = request;
		// Call the method to test
		Account thisAccount = AccountManager.getAccount();
		// Verify results
		System.assert(thisAccount != null);
		System.assertEquals('Test record', thisAccount.Name);
	}

	// Helper method
	static Id createTestRecord() {
		// Create test record
		Account accountTest = new Account(
				Name='Test record');
		insert accountTest;

		Contact contactTest = new Contact(AccountId = accountTest.Id,
											LastName = 'Test Name');
		
		return accountTest.Id;
	}

}