/**
 * Created by miler_8zu3w9c on 7/31/2017.
 */
public class ContactsController {
	@RemoteAction
	public static List<Contact> GetAllContactsByFilter(String searchText)
		{
			String searchString = '%' + searchText + '%';
			List<Contact> contactList = [SELECT FirstName, LastName, Phone, Email, Title, Account.Name FROM Contact where FirstName like :searchString];
			return contactList;
		}
}