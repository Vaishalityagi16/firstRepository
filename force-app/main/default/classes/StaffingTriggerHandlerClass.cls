public class StaffingTriggerHandlerClass {
    public static void UpdateOfferTotalPriceFieldOnInsert(List<Staffing__c> newList){
        
        try{ 
             set<Id> offId = new set<Id>();
            for(Staffing__c Staffingob:newList){
                offId.add(Staffingob.Offering__c);
            }
 List<Offering__c> ofList = [Select Id,totalPrice__c from Offering__c where Id=:offId];
            for(Staffing__c ob: newList){
                 for(Offering__c offObj: ofList){
                     if(ob.Offering__c == offObj.id && ob.Price__c!=null){
                         if(offObj.totalPrice__c != null)
                          offObj.totalPrice__c += ob.Price__c;
                        // offObj.id = ob.Offering__c;
                         else
                             offObj.totalPrice__c = ob.Price__c;
                     }
                 }
            }
            update ofList;
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
    public static void UpdateOfferTotalPriceFieldOnUpdate(List<Staffing__c> newList){
        try{ Set<Id> offId = new Set<Id>();
            for(Staffing__c ob: newList){
               offId.add(ob.Offering__c); 
            }           
     List<Offering__c> offList = [Select Id, totalPrice__c,(Select Id,Price__c from Staffings__r) from Offering__c where Id=:offId];   
            for(Offering__c offObj: offList){
                offObj.totalPrice__c = 0;
                for(Staffing__c staffObj:offObj.Staffings__r){
                    if(staffObj.Price__c!=null){                   
                     offObj.totalPrice__c += staffObj.Price__c;
                    }
                }
            }update offList;
            
        }  Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
}