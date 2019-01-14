/**
 * Created by miler_8zu3w9c on 7/14/2017.
 */
public class MySpinnerController {
	public void spin(){
		Long now = Datetime.now().getTime();
		while (Datetime.now().getTime()-now<5000);
	}

}