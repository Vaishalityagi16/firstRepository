// QUE 12.....
public class UdeleteCon {
    public static void DeleteCon(List<Contact>conList){
        try{ List<Contact> cList= [Select Id,LastName From Contact Where ID IN:conList];
            List<Contact> ConL = new List<Contact>();
            if(cList.size()>0){
                for(Contact con: cList){
                    con.LastName= con.LastName+' '+'undeleted Contact';
                    conL.add(con);
                }
            }update conL;
            List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
            for(Contact con: conList){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    List<String> sendTo = new List<String>();
                    sendTo.add(userinfo.getUserEmail());
                    mail.setToAddresses(sendTo);
                    mail.setReplyTo('vaishali.tyagi@cloudanalogy.com');
                    mail.setSenderDisplayName('Cloud Analogy');
                    mail.setSubject('About Contact');
                    String Body= 'Hi'+' '+con.FirstName+' '+ con.LastName+'<br/><br/>'+ 'Contact Undeleted';
                    mail.sethtmlbody(Body);
                    mailList.add(mail);
                    Messaging.sendEmail(mailList);
                }
            
        }catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}