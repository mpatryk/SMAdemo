/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
public class DailyLeadProcessor implements Schedulable{

	public Void execute(System.SchedulableContext context) {
		List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
		for(Lead lead : leads){
			lead.LeadSource = 'Dreamforce';
		}
		update leads;
	}
}