// Find all the Products having Description field containing 'a' in it.
public class Product {
    public static void ChcekFields(){
        try{ Product2[] PRO = [Select Name From Product2 Where Description LIKE '%a%' ];
            System.debug(PRO);
            Product2 pro1= new Product2();
            Product2 pro2 = new Product2();
        }
        catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}