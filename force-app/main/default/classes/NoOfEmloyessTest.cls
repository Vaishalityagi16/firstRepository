@isTest
private class NoOfEmloyessTest {
    @TestSetup
    static void CreateData(){
        try{
            Account acc = new Account();
            acc.Name= 'xyz';
            acc.NumberOfEmployees= 4;
            insert acc;
        }Catch(Exception e){
            System.debug('Mesaage'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
    static testMethod void CreateContactsMethod(){
        try{
            List<Account> accList= [Select Id,Name,NumberOfEmployees From Account];
           Test.startTest();
             
           update accList;
            
            Test.stopTest();
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}