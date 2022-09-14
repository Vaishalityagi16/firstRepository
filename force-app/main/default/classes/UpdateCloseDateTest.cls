@isTest
private class UpdateCloseDateTest {
     @TestSetup
    static void CreateData(){
        try{ Opportunity opp = new Opportunity();
               opp.Name = 'xyz';
                opp.StageName= 'Prospecting';
                 opp.CloseDate= date.newInstance(2022, 04, 10);
                  insert opp;
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
   
    static testMethod void oppDateMethod(){
        try{  List<Opportunity> oppList = [Select Id,Name,StageName,CloseDate From Opportunity];
            Test.startTest();
            
            update oppList;
            
            Test.stopTest();
                   
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }  
}