// print all account with oli if opportunity line item quantity > 100 and account name is vaishali.
public class Question2 {
    public static void NewQue() {
        try{ List<Account> accList = [Select Id,Name From Account];
             List<Opportunity> oppList =[Select Id,Name,Account.Name from Opportunity where Account.Name like '%Vaishali %'];
            List<OpportunityLineItem> oliList = [Select Id,Name,OpportunityId,Quantity from OpportunityLineItem Where Quantity>100];
            for(OpportunityLineItem oli:oliList){
                for(Opportunity opp:oppList){
                    if(oli.OpportunityId==opp.id){
                        System.debug('Account Name'+opp.Account.Name+ 'OpportunityLineItem'+oli);
                    }
                }
            }
            
        }catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}