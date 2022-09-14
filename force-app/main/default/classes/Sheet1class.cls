/* Write a script to get all Account those are associated with opportunity and put the attachment from account to their opportunity. If the account does not have attachment put opportunity close lost otherwise close won."*/
public class Sheet1class {
    public Static void NewMethod(){
        try{ 
List<Account> accList = [Select Id,Name From Account];
List<Opportunity> oppList= [Select Id,Name,AccountId,CloseDate,StageName From Opportunity Where AccountId In:accList];
List<Attachment>attList= [Select Id,Name,Body,ParentId From Attachment Where ParentId In: accList];
List<Attachment> atL= New List<Attachment>();
            List<Opportunity> oppL = new List<Opportunity>();
            for(Opportunity opp: oppList){
                if(attList.size()>0){
                    for(Attachment att: attList){
                        if(att.ParentId==opp.AccountId){
                            Attachment at= new Attachment();
                            at.Name = att.Name;
                            at.Body = att.Body;
                            at.ParentId = opp.Id;
                            opp.StageName = 'Closed Won';
                            atL.add(at);
                            oppL.add(opp);
                        } else if(att.ParentId!=opp.AccountId){
                            opp.StageName= 'Closed Lost';
                            oppL.add(opp);
                        }
                    }
                }  
            } insert atL;
            update oppL;
                
            }
            Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}