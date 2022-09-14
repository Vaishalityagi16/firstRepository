// Print any Integer number in reverse order. Ex: 789234  => 432987
public class Reverse {
    public static void ReverseNumber(Integer n) {
        try{ Integer rem; Integer reverseN=0;
            while(n!=0) {
                rem = Math.Mod(n,10) ;
                reverseN = (reverseN*10)+ rem;
                n=n/10;
            }
            System.debug(reverseN);
            }  
           catch(Exception e) {
               System.debug('Message'+ e.getMessage()); 
               System.debug('Line Number'+ e.getLineNumber());
           }
    }
}