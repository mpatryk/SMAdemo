/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
@IsTest
private class AddPrimaryContactTest {

	@TestSetup
	static void setup(){
		List<Account> accounts = new List<Account>();

		for(Integer i=0; i<50;i++){
			accounts.add(new Account(Name ='Test Account '+i, BillingState = 'NY'));
			accounts.add(new Account(Name ='Test Account '+(i+50), BillingState = 'CA'));
		}
		insert accounts;
	}

	@IsTest
	static void test(){
		Contact contact = new Contact(FirstName ='testfn',LastName ='testln');
		String billingState = 'CA';
		AddPrimaryContact addPrimaryContact = new AddPrimaryContact(contact,billingState);

		Test.startTest();
		System.enqueueJob(addPrimaryContact);
		Test.stopTest();

		System.assertEquals(50, [SELECT count() FROM Contact WHERE accountID IN (SELECT id FROM Account WHERE BillingState = :billingState)]);
	}

}