public class Sheet8Class {
    public static void NewMethod(){
try{
    Map<ID,Account> IdTOAccMap = new map<ID,Account>([Select id,ProductName__c,Total_Quantity__c,Total_Amount__c from Account]);
    
List<Opportunity>oppList = [Select Id,Name,AccountID,(Select id,Name,Quantity,TotalPrice from OpportunityLineItems) From Opportunity Where AccountId!=null];
    List<Account> accList = new List<Account>();
    System.debug('oppList'+ oppList);
    
  String a='';
    double b=0;
    double c=0;
    for(Opportunity opp: oppList){
        for(OpportunityLineItem oli:opp.OpportunityLineItems){
                 a+=oli.Name; 
                b+= oli.Quantity;
              c+= oli.TotalPrice;
                System.debug('aaaa');
          
              
            }
        if(IdTOAccMap.containsKey(opp.AccountID)){
          Account acc= IdTOAccMap.get(opp.AccountID);
            System.debug(acc.Total_Amount__c );
            System.debug(acc.ProductName__c);
            System.debug(acc.Total_Quantity__c);
            if(acc.ProductName__c == null && acc.Total_Quantity__c == 0 && acc.Total_Amount__c == null){
                acc.ProductName__c = a;
                acc.Total_Quantity__c= b;
                acc.Total_Amount__c= c;
                System.debug('aaaaa1');
            }
            else{
                acc.ProductName__c += a;
                acc.Total_Quantity__c += b;
                acc.Total_Amount__c += c;
                 System.debug('123');
                
            }
       
         
        IdTOAccMap.put(opp.AccountID,acc);
       a ='';
        b=0;
        c=0;  
        }
        
    } System.debug('accList'+ accList);
    update IdTOAccMap.values();
 }        
       Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}