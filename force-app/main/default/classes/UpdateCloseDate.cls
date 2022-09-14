public class UpdateCloseDate {
    public static void oppDate(List<Opportunity> opp){
        try{
            for(Opportunity op: opp){
                if(op.CloseDate<Date.today()){
                    op.addError('Please enter a future Closed Date');
                }
            }
            
        }catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}