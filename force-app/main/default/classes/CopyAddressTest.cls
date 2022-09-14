@isTest
private class CopyAddressTest {
    static testMethod void ContactAddMethod(){
        try{ Account acc = new Account();
            acc.Name= 'xyz';
            acc.BillingCity= 'M';
            acc.BillingCountry='I';
            acc.BillingPostalCode= '201206';
            acc.BillingState= 'UP';
            acc.BillingStreet = 'R';
            insert acc;
            
            Contact con = new Contact();
            con.FirstName= 'S';
            con.LastName= 'T';
            con.Price__c = 100;
            con.AccountId= acc.Id;
            con.COPY_ADDRESS_FROM_ACCOUNT__c= True;
             insert con;
            Test.startTest();
           
            update con;
            Test.stopTest();
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }

}