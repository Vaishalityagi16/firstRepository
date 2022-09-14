trigger OpportunityCloseDate on Opportunity (before insert,After update) {
    try{
        if(trigger.isUpdate){
            if(trigger.isAfter){
                UpdateCloseDate.oppDate(trigger.new);
                Que7UpdateField.PrSoldField(trigger.new);
            }
        }
    }catch(Exception e){
        System.debug(e.getLineNumber()+' : '+e.getMessage());
    }
}