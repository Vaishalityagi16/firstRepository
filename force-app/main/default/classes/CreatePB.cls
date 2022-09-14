//Create New Price book 'Algo Pricebook' and 10 Products with Prices in the Pricebook
public class CreatePB {
    public static void CreateNewPB(){
        try{
            Pricebook2 Pbook= new Pricebook2(
           Name = 'Algo Pricebook',
                Description = 'This is the Price Book description.',
               IsActive = True );
            System.debug(Pbook);
            insert Pbook;
            List<Product2> ProList = new List<Product2>();
            for(integer i=0; i<5; i++){
            Product2 prObj= new Product2();
            prObj.Name = 'ABC'+i;
            prObj.ProductCode = '0005';
            prObj.IsActive= true; 
                proList.add(prObj);
            }
        System.debug(proList);
        insert proList;
            Pricebook2 standardPriceBook = [Select Id From Pricebook2 Where isStandard = true];
            List<PricebookEntry> standardpbeList= new List<PricebookEntry>();
            for(Product2 prObj : proList) {
                PricebookEntry  pb = new PricebookEntry();
                pb.Pricebook2Id = standardPriceBook.Id;
                pb.Product2Id = prObj.Id;
                pb.UnitPrice = 600.00 ; 
                standardpbeList.add(pb); }
            insert standardpbeList;
            List<PricebookEntry> pbList= new List<PricebookEntry>();
            for(Product2 prObj : proList) {
                PricebookEntry  pb = new PricebookEntry();
                pb.Pricebook2Id = Pbook.Id;
                pb.Product2Id = prObj.Id;
                pb.UnitPrice = 600.00 ; 
                pbList.add(pb); }
            insert pbList;
 } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}