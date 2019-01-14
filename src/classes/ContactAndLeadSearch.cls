/**
 * Created by miler_8zu3w9c on 7/7/2017.
 */
public class ContactAndLeadSearch {
	public static List<List< SObject>> searchContactsAndLeads(String firstOrLastName){

		List<List<SObject>> searchList = new List<List<sObject>>();
		searchList = [FIND :firstOrLastName IN ALL FIELDS RETURNING Lead,Contact];

		return searchList;
	}
}