public class ConLastName {
    public static void UpdateLName(List<Contact>conList){
        Set<id> acid = new Set<Id>();
        for(Contact con: conList){
            acid.add(con.AccountId);
        }
        try {List<Account> accList= [Select Id,Name From Account Where Id IN : acId];
        List<Account> accL = new List<Account>();
        for(Contact con:conList){
            for(Account acc: accList ){
                if(acc.Id==con.AccountId){
                    acc.Name= acc.Name+' '+con.LastName;
                    accL.add(acc);
                }
            }
           } update accL;
             System.debug(accL);
            } catch(Exception e){
                System.debug('Message'+e.getMessage());
                System.debug('Line Number'+e.getLineNumber());
            }
} // Delete Last Name.
    public static void DeleteLName(List<Contact> conList){
        try{ 
            Set<id> acid = new Set<Id>();
        for(Contact con: conList){
            acid.add(con.AccountId);
        }
             
            List<Account> accList =[Select Id,Name From Account Where Id in:acId ];
            System.debug(accList);
            System.debug(conList);
            List<Account> accL = new List<Account>();
            for(Contact con: conList ){
                for(Account acc: accList){
                    
                    
                    if(con.AccountId==acc.Id){
                    acc.Name = acc.Name.replace(con.LastName,' ');
                    accL.add(acc);
                }
                }
            }update accL;
            
        }catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+ e.getLineNumber());
            
        }
    }    
    
    
    
    
    
    
    
    
    
}