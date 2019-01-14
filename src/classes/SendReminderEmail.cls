/**
 * Created by miler_8zu3w9c on 7/13/2017.
 */
global class SendReminderEmail implements Database.Batchable<sObject>{

	global String query;
	global String subject;
	global String body;


	global SendReminderEmail(String query, String subject, String body) {
		this.query = query;
		this.subject = subject;
		this.body = body;
	}

	public System.Iterable<sObject> start(Database.BatchableContext jobId) {
		return Database.getQueryLocator(query);
	}

	public Void execute(Database.BatchableContext jobId, List<Speaker__c> scope) {
		for(Speaker__c speaker : scope){
			EmailManager.sendMail(speaker.Email__c, this.subject, this.body);
		}
	}

	public Void finish(Database.BatchableContext jobId) {
	}

}