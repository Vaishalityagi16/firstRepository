public class Lwc6Class {
@auraenabled
    public static String Lwc6ClassMethod(String UserName, String Password){
        String msg= '';
        List<Contact> conList= [Select Id,LastName From Contact where UserName__c=:UserName and Password__c	=:Password];
        System.debug(UserName);
            System.debug(Password);
        if(!conList.isEmpty()){
            msg= 'Sucessfully logedin';
        }
        System.debug(conList);
        return msg;
    }
}