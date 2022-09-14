public class ApexSharingClass {
    public static void ApexSharingClassMethod(){
        try{ 
       Test__c tList = [Select Id,Name from Test__c  where Name = 'ApexSharing'];	
       User Us = [Select id,Name from User where id='0055j000007HKFxAAO'];
            Test__Share testShare = new Test__Share();
            testShare.ParentId = tList.Id;
                testShare.AccessLevel = 'Edit';
            testShare.UserOrGroupId = Us.Id;
            Database.insert(testShare); 
            System.debug('Success');
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
}