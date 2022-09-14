//Create 20 new Accounts Records in salesforce with at least 5  fields filled.
public class AccountRecords {
    public static void FieldRecords(integer count){
        try{  List <Account> accL= new List<Account>();
            for(integer i=1; i<=count; i++) {
                Account acc= new Account();
                acc.Name= 'Kashish';
                acc.Phone ='1234568984';
                acc.website='https://www.sown.io';
                acc.Description='You have to fill these details.';
                acc.AccountNumber ='000977372';
                accL.add(acc);
                System.debug(accL);
            }insert accL;
           
           }
        catch(Exception e){
               System.debug('Message'+e.getMessage());
               System.debug('Line Number'+ e.getLineNumber());
           }
    }
}