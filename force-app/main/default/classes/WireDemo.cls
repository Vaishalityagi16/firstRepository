public class WireDemo {
    @AuraEnabled(cacheable=true)
    public static List<Contact> WireDemoMethod9(){
        try{
            List<Contact> conList = [Select Id,Name from Contact limit 5];
            System.debug(conList);
            return conList;
        }
        Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('LineNumber'+e.getLineNumber());
        }
        return null;
    }
}