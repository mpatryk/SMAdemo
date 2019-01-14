/**
 * Created by miler_8zu3w9c on 7/17/2017.
 */
@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock{

	global System.HttpResponse respond(System.HttpRequest request) {
		HttpResponse response = new HttpResponse();
		response.setHeader('Content-Type', 'application/json');
		response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
		response.setStatusCode(200);
		return response;
	}
}