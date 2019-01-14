/**
 * Created by miler_8zu3w9c on 7/18/2017.
 */
@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
	@HttpGet
	global static Account getAccount(){
		RestRequest request = RestContext.request;
		String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
		Account thisAccount = [SELECT Id,Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id =: accountId];
		return thisAccount;
	}
}