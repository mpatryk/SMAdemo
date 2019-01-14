trigger CreateLog on Environment__c (before insert, after insert,
									 before update, after update,
									 before delete, after delete) {

	if (Trigger.isBefore) {
		if (Trigger.isInsert) {
			// Call class logic here!
		}
		if (Trigger.isUpdate) {
			// Call class logic here!
		}
		if (Trigger.isDelete) {
			for(Environment__c env : Trigger.old){
				if(env.EMUser__c != null){
					env.addError('You cannot delete that environment',false);
				}
			}
		}
	}

	if (Trigger.IsAfter) {
		if (Trigger.isInsert) {
			for(Environment__c env : Trigger.new){
				EnvironmentManagementController.createLog(env,'INSERT');
			}
		}
		if (Trigger.isUpdate) {
			for(Environment__c env : Trigger.new){
				EnvironmentManagementController.createLog(env,'UPDATE');
			}
		}
		if (Trigger.isDelete) {
			// Call class logic here!
		}
	}
}