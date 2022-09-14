// Que7
public class Que7UpdateField {
    public static void PrSoldField(List<Opportunity>oppList){
        try{
List<OpportunityLineItem> OliList = [Select Product2Id, Quantity From OpportunityLineItem Where OpportunityId In:oppList And Opportunity.StageName = 'Closed Won'];
            List<Product2> proList = [Select Id,No_Of_Products_sold__c From Product2];

 
                        for(OpportunityLineItem opLI: OliList){
                            for(Product2 pro: proList){
                            if(opLI.Product2ID==pro.Id){
                                if(pro.No_Of_Products_sold__c==null){
                               pro.No_Of_Products_sold__c = opLI.Quantity;
                                } else {
                                    pro.No_Of_Products_sold__c += opLI.Quantity;
                                }
                        } 
                        }
                        } update proList;
        }catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}