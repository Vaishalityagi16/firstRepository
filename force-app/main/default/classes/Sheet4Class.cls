public class Sheet4Class {
    public static void NewMethod(){
        try{
 List<Account> accList= [Select Id,Name,(Select Id,Name,StageName,CloseDate From Opportunities Where StageName ='Closed Won' And CloseDate>today) From Account]; 
            for(Account acc: accList) {
                for(Opportunity opp: acc.Opportunities){
                      System.debug(acc);
                }
                        
                    }
              
                }
            Catch(EXception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}