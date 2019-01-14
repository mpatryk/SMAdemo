/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
public class LeadProcessor implements Database.Batchable<sObject>{

	public Database.QueryLocator start(Database.BatchableContext jobId) {
		return Database.getQueryLocator('SELECT Id,FirstName,LastName,Company,LeadSource FROM Lead');
	}

	public Void execute(Database.BatchableContext jobId, List<Lead> recordList) {
		for (Lead lead : recordList){
			lead.LeadSource = 'Dreamforce';
		}
		update recordList;
	}

	public Void finish(Database.BatchableContext jobId) {
	}

}