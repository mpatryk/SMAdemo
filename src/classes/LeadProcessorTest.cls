/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
@IsTest
private class LeadProcessorTest {

	@TestSetup
	static void setup(){
		List<Lead> leads = new List<Lead>();
		for(Integer i=0; i<200;i++)
			leads.add(new Lead( FirstName = 'First Name '+i,
					                      LastName = 'Last Name '+i,
										  Company = 'Company'+i));
		insert leads;
	}

	@IsTest
	static void test(){
		Test.startTest();
		LeadProcessor leadProcessor = new LeadProcessor();
		Id batchId = Database.executeBatch(leadProcessor);
		Test.stopTest();

		System.assertEquals(200, [SELECT count() FROM lead WHERE LeadSource = 'Dreamforce']);
	}

}