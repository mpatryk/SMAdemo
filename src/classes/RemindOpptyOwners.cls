/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
public class RemindOpptyOwners implements Schedulable{

	public Void execute(System.SchedulableContext context) {
		List<Opportunity> opportunities = [SELECT Id, Name, OwnerId, CloseDate
				FROM Opportunity
				WHERE IsClosed = False AND
				CloseDate < TODAY];
		// Create a task for each opportunity in the list
		//TaskUtils.remindOwners(opportunities);

	}
}