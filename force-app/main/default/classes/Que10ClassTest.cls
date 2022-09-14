@isTest
private class Que10ClassTest {
    static testMethod void Que10Method(){
        try{ 
            Account acc = new Account();
            acc.Name= 'abc';
            acc.Number_of_LineItems__c = 0;
            insert acc;
            Opportunity opp = new Opportunity();
            opp.Name= 'xyz';
            opp.StageName= 'Prospecting';
            opp.CloseDate= date.today();
            opp.AccountId= acc.Id;
            insert opp;
            
            List<Product2> p= new List<Product2>();
            for(Integer i=0; i<5; i++){
                Product2 pr = new Product2();
                pr.Name= 'p'+String.valueOf(i);
                pr.No_Of_Products_sold__c = 0;
                p.add(pr);
            }
            insert p;
            
            Pricebook2 pb= new Pricebook2();
            pb.Id = Test.getStandardPricebookId();
            pb.isActive= True;    
            update pb;
                
            List<PricebookEntry> pbeList= new List<PricebookEntry>();   
            for(Product2 prod: p){
                PricebookEntry pbe = new PricebookEntry();
                pbe.Pricebook2Id = pb.Id;
                pbe.Product2Id = prod.Id;
                pbe.UnitPrice= 1;
                pbe.IsActive = True;
                pbeList.add(pbe);
            } 
           insert pbeList;
            
            Pricebook2 newpb=  new Pricebook2();
            newpb.Name= 'xyz';
            newpb.IsActive= True;
            insert newpb;
            
            List<PricebookEntry> pbeL= new List<PricebookEntry>();
            for(Product2 prod: p){
                PricebookEntry pbe = new PricebookEntry();
                pbe.Pricebook2Id = newpb.Id;
                pbe.Product2Id = prod.Id;
                pbe.UnitPrice= 1;
                pbe.IsActive = True;
            	pbeL.add(pbe);
            } 
           insert pbeL;
            
           
            List<OpportunityLineItem> oli = new List<OpportunityLineItem>();
            for(PricebookEntry pbe: pbeL){
                OpportunityLineItem ol = new OpportunityLineItem();
                ol.PricebookEntryId = pbe.Id;
                ol.Product2Id = pbe.Product2Id;
                ol.OpportunityId = opp.Id;
                ol.UnitPrice= 100;
                ol.Quantity =2;
                oli.add(ol);
            } 
            
            Test.startTest();
            insert oli;
            update oli;
            delete oli;
            Test.stopTest();
            
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
   
        
}