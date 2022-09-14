trigger UpdateAccName on Contact (After insert,After delete) {
    if(trigger.isInsert && trigger.isAfter){
        ConLastName.UpdateLName(trigger.new);
    }
    if(trigger.isdelete && trigger.isAfter){
        ConLastName.DeleteLName(Trigger.old);
    }
}