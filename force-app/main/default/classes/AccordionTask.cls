public class AccordionTask {
    @AuraEnabled 
    public static List<Account> AccordionTaskMethod(){
        try{
            List<Account> accList = [Select Id,Name from Account Limit 10];
            System.debug(System.label.Region);
            return accList;
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
            
        }
        return Null;
    }
    @AuraEnabled 
    public static List<Contact> getContacts(){
        List<Contact> conList = [Select Id,Name from Contact Limit 10];
        return conList;
    }
        @AuraEnabled 
    public static List<Opportunity> getOpportunities(){
        List<Opportunity> oppList = [Select Id,Name from Opportunity Limit 10];
        return oppList;
    }
            @AuraEnabled 
    public static List<Favorite__c> getFavourite(){
        List<Favorite__c> fList = [select id,Name from Favorite__c];
        return fList;
    }
                @AuraEnabled 
    public static List<Test__c> getTestData(){
        List<Test__c> tList = [select id,Name from Test__c];
        return tList;
    }
}