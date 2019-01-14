/**
 * Created by miler_8zu3w9c on 7/7/2017.
 */
public class AccountHandler {

	public static Account insertNewAccount(String name){
		try{
			Account account = new Account(Name = name);
			insert account;
			return account;
		}catch (DmlException e){
			return null;
		}
	}

}