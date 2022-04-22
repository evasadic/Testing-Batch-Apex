public class AccountsBatch implements Database.Batchable <SObject>, Database.Stateful {
    public integer count = 0;
  public Database.QueryLocator start(Database.BatchableContext bc){
      Database.QueryLocator q1 = Database.getQueryLocator([Select id, description from Account]);
      return q1;
  }
  public static void execute(Database.BatchableContext bc, List<Account> scope){
    list<Account> updateAcc = new list<Account>();
    for( Account acc : scope){
        acc.Description = ' .. New updated via Batch apex  - ' + count;
        updateAcc.add(acc);
        count++;
    }
    if(!updateAcc.isEmpty())
    update updateAcc;

  }
  public void finish(Database.BatchableContext bc){
      system.debug('done with updating all the acc  - ' + count);
      system.debug('updated account number is = ' + count);
  }
}
