trigger CopyName on Account (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        CopyOWName.OwnerName(trigger.new);
    }
}