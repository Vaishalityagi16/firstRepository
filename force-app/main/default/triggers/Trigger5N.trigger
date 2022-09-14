trigger Trigger5N on OpportunityContactRole (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        Trigger5Class.NewMethod(trigger.new);
    }
}