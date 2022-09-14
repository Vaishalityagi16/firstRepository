trigger Trigger2 on Reservation__c (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        Trigger2Class.NewMethod(trigger.new);
    }
}