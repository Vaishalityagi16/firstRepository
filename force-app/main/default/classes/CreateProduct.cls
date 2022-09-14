//Create 10 Products with different Product Names, Description & Family 
public class CreateProduct {
    public static void DisplayProduct(integer count){
        try{
            List<Product2> PrList= new List<Product2>();
            for(integer i=0; i<count; i++){
                Product2 PRO= new Product2();
                PRO.Name='Name'+i;
                PRO.Description='Description'+i;
                PRO.Family= 'None';
                PrList.add(PRO);
               
            }  System.debug(prList);
            insert PrList;
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
            
        }
    }
}