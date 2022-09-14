public class Que10Class {
    public static void Que10Method(List<OpportunityLineItem> oppLi){
        try{
    List<Opportunity> oppList = [Select AccountId,(Select Id,OpportunityId From OpportunityLineItems Where ID IN:oppLi) From Opportunity Where AccountId!=null];
     List<Account> accList = [Select Id, Number_of_LineItems__c From Account];
        System.debug(accList);
        System.debug(oppList);
            for(Account accObj:accList){
			for(Opportunity oppObj:oppList){
			if(accObj.id == oppObj.AccountId  && oppObj.OpportunityLineItems.size()>0){
			accObj.Number_of_LineItems__c = accObj.Number_of_LineItems__c+oppObj.OpportunityLineItems.size();
            } 
			}
			}
    update accList;
        } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
    // For Delete ..
     public static Void UpdateDelete(List<OpportunityLineItem> oppLi){
         try{
    List<Opportunity> oppList = [Select AccountId,(Select Id,OpportunityId From OpportunityLineItems Where ID IN:oppLi) From Opportunity Where AccountId!=null];
     List<Account> accList = [Select Id, Number_of_LineItems__c From Account];
         System.debug(oppList);
         
            for(Account accObj:accList){
			for(Opportunity oppObj:oppList){
			if(accObj.id == oppObj.AccountId  && oppObj.OpportunityLineItems.size()>0){
			accObj.Number_of_LineItems__c = accObj.Number_of_LineItems__c - oppObj.OpportunityLineItems.size();
                System.debug(oppObj.OpportunityLineItems.size());
            } 
			}
			}  update accList;
         } Catch(Exception e){
             System.debug('Message'+e.getMessage());
             System.debug('Line Number'+e.getLineNumber());
         }
}
}