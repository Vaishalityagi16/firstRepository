public class CopyAddress {
    public static void ContactAdd(List<Contact>conList){
        try{ 
List<Account> accList = [Select Id,BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet From Account];
            List<Contact> contList= new List<Contact>();
            for(Account acc : accList){
            for(Contact con: conList){
                if(con.COPY_ADDRESS_FROM_ACCOUNT__c==true && acc.Id==con.AccountId){
                    con.MailingCity= acc.BillingCity;
                    con.MailingState = acc.BillingState;
                    con.MailingCountry= acc.BillingCountry;
                    con.MailingPostalCode = acc.BillingPostalCode;
                    con.MailingStreet= acc.BillingStreet;
                    contList.add(con);
                }
            }
            }
            
            
        } Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }

}