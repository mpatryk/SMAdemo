/**
 * Created by miler_8zu3w9c on 7/18/2017.
 */
@IsTest
private class AccountProcessorTest {
	@IsTest static void TestAccountProcessorTest()	{
			Account account = new Account();
			account.Name = 'Test Account';
			Insert account;

			Contact contact = New Contact();
			contact.FirstName ='TestName';
			contact.LastName ='TestLastName';
			contact.AccountId = account.Id;
			Insert contact;

			List<Id> accountIds = new List<ID>();
			accountIds.add(account.id);

			Test.startTest();
			AccountProcessor.countContacts(accountIds);
			Test.stopTest();

			Account thisAccount = [select Number_of_Contacts__c from Account where id = :account.id LIMIT 1];
			System.assertEquals ( Integer.valueOf(thisAccount.Number_of_Contacts__c) ,1);
		}

}