trigger AssociatedOpp on Campaign (After insert, before Update) {
    if(trigger.isInsert && trigger.isAfter || trigger.isUpdate && trigger.isBefore){
        AssOpp.UpdateAssOpp(trigger.new);
    }
}