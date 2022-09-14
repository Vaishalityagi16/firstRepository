public class OpportunityApexSharing {
    public static void OpportunityApexSharingMethod(){
        try{
            Opportunity opp = [Select Id,Name from Opportunity Where Name='Keratein'];
            User Us = [Select id,Name from User where id='0055j000007HKFxAAO'];
            OpportunityShare oppShare = new OpportunityShare();
                     oppShare.OpportunityId = '0065j00000mTQBUAA4';
                      oppShare.UserOrGroupId = us.Id;
                       
                       OppShare.OpportunityAccessLevel = 'Read';
                      insert oppShare;
            System.debug('Success');

            
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
}