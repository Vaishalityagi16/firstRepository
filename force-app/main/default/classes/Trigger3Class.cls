public class Trigger3Class {
    public static void NewMethod(List<Opportunity> oppList){
try{ List<Opportunity> oppL= [Select Id,Account.Working_In__c,(Select Id,OpportunityId From OpportunityLineItems)
                              From Opportunity where Id In: oppList And StageName='Closed Won' And Account.Working_In__c='Asia'];
    for(Opportunity opp: oppL){
        for(Opportunity op: oppList){
                 if(opp.OpportunityLineItems.size()<3 && opp.Id==Op.Id){
                 op.AddError('Can Not Update Opportunity With less than 3 Line Items');
             }
            
        } 
    }
   }
Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}