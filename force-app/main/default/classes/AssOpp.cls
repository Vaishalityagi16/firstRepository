/*On campaign to close all the opportunities associated with the campaign when campaign status is completed. 
Example:Opportunities having line itemsin it must be closed won and opportunities having no line item must be closed lost. Send all the details of All associated opportunities.*/
public class AssOpp {
    public static void UpdateAssOpp(List<campaign> camList){
        try{ 
List<Opportunity> oppList = [Select Id,CloseDate,CampaignId,StageName,(Select Id From OpportunityLineItems) From Opportunity Where CampaignId IN:camList And Campaign.Status='Completed'];
            List<Opportunity> OList= new List<Opportunity>();
            System.debug(oppList);
            System.debug(camList );
            if(oppList.size()>0){
                for(Opportunity opp:oppList){
                   Opportunity oppL = new Opportunity();
                    if(opp.OpportunityLineItems.size()>0){
                       oppL.StageName = 'Closed Won';
                        System.debug('Hello World');
                        oppL.Id= opp.Id;
                    } else if(opp.OpportunityLineItems.size()==0){
                        oppL.StageName= 'Closed Lost';
                        oppL.Id = opp.Id;
                         System.debug('Hello World2');

                    }
                    OList.add(oppL);
                }
            } Update OList;
             
        }catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}