public class ContactProduct {
    public static void ContactMethod(List<Contact> cList){
        try{
            //List<CompaniesProduct__c> proList = [Select Id,Contact__c From CompaniesProduct__c where Contact__c!=null];
            //List<Contact> conList = [Select Id,LastName,ProductName__c from contact];
              List<Contact> conList = new List<Contact>();
              Contact con = new Contact();
            con.FirstName = 'LCon';
            con.LastName = 'P';
            con.ProductName__c = 'p1,p2,p3';
            ConList.add(con);
            insert conList;
            List<CompaniesProduct__c> prList = new List<CompaniesProduct__c>();
            for(Contact c: cList){
                
            }
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
    }
}