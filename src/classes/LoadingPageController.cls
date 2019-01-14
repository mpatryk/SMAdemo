/**
 * Created by miler_8zu3w9c on 7/31/2017.
 */
public class LoadingPageController {

	public void grayThatSiteOut(){
		Long now = Datetime.now().getTime();
		while (Datetime.now().getTime()-now < 5000);
	}

}