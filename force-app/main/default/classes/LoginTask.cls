public class LoginTask {
    @AuraEnabled
    public static String LoginMethod(String UserName,String Password){
        try{
            list<UserInformation__c> user = [Select Id,Email__c,UserName__C,Password__c From UserInformation__c Where UserName__c=:UserName Limit 1];
            //System.debug(user.Email__c);
            System.debug(UserName);
            System.debug(Password);
            //system.debug(user.Password__c);
            
            if(user.size()>0){
            if(user[0].Password__c==Password){
                System.debug(Password);
                system.debug('1');
                return(user[0].Id);
            }
            
            else{
                system.debug('1');
                return 'Password did not match';
            }
            }
            return 'User not exist';
        }
        Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
            return 'Catch Error';
        }
    }
        @AuraEnabled
    public static Integer sendEmail(String UserName){
        try{
        UserInformation__c user = [Select Id,FirstName__c,LastName__c,Email__c,UserName__C From UserInformation__c Where UserName__c=:UserName Limit 1];
        Integer rNo = Integer.valueof((Math.random() * 1000000));
         System.debug(UserName);
        System.debug('=========>'+rNo);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        sendTo.add(user.Email__c);
        mail.setToAddresses(sendTo);
        mail.setTargetObjectId(userInfo.getUserId());
        mail.setSaveAsActivity(false);
        mail.setSenderDisplayName('Cloud Analogy');
        mail.setSubject('Reset Password');
        String Body= 'Hi'+' '+User.FirstName__c+' '+User.LastName__c+' '+'your otp to reset password is:' +rNo+'<br/><br/>';
        mail.setHtmlBody(Body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail}); 
        return (rNo);
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
            return (123);
        }
        
    }
     @AuraEnabled
    public static String UpdatePassword(String UserName, String Password){
    UserInformation__c user = [Select Id,UserName__C,Password__c From UserInformation__c Where UserName__c=:UserName Limit 1];
        if(user.Password__c!=Password){
            User.Password__c = Password;
            update user;
        }
        System.debug('New Password'+ User.Password__c);
        return 'New Password Updated';
    }
     @AuraEnabled
    public static String insertRecord(UserInformation__c UserInformation){
            
            System.debug(UserInformation);
        insert UserInformation;
                String var= UserInformation.Id;

                System.debug(UserInformation.Id);
             return var ;
    }
}