//Print the fibonacci series. 1, 1, 2, 3, 5, 8, 13..
public class FibonacciSeries {
    public static void FibonacciMethod(integer n1, integer n2, integer count){
        try{ integer n3;
            System.debug(n1);
            System.debug(n2);
            for(integer i=2; i<=count; i++) {
                n3=n1+n2;
                System.debug(n3);
                n1=n2;
                n2=n3;
            }
            
           }catch(Exception e){
               System.debug('Message'+e.getMessage());
               System.debug('Line Number'+ e.getLineNumber());
           }
    }
}