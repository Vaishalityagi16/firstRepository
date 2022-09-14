@isTest
private class ScriptSheetTest {
    static testMethod void ScriptMethod(){
        try{ 
            
                   Product2 proObj = new Product2();
            proObj.Name= 'Pen';
            proObj.IsActive= True;
            insert proObj;
            
            Pricebook2 pbs = new Pricebook2();
           
            pbs.Id= Test.getStandardPricebookId();
            pbs.IsActive= True;
            update pbs;
            
            PricebookEntry pbe = new PricebookEntry();
            pbe.Product2Id = proObj.Id;
            pbe.Pricebook2Id= pbs.Id;
            pbe.IsActive= True;
            pbe.UnitPrice= 100;
            
            insert pbe;
            
            Pricebook2 pb= new Pricebook2();
            pb.Name= 'Algo Pricebook';
            pb.isActive= True;
            
            insert pb;
             PricebookEntry pbe1 = new PricebookEntry();
            pbe1.Product2Id = proObj.Id;
            pbe1.Pricebook2Id= pb.Id;
            pbe1.IsActive= True;
            pbe1.UnitPrice= 100;
            insert pbe1;
            
            Opportunity oppObj= new Opportunity();
           oppObj.Name= 'Offer';
            oppObj.StageName= 'Qualification';
            oppObj.CloseDate= date.today();
           // oppObj.Pricebook2Id= pb.Id;
            
            insert oppObj;
            
             OpportunityLineItem opl = new OpportunityLineItem();
            Opl.PricebookEntryId = pbe1.Id;
            opl.Product2Id= proObj.Id;
            opl.OpportunityId= oppObj.Id;
            opl.UnitPrice= null;
            opl.TotalPrice= 500;
            opl.Quantity= 2;
            
            insert opl;
            
            Test.startTest();
           
            
                       
            CreateClone.createOppLineItem();
                
            Test.stopTest();
           }Catch(Exception e){
               System.debug('Message'+e.getMessage());
               System.debug('Line Number'+e.getLineNumber());
           }
    } 
}