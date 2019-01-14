/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
@IsTest
private class DailyLeadProcessorTest {
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';
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
		DailyLeadProcessor dailyLeadProcessor = new DailyLeadProcessor();
		System.schedule('ScheduledApexTest',CRON_EXP,dailyLeadProcessor);
		Test.stopTest();

		System.assertEquals(200, [SELECT count() FROM lead WHERE LeadSource = 'Dreamforce']);
	}
}