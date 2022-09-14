public class PaginationClass {
     @AuraEnabled 
    public static List<Account> PaginationClassMethod(){
        try{
        List<Account> accList = [Select Name, Active__c from Account ORDER BY Name limit 76];
            System.debug(accList);
            return accList;
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
return null;

    }
}