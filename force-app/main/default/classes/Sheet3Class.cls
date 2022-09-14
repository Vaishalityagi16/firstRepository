public class Sheet3Class {
    public static void NewMethod(){
        try{
 List<OpportunityLineItem> oliList = [Select Id,Name,OpportunityId,TotalPrice From OpportunityLineItem Where Name Like '%Gandhiji Chasma%'];
 integer Count=0;
                for(OpportunityLineItem oli:oliList){
                 count += (integer)oli.TotalPrice;
                    
                    }  System.debug(count);
                }
Catch(Exception e)  {
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }  
            }
}