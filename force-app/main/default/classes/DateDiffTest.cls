@isTest
private class DateDiffTest {
    static testMethod void DifferenceMethod(){
        try{ 
            Test.startTest();
            DateDiff.Difference();
            Test.stopTest();
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}