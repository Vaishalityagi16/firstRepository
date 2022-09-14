/*Update the My Balance field of contact in such a way that every contact contains equall amount of Total Balance(Account)
 Total Balance is present on Account*/
public class CheckQue {
    public static void TestQuestion(){
        List<Account> accList = [Select Id,Name,Total_Balance__c,(Select Name,My_Balance__c From Contacts) From Account Where Total_Balance__c!=null];
        List<Contact> conList = new List<Contact>();
        if(accList.size()>0){
            for(Account acc:accList){
                if(acc.Contacts.size()>0){
                   for(Contact con: acc.Contacts){
                        if(acc.Total_Balance__c!=null){
                            con.My_Balance__c = acc.Total_Balance__c/acc.Contacts.size();
                            conList.add(con);
                        }
                       }
                    }
                 }
           }update conList;
        }
}