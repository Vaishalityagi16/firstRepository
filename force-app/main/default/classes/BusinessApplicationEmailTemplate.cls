public class BusinessApplicationEmailTemplate {
    public static void EmailTemplate(){
        Favorite__c ba = [Select Id, TestBusinessApplication__r.Application__c,TestBusinessApplication__r.Email__c From Favorite__c where Id='a025j00000Cti0KAAR'];
 EmailTemplate et=[Select Id,Subject, Body from EmailTemplate where name ='CognizantTemplate'];
List<Messaging.SingleEmailMessage> Emailmsg = new List<Messaging.SingleEmailMessage>();
list<String> email= new list<String>();
email.add(ba.TestBusinessApplication__r.Email__c);
Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
msg.setTemplateId(et.Id);
msg.setWhatId(ba.Id);
msg.setTargetObjectId(Userinfo.getUserId());
msg.setTreatTargetObjectAsRecipient(false);        
msg.setToAddresses(email);
msg.setSaveAsActivity(false);
Emailmsg.add(msg);
Messaging.sendEmail(Emailmsg);





    }
}