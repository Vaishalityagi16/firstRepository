// Create 20 Opportunity with Closed Date, Stage and Opportyunity Name.
public class TestOP {
public static void OpportunityRecords(Integer count){
        try{
            List<Opportunity> oppList = new List<Opportunity>();
        
            for(Integer i=0; i<count; i++){
                Opportunity opp = new Opportunity();
                opp.CloseDate = Date.today();
                opp.StageName = 'Prospecting';
                opp.Name = 'Test '+ i;
                
                oppList.add(opp);
            }System.debug(oppList);
            
            upsert oppList;
        }catch(Exception e){
            System.debug('Error at Line : '+ e.getLineNumber() + '  '+ e.getMessage());
        }
	}
}