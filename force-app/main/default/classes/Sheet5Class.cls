public class Sheet5Class {
    public static void NewMethod(){
        try{
 List<Account> accList = [select Id,Name From Account];
  List<Opportunity> oppList = [Select Id ,Name,AccountId,Account.Name,StageName From Opportunity Where StageName = 'Closed Lost' And AccountId In:accList];
List<OpportunityLineItem> oliList = [Select Id,OpportunityId, Quantity From OpportunityLineItem Where Quantity>100];
            for(OpportunityLineItem oli: oliList){
                for(Opportunity opp:oppList){
                    if(oli.OpportunityId==opp.id){
                        System.debug(opp.AccountId+' '+ 'AccountName'+ ' '+ opp.Account.Name );
                    }
                }
            }
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}