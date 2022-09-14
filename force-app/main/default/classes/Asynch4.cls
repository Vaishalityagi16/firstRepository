public class Asynch4 {
    public static void OppAdd(){
        try{ List<Opportunity> oppList = new List<Opportunity>();
            for(integer i= 0; i<5; i++){
                Opportunity opp = new Opportunity();
            opp.Name= 'New'+ i;
                opp.StageName= 'Prospecting';
                opp.CloseDate= date.today();
                oppList.add(opp);
            } insert oppList;
             
            
        }Catch(Exception e){
         System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}