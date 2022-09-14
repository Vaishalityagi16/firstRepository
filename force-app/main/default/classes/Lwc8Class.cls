public class Lwc8Class {
@AuraEnabled
    public static List<Account> Lwc8ClassMethod(){
        List<Account> accList = [Select Id,Name From Account];
        return accList;
    }
 @AuraEnabled
    public static String getContacts(String lastName,String AccId){
        try{
            Contact con = new Contact();
        con.LastName= lastName;
        con.AccountId = AccId;
		con.Price__c = 100;
        insert con;
        return 'Success';
        }catch(Exception e){
            System.debug(e.getLineNumber()+' --> '+e.getMessage());
            return 'aaaa';
        }
    }
}