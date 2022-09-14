//Update all Opportunity with future Closed Date by Opportunity Name=Opportunity Name + 'F'
public class UpdateOpp {
    public static void UpdateDetails(){
        try{ Opportunity[] oppList = [Select Name,CloseDate From Opportunity LIMIT 20];
            for(Opportunity oppObj:oppList) {
            oppObj.Name= oppobj.Name + 'F';
            oppObj.closeDate= Date.today()+15;
            }
            update oppList;
            System.debug(oppList);
            } 
     catch( Exception e){
        System.debug('Message'+e.getMessage());
        System.debug('Line Number'+ e.getLineNumber());
    }
}
}