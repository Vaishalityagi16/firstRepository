public class CreateClone {
    public static void createOppLineItem(){
        try{
           Opportunity opp = new Opportunity();
            opp.CloseDate =	Date.today();
            opp.Name='Offer';
            opp.StageName='Prospecting';
            insert opp;
            List<Pricebook2> pbList= [select Id from Pricebook2 where Name='Algo Pricebook'];
      List<PricebookEntry> pbeList = [Select Id, Product2Id, Pricebook2Id from PricebookEntry where Pricebook2Id IN :(pbList)];
            List<OpportunityLineItem> oppLI = new List<OpportunityLineItem>();
             for(PricebookEntry pbe : pbeList){
                OpportunityLineItem oppL = new OpportunityLineItem();
                oppL.OpportunityId = Opp.Id;
                oppL.PricebookEntryId = pbe.Id;
                oppL.Product2Id = pbe.Product2Id;
                oppL.Quantity= 2;
                oppL.UnitPrice = null;
                oppL.TotalPrice = 1000;
                oppLI.add(oppL);
                 System.debug(oppL);
             } 
            insert oppLI;
           Opportunity COpp = new Opportunity();
            COpp.Name = Opp.Name+' Clone';
            COpp.CloseDate = opp.CloseDate + 30;
            COpp.StageName = Opp.StageName;
            insert COpp;
 List<OpportunityLineItem> COppLI = new List<OpportunityLineItem>();
            for(OpportunityLineItem oppL : oppLI){
                OpportunityLineItem Oppclone = new OpportunityLineItem();
                Oppclone.OpportunityId = COpp.Id;
                Oppclone.PricebookEntryId = oppL.PricebookEntryId;
                Oppclone.Product2Id = oppL.Product2Id;
                Oppclone.UnitPrice = oppL.UnitPrice;
                Oppclone.Quantity = oppL.Quantity;
                Oppclone.TotalPrice = oppL.TotalPrice;
                COppLI.add(Oppclone);
            }
            insert COppLI;
} catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        } 
    }
}