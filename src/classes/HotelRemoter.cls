/**
 * Created by miler_8zu3w9c on 7/13/2017.
 */
global with sharing class HotelRemoter {

	@RemoteAction
	global static List<Hotel__c> findAll(){
		return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s
				FROM Hotel__c];
	}

}