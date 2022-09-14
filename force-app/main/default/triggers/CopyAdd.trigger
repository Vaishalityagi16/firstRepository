trigger CopyAdd on Contact (before insert, after Update) {
    if(trigger.isInsert && trigger.isBefore){
        CopyAddress.ContactAdd(trigger.new);
    }
    if( trigger.isUpdate && trigger.isAfter){
        CopyAddress.ContactAdd(trigger.new);
    }

}