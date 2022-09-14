public class Task1Class {
@AuraEnabled
    public static List<Account> Task1ClassMethod(){
        System.debug('1');
        List<Account> accList = [Select Id,Name,Site,AccountNumber From Account];
        System.debug(accList);
        return accList;
    }
@AuraEnabled
    public static String deleterecords(List<Account> accList){
        try{
            System.debug('2');
            System.debug(accList);
            delete accList;
            return ' Success';
        }catch(Exception e){
            System.debug(e.getLineNumber()+'----->'+e.getMessage());
        	return 'aaaaa';
        }
        
    } 
    
}