// Manually add 2 (jpg and PDF) attachments under Accounts related list. WAP to copy the attachments to opp. associated(parent child) with Account. 
public class Question {
    public static void NewQue(){
        try { 
            List<Account> acc = [Select Id,Name From Account];
            List<Opportunity>oppList= [Select Id, AccountId,CloseDate,Name,StageName From Opportunity Where AccountId IN:acc]; 
            List<Attachment> attList =[Select Id,Name,Body, ParentId From Attachment where ParentId In:acc];
            List<Attachment> atL = new List<Attachment>();
            if(oppList.size()>0){
                        for(Opportunity opp: oppList){
                            if(attList.Size()>0){
                                for(Attachment att: attList){
                                    if(att.ParentId==opp.AccountId){
                                        Attachment attL = new Attachment(); 
                                        attL.Name = att.Name;
                                        attL.Body= att.Body;
                                        attL.ParentId = opp.Id;
                                        opp.StageName='Closed Won';
                                        atL.add(attL);
                                        }
                                    else if(opp.AccountId!=att.ParentId){
                                        opp.StageName='Closed Lost';
                                        oppList.add(opp);
                                    }
                                }
                            }
                            System.debug(atL);
                              insert atL;
                           update oppList; 
                        }
               
            } 
              }
        catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
}
}