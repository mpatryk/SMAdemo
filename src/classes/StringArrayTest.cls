/**
 * Created by miler_8zu3w9c on 7/7/2017.
 */
public class StringArrayTest {
	public static List<String> generateStringArray (Integer numberOf){
		List<String> strings = new List<String>();
		for(Integer i =0; i< numberOf; i++)
			strings.add('Test '+i);
		return strings;
	}
}