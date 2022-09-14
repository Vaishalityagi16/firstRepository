trigger Trigger3 on Opportunity (before insert,before Update) {
    if(trigger.isUpdate && trigger.isBefore){
        Trigger3Class.NewMethod(trigger.new);
    }
}