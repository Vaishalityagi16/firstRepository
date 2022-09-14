public class CreatePBE {
    public static void NewPB(List<Product2>Pro){
   try { 
        Pricebook2 pb =  [Select Id from Pricebook2 Where isStandard= true];
        List<PricebookEntry> pbList= new List<PricebookEntry>();
       for(Product2 pr: Pro){
            PricebookEntry pbe= new PricebookEntry();
            pbe.Pricebook2Id = pb.Id;
            pbe.Product2Id = pr.Id;
            pbe.UnitPrice= 1;
            pbe.IsActive = True;
            pbList.add(pbe); 
       }
       insert pbList;
       
        } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+ e.getLineNumber());
        }
}
}