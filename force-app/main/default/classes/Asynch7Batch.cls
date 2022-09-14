public class Asynch7Batch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Name,Count__c,(Select Id From Contacts) From	Account');
    }
    public void execute(Database.BatchableContext bc , List<Account> accList){
        for(Account acc: accList){
            System.debug(acc);
            acc.Count__c = acc.Contacts.size();
        }
        Database.SaveResult[] sr = Database.update(accList,False);
        for(Database.SaveResult s: sr){
            if(s.isSuccess()){
                System.debug('insertion sucessful  '+ s.getId());
            }
            else{
                for(Database.Error err: s.getErrors()){
                   System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields()); 
                }
            }
        }
    } 
    public void finish(Database.BatchableContext bc){
        System.debug('Insert finish ');
    }

}