//Print the Account Names in Alphabetical accending order.
public class DisplayASC {
    public static void accendingOrder() {
        try {
            Account[] acc = [Select Name From Account ORDER BY Name LIMIT 10 ];
            System.debug(acc);
        }
        catch(Exception e) {
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+ e.getLineNumber());
        }
    }

}