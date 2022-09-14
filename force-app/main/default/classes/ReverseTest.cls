@isTest
private class ReverseTest {
    static testMethod void ReverseNumberMethod(){
        try{
            Test.startTest();
        Reverse.ReverseNumber(456);
        Test.stopTest();
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
        
    }
}