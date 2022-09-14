public class Sheet6Class {
    public static void NewMethod(){
        try{
List<Account> accList = [Select Id,Total_Balance__c,(Select Id,My_Balance__c From Contacts)From Account];
            List<Contact>conList= new List<Contact>();
            for(Account acc:accList){
                if(acc.Contacts.size()>0){
                     for(Contact con: acc.Contacts){
                    if(acc.Total_Balance__c!=null){
                 con.My_Balance__c = acc.Total_Balance__c/acc.Contacts.size(); 
                     conList.add(con);
                }
                  
                    }
                }
            } update conList;     
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}