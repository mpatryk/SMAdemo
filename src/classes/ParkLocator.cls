/**
 * Created by miler_8zu3w9c on 7/17/2017.
 */
public class ParkLocator {
	public static String[] country(String nameOfCountry){
		ParkService.ParksImplPort countries = new ParkService.ParksImplPort();

		System.debug(countries.byCountry(nameOfCountry));
		// Germany, India, Japan and United States
		return countries.byCountry(nameOfCountry);
	}

}