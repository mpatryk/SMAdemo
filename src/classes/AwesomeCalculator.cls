/**
 * Created by miler_8zu3w9c on 7/17/2017.
 */
public class AwesomeCalculator {
	public static Double add(Double x, Double y) {
		calculatorServices.CalculatorImplPort calculator =
				new calculatorServices.CalculatorImplPort();
		return calculator.doAdd(x,y);
	}
}