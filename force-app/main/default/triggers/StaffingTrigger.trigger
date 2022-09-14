trigger StaffingTrigger on Staffing__c (After insert,After Update) {
    if(trigger.isInsert && trigger.isAfter){
        StaffingTriggerHandlerClass.UpdateOfferTotalPriceFieldOnInsert(trigger.new);
    }
    if(trigger.isUpdate && trigger.isAfter){
        StaffingTriggerHandlerClass.UpdateOfferTotalPriceFieldOnUpdate(trigger.new);
    }
}