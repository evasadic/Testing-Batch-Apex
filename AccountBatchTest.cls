@isTest
public with sharing class AccountBatchTest {
    @isTest
    public static void testAccDescriptionUpdate(){
        Account acc1 = new Account();
        acc1.Name = 'Test Account1';
        
        Account acc2 = new Account();
        acc2.Name = 'Test Account2';
         
        List<Account> acclist = new List<Account>{acc1, acc2};
        for(integer i=0; i<900; i++){
            Account acc = new Account();
            acc.Name = 'Test acc ' + i;
            acclist.add(acc);
        }
        insert acclist;

        Test.startTest();
        AccountsBatch accBatch = new AccountsBatch();
        Database.executeBatch(accbatch, 950);

        //list<Account> accupd = [select id, name, description from Account];

        //system.assert(902, accupd.size());
    }
}
