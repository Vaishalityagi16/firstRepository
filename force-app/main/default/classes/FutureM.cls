public class FutureM {
 @Future
    public static void NewM(List<Id> accId){
        try{ List<Account> accList = [Select Id,Name,Count__c,(Select Id From Contacts) From Account];
            for(Account acc: accList){
                acc.Count__c = acc.contacts.size();
            } System.debug('in future Method    '+accId.size());
            update accList;
            
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}
/* List<Account> ac = [Select Id from Account];
List<Id> accId = new List<Id>();
for(Account acc: ac){
    accId.add(acc.Id);
}

FutureM.NewM(accId);*/