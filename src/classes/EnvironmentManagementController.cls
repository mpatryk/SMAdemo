/**
 * Created by miler_8zu3w9c on 7/25/2017.
 */
public class EnvironmentManagementController {

	public List<EnvWrapper> envList {get; set;}
	public String actualTableUserNick {get;set;}
	public String actualUserToAddId {get;set;}
	public String actualEnvId {get;set;}
	public String actualEnvIdToDelete {get;set;}
	public String actualType {get;set;}
	public String actualStatus {get;set;}
	public Boolean isTypedEnvNameEmpty {get;set;}
	public Boolean isAdmin{get;set;}
	public Boolean wasUserChanged = true;
	public Boolean isEnvsListEmpty = false;
	public String typedEnvName{
		get{
			isTypedEnvNameEmpty = (typedEnvName == '' || typedEnvName == null) ? true : false;
			return typedEnvName;
		}
		set;}


	public List<EnvWrapper> getEnvironments() {
		if(wasUserChanged || (envList == null || envList.isEmpty())) {
			envList = new List<EnvWrapper>();
			for(Environment__c e: [select Id, Status__c, Name, Type__c, IsEnabled__c, EMUser__r.Id, EMUser__r.Nick__c from Environment__c
					WHERE Environment__c.EMUser__c != null AND EMUser__r.Id =: actualTableUserNick]) {
				envList.add(new EnvWrapper(e));
			}
			wasUserChanged = false;
		}
		System.debug(JSON.serialize(envList));
		return envList;
	}

	public List<SelectOption> getEnvNames(){
		List<SelectOption> options = new List<SelectOption>();

		for( Environment__c u : [SELECT Id, NAME FROM Environment__c WHERE Environment__c.EMUser__c = NULL] ){
			options.add(new SelectOption(u.Id, u.NAME));
		}

		isEnvsListEmpty = options.isEmpty() ? true:false;
		return options;
	}

	public void setWasUserChanged(){
		wasUserChanged = true;
	}

	public Boolean getIsEnvsListEmpty(){
		return this.isEnvsListEmpty;
	}

	public List<SelectOption> getNick(){
		List<SelectOption> options = new List<SelectOption>();

		for( EMUser__c u : [SELECT Id, Nick__c FROM EMUser__c]){
			options.add(new SelectOption(u.Id, u.Nick__c));
		}

		return options;
	}

	public void createNewEnv(){
		Environment__c environment = new Environment__c(Type__c = actualType,
														Status__c = actualStatus,
														Name = typedEnvName);
		if (actualType == null)
			environment.Type__c = 'Development';
		insert environment;
		typedEnvName = null;
	}

	public void deleteEnv(){
		Environment__c environment = [SELECT Id FROM Environment__c WHERE Id =: actualEnvIdToDelete];
		delete environment;
	}

	public List<SelectOption> getTypes(){
		List<SelectOption> options = new List<SelectOption>();
		Schema.DescribeFieldResult fieldResult = Environment__c.Type__c.getDescribe();
		List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();

		for( Schema.PicklistEntry value : picklistValues){
			options.add(new SelectOption(value.getLabel(), value.getValue()));
		}

		return options;
	}

	public List<SelectOption> getSpecialStatus(){
		List<SelectOption> options = new List<SelectOption>();
		Schema.DescribeFieldResult fieldResult = Environment__c.Status__c.getDescribe();
		List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();

		for( Schema.PicklistEntry value : picklistValues){
			options.add(new SelectOption(value.getLabel(), value.getValue()));
		}

		return options;
	}




	public void grayThatSiteOut(){
		Long now = Datetime.now().getTime();
		while (Datetime.now().getTime()-now < 5000);
	}



	public void assign(){
		Environment__c env = [SELECT Id, EMUser__c FROM Environment__c WHERE Id =: actualEnvId ];
		EMUser__c myUser = [SELECT Id FROM EMUser__c WHERE Id =: actualUserToAddId];
		env.EMUser__c = myUser.Id;
		update env;
	}

	public static void createLog(Environment__c env , String action){
		History__c history = new History__c();
		history.EMUser__c = env.EMUser__c;
		history.Name = 'Log-'+Datetime.now();
		history.Time__c = Datetime.now();
		history.Environment__c = env.Id;
		history.Action__c = action;
		insert history;
	}


/////////////////////////////WRAPPER CLASS//////////////////////////////////////////////////////////////////////////////
	public class EnvWrapper {
		public Environment__c env {get; set;}
		public String status {get;set;}

		public EnvWrapper(Environment__c e) {
			env = e;
			status = e.Status__c;
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