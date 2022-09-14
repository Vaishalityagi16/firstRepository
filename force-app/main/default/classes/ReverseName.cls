//Print the Account Name in reverse order Ex: Name='Company' => 'ynapmoC'
public class ReverseName {
    public static void Reverse(String AccName) {
        try{ integer length = AccName.length();
               String reverse='';
            for(integer i=length-1; i>=0; i--){
                reverse = reverse+AccName.subString(i,i+1);
            } System.debug(reverse);
                    }
        catch(Exception e){
               System.debug('Message'+ e.getMessage());
               System.debug('Line Number'+ e.getLineNumber());
           } 
           }
}