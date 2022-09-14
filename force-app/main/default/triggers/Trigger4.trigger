trigger Trigger4 on Contact (After insert, before update) {
    if(trigger.isInsert && trigger.isBefore || trigger.isUpdate && trigger.isBefore){
        Trigger4Class.NewMethod(trigger.new);
    if(trigger.isInsert && trigger.isAfter){
        ContactProduct.ContactMethod(trigger.new);
    }
    }
}