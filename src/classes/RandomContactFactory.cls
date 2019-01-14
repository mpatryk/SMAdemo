/**
 * Created by miler_8zu3w9c on 7/7/2017.
 */
public class RandomContactFactory {

	public static List<Contact> generateRandomContacts (Integer uniqueNumber, String lastName){
		List<Contact> contacts = new List<Contact>();

		for(Integer i=0;i<uniqueNumber;i++) {
			Contact contact = new Contact(FirstName = 'TestAccount' + i, LastName = lastName);
			contacts.add(contact);
		}


		return contacts;
	}

}