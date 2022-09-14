/*public class CopyOWName {
    public static void OwnerName(List<Account> accList){
        try{  
            user usObj = new User();
                usObj.FirstName = UserInfo.getFirstName();
                usObj.LastName=UserInfo.getLastName();
            for(Account acc: accList){
                acc.Sales_Representative__c	= usObj.FirstName+' '+usObj.LastName;
            }
            
        } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}
*/

public class CopyOWName {
    public static void OwnerName(List<Account> accList){
        try{  User usObj = [Select Id,firstName,LastName From User Where ID=:userinfo.getuserid()];
            for(Account acc: accList){
                acc.Sales_Representative__c	= usObj.FirstName+' '+usObj.LastName;
            }
            
        } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}