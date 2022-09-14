public class Map2 {
    public static void forList(){
        try{
            List<String> sList =new List<String>{'a','b','c','a','b'};
                system.debug(sList);
            Set<String> setList = new Set<String>(sList);
            integer count=0;
            System.debug(setList);
            for(String s: setList){
                for(String se: sList ){
                    if(s==se){
                        count++;
                    }
                }
                System.debug(s +'='+ count);
                count=0;
            }
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
        
        
    }
    public static void forMap(){
        try{
            List<String> sList =new List<String>{'a','b','c','a','b'};
                Map<String,Integer> newMap = new Map<String,Integer>();  
            for(string s: sList){
                if(!newMap.ContainsKey(s)){
                    newMap.put(s,1);    
                }
                else {
                    integer count= newMap.get(s);
                    count++;
                    newMap.put(s,count);   
                }
                
            }
            
            for(string key:newMap.keyset()){
                system.debug(key+' ====>'+newMap.get(key)); 
            }
            
        } 
        Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
    public static void AccountContacts(){
        try{
            List<Contact> conList= [Select Id,AccountId from Contact where AccountId!=null];
            Map<Id,Integer> newMap = new Map<Id,Integer>();
            for(Contact con: conList){
                if(newMap.containsKey(con.AccountId)){
                    integer count = newMap.get(con.AccountId);
                    count++;
                    newMap.put(con.AccountId,count);
                }
                else {
                    newMap.put(con.AccountId,1);
                }
            }
            for(Id key: newMap.keySet()){
                System.debug(key+'='+newMap.get(key));
            }
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
    public static void AccountRelatedContactsUsingMap(){
        List<Account> accList = [Select id,(Select Id from contacts) from Account];
        Map<Id,Integer> newMap = new Map<Id,Integer>();
        Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();
        for(Account acc:accList){
            newMap.put(acc.Id,acc.contacts.size());
            conMap.put(acc.Id,acc.contacts);
        }
        for(String key:newMap.keyset()){
            System.debug(key+'====>'+newMap.get(key));
        }
        for(String k: conMap.keyset()){
            system.debug(k+'===>'+conMap.get(k));
        }
    }
    public static void UpdateAccountsFields(){
        List<Account> accList = [select id,startDate__c,endDate__c,(Select id,startDate__c,endDate__c from Contacts where startDate__c!=null And endDate__c!=null ) from Account];
        integer dt;
        integer temp;
        for(Account acc:accList){
            integer d=0;
            if(acc.contacts.size()>0){
                Contact con= new Contact();
                for(Contact conObj: acc.contacts){
                    if(d==0){
                        d = conObj.startDate__c.daysBetween(conObj.endDate__c);  
                        con= conObj;
                    }
                    else{
                        dt = conObj.startDate__c.daysBetween(conObj.endDate__c);
                    }
                    if(d>dt){
                        temp=dt;
                        con= conObj;
                    }
                } 
                acc.startDate__c = con.startDate__c;
                acc.endDate__c = con.endDate__c;
                System.debug(acc.startDate__c +''+ acc.endDate__c);
            }   
        }update accList; 
    }
    public static void UpdateAccountsFieldsUsingMap(){
        try{
List<Contact> conList = [Select id,startDate__c,endDate__c,AccountId,Account.startDate__c,Account.endDate__c  from Contact where startDate__c!=null And endDate__c!=null];      
    Map<Id,Contact> newMap = new Map<Id,Contact>();
            List<Account> accList = new List<Account>();
            for(Contact con:conList){
                if(!newMap.containsKey(con.AccountId)){
                   newMap.put(con.AccountId,Con);
                }else {
                   Contact c = new Contact();
                    c = newMap.get(con.AccountId);
                    integer minDiff = con.startDate__c.daysBetween(con.endDate__c);
                    integer diff = c.startDate__c.daysBetween(c.endDate__c);
                    if(minDiff>diff){
                       newMap.put(c.AccountId,c); 
                    }
                }   
            }        
            for(String m:newMap.keySet()){
                Account acc = new Account();
                acc.id = m;
                acc.startDate__c = newMap.get(m).startDate__c;
                acc.endDate__c = newMap.get(m).endDate__c;
                accList.add(acc);
            }
        update accList;
        
        }
        Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
}