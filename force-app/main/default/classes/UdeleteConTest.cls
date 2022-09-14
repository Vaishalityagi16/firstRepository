@isTest
private class UdeleteConTest {
    @TestSetup
    static void CreateData(){
        try{ Contact con = new Contact();
            con.FirstName= 's';
            Con.LastName= 'T';
            con.Price__c= 100;
            insert con;
            
           }Catch(Exception e){
               System.debug('Message'+e.getMessage());
               System.debug('Line Number'+e.getLineNumber());
           }
    }
    
    
    
    static testMethod void DeleteConMethod(){
        try{ 
            
            List<Contact> conList = [Select Id,LastName,Email From Contact];
            Test.startTest();
            delete conList;
            List<Contact> con = [Select Id,LastName,Email From Contact Where isDeleted=True All Rows];
            
            undelete con;
            Test.stopTest();
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}