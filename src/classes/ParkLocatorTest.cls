/**
 * Created by miler_8zu3w9c on 7/17/2017.
 */

@IsTest
public class ParkLocatorTest {

	@isTest static void testCallout() {
		// This causes a fake response to be generated
		Test.setMock(WebServiceMock.class, new ParkServiceMock());
		// Call the method that invokes a callout
		String[] expected = new String[]{'Hamburg Wadden Sea National Park', 'Hainich National Park', 'Bavarian Forest National Park'};
		String[] results = ParkLocator.country('Germany');
		// Verify that a fake result is returned
		System.assertEquals(expected, results);
	}

}