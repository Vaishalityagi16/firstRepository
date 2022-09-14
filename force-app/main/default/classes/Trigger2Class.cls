public class Trigger2Class {
    public static void NewMethod(List<Reservation__c> RList){
try{ List<Reservation__c> ReList = [Select id,Name,PassengerId__c,ReservationDate__c,TrainId__c From Reservation__c];
    for(Reservation__c Res1:RList){
        for(Reservation__c Res2: ReList){
            if(Res1.PassengerId__c==Res2.PassengerId__c && Res1.ReservationDate__c==Res2.ReservationDate__c && Res1.TrainId__c==Res2.TrainId__c){
  Res1.AddError('Same Passenger Can not book again for the same date and same train');            
            } 
            
        }
    }      
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}