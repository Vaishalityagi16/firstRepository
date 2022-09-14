@isTest
private class ConLastNameTest {
    @TestSetup
    static void CreateData(){
        try{Account a = new Account();
            a.Name= 'xyz';
            insert a;

        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
} 
    
    static testMethod void UpdateLNameMethod(){
        try{ Account acc = [Select Id,Name From Account];
            Contact con = new Contact();
            con.FirstName= 'E';
            con.LastName= 'S';
            Con.Price__c= 50;
            con.AccountId= acc.Id;
            insert con;
            Test.startTest();
            
            delete con;
            Test.stopTest();
            
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    } 
}