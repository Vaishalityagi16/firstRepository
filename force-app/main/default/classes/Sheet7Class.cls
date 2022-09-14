public class Sheet7Class {
    public static void NewMethod(){
try{ 
List<Account> accList= [Select id,startDate__c,endDate__c,(Select id,startDate__c,endDate__c From Contacts Where startDate__c!=null And endDate__c!=null) From Account];
    integer minD=0;
    for(Account acc: accList){ 
        if(acc.contacts.size()>0){
        Contact con= new Contact();
        for(Contact conObj: acc.Contacts){
        if(minD==0){
              minD= conObj.startDate__c.daysBetween(conObj.endDate__c); 
              con = conObj;  
        }  else{
            integer minDiff= conObj.startDate__c.daysBetween(conObj.endDate__c);
            if(minD>minDiff){
                minD = minDiff;
                con= conObj;
            }
        } 
        }  minD=0;
        acc.startDate__c = con.startDate__c;
        acc.endDate__c = con.endDate__c;
        System.debug(acc.startDate__c );
                               System.debug(acc.endDate__c );
    } 
        } update accList;
}Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}