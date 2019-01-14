/**
 * Created by miler_8zu3w9c on 7/7/2017.
 */
public class ContactSearch {
	public static List<Contact> searchForContacts(String lastName, String postalCode){
		List<Contact> contacts = new List<Contact>();
		Contact contact = [SELECT Id,Name  FROM Contact WHERE (LastName=:lastName AND MailingPostalCode=:postalCode)];
		contacts.add(contact);
		return contacts;
	}
}