public class Lwc2 {
@auraenabled
    public static List<Account> Lwc2Method(){
        List<Account> accList = [Select Id,Name From Account ];
        return accList;
    }
    @auraenabled
    public static List<Opportunity> Lwc2OppMethod(String i){
        List<Opportunity> oppList =[Select Id, Name , AccountId From Opportunity Where AccountId =:i];
        System.debug('Inside Opp'+oppList);
        return oppList;
    }
    @auraenabled
    public static List<Contact> Lwc2ConMethod(String r){
        List<Contact> conList = [Select Id,Name, AccountId From Contact Where AccountId=:r];
                System.debug('Inside con '+conList);
        return conList;
    }
}