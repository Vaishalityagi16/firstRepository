// Delete all  contacts belonging to Accounts Name FIELD having 'A' in them.
public class CheckRecords {
    public static void DeleteRecords(){
        try {
            List<Contact> conList= [Select  Name From Contact Where LastName LIKE '%a%'LIMIT 10];
            System.debug(conList);
            delete conList;
            
        } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}