@isTest
private class CopyOwnerNameTest {
    @TestSetup
    static void CreateData(){
        try{Account acc = new Account();
            acc.Name = 'abc';
            insert acc;
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
    static testMethod void AownerMethod(){
        try{ List<Account> accList = [Select Id,Name From Account];
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}