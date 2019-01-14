/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
@IsTest
private class UpdateParentAccountTest {
	@TestSetup
	static void setup(){
		List<Account> accounts = new List<Account>();
		accounts.add(new Account(Name = 'Parent'));
		for(Integer i=0; i<200;i++){
			accounts.add(new Account(Name ='Test Account '+i));
		}
		insert accounts;
	}

	@IsTest
	static void testQueueable(){
		Id parentId = [select id from account where name = 'Parent'][0].Id;
		List<Account> accounts = [select id, name from account where name like 'Test Account%'];
		UpdateParentAccount updater = new UpdateParentAccount(accounts, parentId);

		Test.startTest();
		System.enqueueJob(updater);
		Test.stopTest();

		System.assertEquals(200, [select count() from account where parentId = :parentId]);
	}
}