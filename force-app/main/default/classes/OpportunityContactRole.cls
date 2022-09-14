public class OpportunityContactRole {
    public static void TryMethod(){
        try{
            List<Contact> conList = [SELECT Id,Name,Accountid FROM Contact WHERE Id IN (SELECT ContactId FROM OpportunityContactRole) AND Accountid  IN (SELECT id from account)];
            List<Contact> conL = new List<Contact>();
            for(Contact con: conList){
                conL.add(con);
            }
            System.debug(conL);
            
        }
        Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}