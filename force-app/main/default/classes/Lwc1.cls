public class Lwc1 {
@auraenabled 
    public static String Lwc1Method(String AccName,integer NoOfEmployees, String Rating, String Description,String BillingCity){
        try{
            Account acc=  new Account();
        acc.Name = AccName;
        acc.NumberOfEmployees = NoOfEmployees;
        acc.Rating = Rating;
        acc.Description = Description;
        acc.BillingCity= BillingCity;
        insert acc;
            return 'Success';
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
            return 'Line Number';
        }
    }
}