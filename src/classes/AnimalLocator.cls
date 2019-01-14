/**
 * Created by miler_8zu3w9c on 7/17/2017.
 */
public class AnimalLocator {


	public static String getAnimalNameById (Integer id){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		String name = '';
		if(response.getStatusCode() == 200){
			JSONParser parser = JSON.createParser(response.getBody());

			while (parser.nextToken() != null) {
				if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
						(parser.getText() == 'name')) {
					// Get the value.
					parser.nextToken();
					// Compute the grand total price for all invoices.
					name = parser.getText();
				}
			}
			System.debug(name);

		}
			return name;


	}
}