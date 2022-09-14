public class customSettingTriggerHandlerClass {
    public static void customSettingTriggerHandlerClassMethod(List<Account> accList){
        try{
      Account__c acc = Account__c.getInstance('CheckStatus');
       system.debug(acc);  
            for(Account ac:accList){
                if(ac.Status__c==ac.Status__c){
                    ac.addError('Can not update this field');
                }
            }       
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
}