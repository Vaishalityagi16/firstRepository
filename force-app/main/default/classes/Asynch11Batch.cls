public class Asynch11Batch implements Database.Batchable<sObject> {
    String L='';
    integer i=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id, Name, CreatedDate, Phone  From Lead Where Phone = null And CreatedDate = Yesterday');
    }
    public void execute (Database.BatchableContext bc , List<Lead> leList){
        for(Lead Le: leList){
            L+= String.valueOf(i++) + Le.Name + Le.Phone + Le.Status+ '/n' ;
        }
    } public void finish (Database.BatchableContext bc){
        list<Messaging.Email>emaillist = new list<Messaging.email>(); 
        Profile P = [Select Id From Profile Where Name= 'System Administrator' Limit 1];
       User U= [Select Id,Email From User Where ProfileId =:P.Id Limit 1];
        List<string> usermail = new List<string>{U.Email};
        messaging.SingleEmailMessage NewMessage = new messaging.SingleEmailMessage();
        NewMessage.setSubject('Que11 is Executing');
        NewMessage.setToAddresses(usermail);
        String content = L;
        NewMessage.setHtmlBody(content);
        emaillist.add(NewMessage);
        Messaging.sendEmail(emaillist);
        
    }
}