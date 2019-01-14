trigger ClosedOpportunityTrigger on Opportunity(after insert, after update) {
	List<Task> tasks = new List<Task>();

	for(Opportunity o : [SELECT Id,Name FROM Opportunity WHERE Id IN :Trigger.New AND StageName = 'Closed Won']) {
		if(Trigger.isInsert || Trigger.isUpdate)
				tasks.add(new Task(Subject = 'Follow Up Test Task', WhatId = o.Id));
	}

	if (tasks.size() > 0)
		insert tasks;
}