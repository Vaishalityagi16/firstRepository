public class NewTask {
    Public static void NewTaskMethod(){
        //Map<Id,List<Contact>> newMap = new Map<Id,List<Contact>>();
        Map<Id,Integer> newMap = new Map<Id,Integer>();
        List<Account> accList = [Select Id,(Select Id,LastName From Contacts) From Account Limit 5];
        System.debug(accList);
        for(Account acc: accList){
            newMap.put(acc.Id, acc.Contacts.size());
        }
        System.debug(newMap.values());
        Set<Integer> sortList = new Set<Integer>();
        sortList.addAll(newMap.Values());
        System.debug(sortList);
       System.debug(sortList.Size());
        for(integer i=0; i<=sortList.size();i++){
            
        }
        //System.debug(newMap.values().size());

    }
}
//when u want to get acc related contacts only not size then we have to use this:     
//Map<Id,List<Contact>> newMap = new Map<Id,List<Contact>>();