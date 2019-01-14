/**
 * Created by miler_8zu3w9c on 7/7/2017.
 */
@IsTest
private class TestVerifyDate {

	@IsTest static void CheckDates() {
		Date date1 = Date.newInstance(1960, 2, 17);
		Date date2 = Date.newInstance(1960,3 , 20);
		Date expected = Date.newInstance(1960,2,29);
		Date verifyingVarDate =  VerifyDate.CheckDates(date1, date2);
		System.assertEquals(expected,verifyingVarDate);
	}

	@IsTest static void CheckDatesDate2() {
		Date date1 = Date.newInstance(1960, 2, 17);
		Date date2 = Date.newInstance(1960,2 , 29);
		Date verifyingVarDate =  VerifyDate.CheckDates(date1, date2);
		System.assertEquals(date2,verifyingVarDate);
	}

	@IsTest static void CheckDatesInvaild() {
		Date date1 = Date.newInstance(1960, 2, 17);
		Date date2 ;
		Date verifyingVarDate =  VerifyDate.CheckDates(date1, date2);
		System.assertEquals(null,verifyingVarDate);
	}

}