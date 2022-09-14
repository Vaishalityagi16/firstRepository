public class Asynch13Batch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Name From Account');
    }
    public void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account acc: accList){
            System.debug(acc.Name);
            acc.Name= acc.Name+'Cloud';
        } 
        update accList;
        
    }
    public void finish(Database.BatchableContext bc){
        System.debug('inserted');
    }

}