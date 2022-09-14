trigger Trigger1 on Lead (before insert,before update) {
    if(trigger.isInsert && trigger.isBefore || trigger.isUpdate && trigger.isBefore){
        Trigger1Class.NewMethod(trigger.new);
    }
}