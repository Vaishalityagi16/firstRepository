public class DeleteAccRecords {
    public static void Records() {
        try{
            List<Account> accList = [Select Name FrOM Account Where Name Like 'k%'];
            delete accList;
        } catch(Exception e) {
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}