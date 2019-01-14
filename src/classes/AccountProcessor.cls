/**
 * Created by miler_8zu3w9c on 7/18/2017.
 */
public class AccountProcessor {

	@Future
	public static void countContacts(List<Id> recordIds){
		List<Account> accounts = [SELECT Id, Number_of_Contacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id =: recordIds];
		//System.debug(accounts);
		for (Account acc : accounts){
			List<Contact> contacts = acc.contacts;
			acc.Number_of_Contacts__c = contacts.size();
		}
		update accounts;
		//System.debug(accounts);


	}

}