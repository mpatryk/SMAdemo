/**
 * Created by miler_8zu3w9c on 7/19/2017.
 */
public class UpdateParentAccount implements Queueable{

	private List<Account> accounts;
	private Id parent;

	public UpdateParentAccount(List<Account> records, Id id){
		this.accounts = records;
		this.parent = id;
	}

	public Void execute(System.QueueableContext context) {
		for(Account account : accounts){
			account.ParentId = parent;
		}
		update accounts;
	}
}