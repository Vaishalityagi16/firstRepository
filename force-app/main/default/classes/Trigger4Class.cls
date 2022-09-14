public class Trigger4Class {
    public static void NewMethod(List<Contact> conList){
       
try{ Set<Id> accId = new Set<Id>();
    for(Contact conn: conList){
        accId.add(conn.AccountId);
    }
List<Account> accList= [Select Id,isEven__c,Total_Price__c,(Select Id,Price__c,Email From Contacts Where Price__c!=null)From Account Where Id In: accId];
      String usEmail= UserInfo.getUserEmail();
    System.debug(usEmail);
    double a= 0;
    for(Account acc: accList){ 
        for(Contact con: acc.Contacts){
            if(con.Email==usEmail){
                a+= con.Price__c;
                System.debug('aaa');
            }
           
        }
        acc.Total_Price__c=a;
        a=0;
        if(acc.Total_Price__c/2==0){
             acc.isEven__c= True;
           
        } else{
            acc.isEven__c= False;
           
        }
           
    } update accList;
    
       
   }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}