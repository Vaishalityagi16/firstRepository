/* Calculate the difference between each contacts startdate and enddate fields and the contact which has the minimum difference of startdate and enddate, populate that contacts startdate and enddate fields on the account objects startdate and enddate fields*/
public class MinimumDate {
    public static void dateDiff(){
        try{
            List<account> accList=[select id,startDate__c,endDate__c,(Select id,startDate__c,endDate__c from contacts where startDate__c!=null and endDate__c!=null) from account];
         integer minDiff=0;
        if(accList.size() > 0) {
            System.debug(accList);
        for(account ac:accList){
            if(ac.contacts.size() > 0){
                 contact obj = new contact();
                for(contact con:ac.contacts){
                   
                   if(minDiff==0){
                    minDiff = con.startDate__c.daysBetween(con.endDate__c);
                       obj = con;
                }
                    else{
                        integer diff2 = con.startDate__c.daysBetween(con.endDate__c);
                        if(minDiff>diff2){
                            minDiff = diff2;
                            obj = con;
                            
                        }
                    }
 
                }	
                minDiff = 0;
                ac.startDate__c  = obj.startDate__c;
                ac.endDate__c    = obj.endDate__c;
                System.debug(ac.startDate__c );
                               System.debug(ac.endDate__c );

            }
        
    }
}System.debug('toBeUpdated :'+accList);
        update accList;
        }catch(exception e){
            system.debug('get error ===.'+e.getMessage()+' at line number ==>'+e.getLineNumber());
        }
    }
}