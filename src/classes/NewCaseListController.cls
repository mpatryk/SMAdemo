/**
 * Created by miler_8zu3w9c on 7/10/2017.
 */
public class NewCaseListController {

	public List<Case> getNewCases(){
		String condition = 'New';
//		List<Case> results = Database.query( 'SELECT id, CaseNumber FROM Case WHERE status = '+ condition  );
		List<Case> results = Database.query(
		'SELECT Id, CaseNumber ' +
		'FROM Case ' +
		'WHERE Status = \'New\'');

		return results;
	}

}