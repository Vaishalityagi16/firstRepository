@isTest
private class MinimumDateTest {
    static testMethod void dateDiffMethod(){
        try{
           Account acc = new Account();
            acc.Name = 'abc';
            insert acc;
            
            List<Contact> conList = new List<Contact>();
            for(integer i=1; i<=2; i++){
                Contact con = new Contact();
                con.FirstName= 'abc';
                con.LastName = 'T';
                con.Price__c= 100;
                con.AccountId= acc.Id;
                con.startDate__c= date.today();
                con.endDate__c= con.startDate__c+20;
                conList.add(con);
            } insert conList;
            
            Test.startTest();
            
            MinimumDate.dateDiff();
            
            Test.stopTest();
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}