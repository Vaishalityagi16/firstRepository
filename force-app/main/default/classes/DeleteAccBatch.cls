public class DeleteAccBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator( 'Select Id,Name From Account Where CreatedDate < Last_N_Days:10');
    }
    public void execute(Database.BatchableContext bc , List<Account> accList){
        for(Account acc: accList){
            System.debug(acc);
        }
        
        Database.DeleteResult[] sr = Database.delete(accList,false);
        for(Database.DeleteResult dl: sr){
            if(dl.isSuccess()){
                System.debug('Successfully deleted account with ID:' + dl.getId());
            } 
            else {
                for(Database.Error err : dl.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                    
                }
            }
            
        } 
    }
    public void finish(Database.BatchableContext bc){
        System.debug('insert finish function');
    }
}