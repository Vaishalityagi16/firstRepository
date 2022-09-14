// Manually add 2 (jpg and PDF) attachments under Accounts related list. WAP to copy the attachments to Contact associated(parent child) with Account. 
public class Copypdf {
    public static void CopyAttachments(){
        try { 
List<Account> accList = [Select Id,Name From Account];
            List<Contact> conList = [Select Id,LastName,AccountId From Contact Where AccountId IN:accList];
            List<Attachment> attList = [Select Name,Body,ParentId From Attachment Where ParentId IN: accList];
           List<Attachment> att = new List<Attachment>();
                        for(Contact conObj: conList){
                            for(Attachment attobj: attList){
                                if(attobj.ParentId== conObj.AccountId) {
                                Attachment newObj= new Attachment();
                                newObj.Name= attObj.Name;
                                newObj.Body= attObj.Body;
                                newObj.ParentId = conObj.Id;
                                att.add(newObj); }
                        } 
                        } insert att;
        }
             catch(Exception e) {
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}