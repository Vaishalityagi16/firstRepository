// Display the current salesforce user details 'Name', 'Number' & 'EmailId'

public class DisplayUser {
    public static void DisplayDetails() {
        try{ User userobj = [Select Name,Phone,Email from User where  Id = : UserInfo.getUserId()];
            System.debug(userobj.Name);
            System.debug(userobj.Phone);
            System.debug(userobj.Email);
           } 
        catch(Exception e) {
               System.debug('Message'+e.getMessage());
               System.debug('Line Number'+e.getLineNumber());
           }
    }

}