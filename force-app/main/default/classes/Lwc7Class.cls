public class Lwc7Class {
@AuraEnabled(cacheable=true)
    public static List<Account> Lwc7ClassMethod(){
        return [Select Id, Name,NumberOfEmployees,Phone,Website,Rating From Account Limit 10];
    }
}