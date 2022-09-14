trigger Que10Trigger on OpportunityLineItem (After insert, After Update, before Delete) {
    if(trigger.isInsert && trigger.isAfter || trigger.isUpdate && trigger.isAfter){
        Que10Class.Que10Method(trigger.new);
    } else if(trigger.isDelete && trigger.isBefore){
        Que10Class.UpdateDelete(trigger.old);
    }
}