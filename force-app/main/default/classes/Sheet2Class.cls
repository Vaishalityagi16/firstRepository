public class Sheet2Class {
    public static void NewMethod(){
 try{  
 List<Account> accList = [Select Id,Name,Total_Quantity__c,Working_For__c From Account Where Working_For__c= 'Cloud Analogy'];
    List<OpportunityLineItem>oliList = [Select Id,OpportunityId,opportunity.AccountId,Quantity From OpportunityLineItem 
                                        Where opportunity.AccountId In:accList];
     System.debug(accList);
     System.debug(oliList);
     for(Account acc: accList){
         if(oliList.size()>0){
             for(OpportunityLineItem oli: oliList) {
                 if(acc.Id ==oli.opportunity.AccountId){
                     if( acc.Total_Quantity__c==null){
                         acc.Total_Quantity__c = oli.Quantity;
                     
                     } else {
                          acc.Total_Quantity__c+= oli.Quantity;
                     }
                   
                 }
             }
         }
     } update accList;
                   
    } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}