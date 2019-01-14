/**
 * Created by miler_8zu3w9c on 7/17/2017.
 */
@IsTest
public class AnimalLocatorTest {

	@IsTest static void testGetNameById(){
		Test.setMock(HttpCalloutMock.class , new AnimalLocatorMock());
		String response = AnimalLocator.getAnimalNameById(1);

		String expectedValue = 'chicken';
		System.assertEquals(expectedValue, response);
		String notExpectedValue = 'casdas';
        System.assertNotEquals(notExpectedValue,response );
        
	}

    
}