public class Trigger5Class {
    public static void NewMethod(List<OpportunityContactRole>oppCList){
try{ Set<Id> oppId = new Set<Id>();
    for(OpportunityContactRole oppc: oppCList){
        oppId.add(oppc.OpportunityId);
    }
List<Opportunity> oppL = [Select Id,Name,StageName,(Select Id From OpportunityLineItems),(Select Id,OpportunityId From OpportunityContactRoles) From Opportunity Where (StageName='Prospecting' Or StageName='Qualification') And Id In: oppId];
  for(Opportunity opp : oppL){
        System.debug('a');
      for(OpportunityContactRole opc: oppCList){
          if(opc.OpportunityId==opp.Id && opp.OpportunityLineItems.size()==2 && opp.OpportunityContactRoles.size()==2){
              System.debug('aa');
              opc.AddError('Can not insert Contacts');
          }
      }
            }
     }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}