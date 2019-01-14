/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
public class AddPrimaryContact implements Queueable{
	List<Account> accounts;
	Contact contact;
	String stateAbbreviation;

	public AddPrimaryContact(Contact contact, String stateAbbreviation){
		this.contact = contact;
		this.stateAbbreviation = stateAbbreviation;
	}

	public Void execute(System.QueueableContext context) {
		List<Account> accounts = [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE BillingState =: stateAbbreviation LIMIT 200];
		List<Contact> contacts = new List<Contact>();
		for(Account account : accounts){
			Contact contact = this.contact.clone();
			contact.AccountId = account.Id;
			contacts.add(contact);
		}
		insert contacts;
	}
}