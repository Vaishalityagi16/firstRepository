@isTest
private class CreatePbeTest {
    @TestSetup
    static void CreateData(){
        try{
           
            Pricebook2 pb = new Pricebook2();
            pb.Id = Test.getStandardPricebookId();
            pb.isActive= True;
            update pb;
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
    static testMethod void CreatePbeMethod(){
        try{ 
             Product2 pro = new Product2();
            pro.Name= 'Watch';
            pro.IsActive= True;
            
            Pricebook2 pb= [Select Id,isStandard From Pricebook2 Where isStandard= True];
            Test.startTest();
                        insert pro;

            Test.stopTest();
            
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}