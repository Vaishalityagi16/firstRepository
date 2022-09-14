//Create a apex class with a function that show  a message "Welcome to Salesforce "
public class DisplayMessage {
    public static void MessageName(String Message){
        try{
            Account acc = new Account();
            Opportunity opp = new Opportunity();
            System.debug(Message);
        }
        catch(Exception e) { 
            System.debug('Message'+ e.getMessage());
            System.debug('Line Number'+ e.getLineNumber());
        }
    }
}