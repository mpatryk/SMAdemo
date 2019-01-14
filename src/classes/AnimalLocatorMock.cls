/**
 * Created by miler_8zu3w9c on 7/17/2017.
 */
@isTest
global class AnimalLocatorMock implements HttpCalloutMock{
	global System.HttpResponse respond(System.HttpRequest request) {
		HttpResponse response = new HttpResponse();
		response.setHeader('Content-Type', 'application/json');
		response.setBody('{"animal": {"id":1,"name":"chicken"}}');
		response.setStatusCode(200);
		return response;
	}

}