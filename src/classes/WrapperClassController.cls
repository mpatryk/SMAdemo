/**
 * Created by miler_8zu3w9c on 7/27/2017.
 */
public class WrapperClassController {

		public List<EnvWrapper> envList {get; set;}
		public String actualTableUserNick {get;set;}
		public String actualUserToAddId {get;set;}
		public String actualEnvId {get;set;}
		public Boolean wasUserChanged = true;

	public List<EnvWrapper> getEnvironments() {
		if(wasUserChanged || (envList == null || envList.isEmpty())) {
			envList = new List<EnvWrapper>();
			for(Environment__c e: [select Id, Name, Type__c, IsEnabled__c, EMUser__r.Id, EMUser__r.Nick__c from Environment__c
			WHERE Environment__c.EMUser__c != null AND EMUser__r.Id =: actualTableUserNick]) {
				envList.add(new EnvWrapper(e));
			}
			wasUserChanged = false;
		}
		return envList;
	}

	public List<SelectOption> getEnvNames(){

		List<SelectOption> options = new List<SelectOption>();

		for( Environment__c u : [SELECT Id, NAME FROM Environment__c WHERE Environment__c.EMUser__c = NULL] ){
			options.add(new SelectOption(u.Id, u.NAME));
		}

		return options;
	}

	public void setWasUserChanged(){
		wasUserChanged = true;
	}

	public List<SelectOption> getNick(){

		List<SelectOption> options = new List<SelectOption>();

		for( EMUser__c u : [SELECT Id, Nick__c FROM EMUser__c]){
			options.add(new SelectOption(u.Id, u.Nick__c));
		}

		return options;
	}


	public List<SelectOption> getTypes(){

		List<SelectOption> options = new List<SelectOption>();
		Schema.DescribeFieldResult fieldResult = Environment__c.Type__c.getDescribe();
		List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();

		for( Schema.PicklistEntry f : picklistValues){
			options.add(new SelectOption(f.getLabel(), f.getValue()));
		}

		return options;
	}

	public void assign(){
		Environment__c env = [SELECT Id, EMUser__c FROM Environment__c WHERE Id =: actualEnvId ];
		EMUser__c myUser = [SELECT Id FROM EMUser__c WHERE Id =: actualUserToAddId];
		env.EMUser__c = myUser.Id;
		update env;
	}

/////////////////////////////CLASS////////////////////////////////////////////////////////////////////////////////
	public class EnvWrapper {
		public Environment__c env {get; set;}

		public EnvWrapper(Environment__c e) {
			env = e;
		}

		public void updateChanges(){
				update env;
			}

		public void unassign(){
			env.EMUser__c = null;
			updateChanges();
		}

	}



}