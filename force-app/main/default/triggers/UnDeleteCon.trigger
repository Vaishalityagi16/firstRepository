trigger UnDeleteCon on Contact (After Undelete) {
    if(trigger.isUndelete && trigger.isAfter){
        UdeleteCon.DeleteCon(trigger.new);    
    }
}