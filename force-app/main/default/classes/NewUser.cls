// Write a program in Salesforce to create another System admin user in your dev org with your email. Register the user manually.
public class NewUser {
    public static void CreateUser(){
        try { 
            Profile PrID = [Select Id From Profile Where Name='System Administrator' LIMIT 1 ];
             User newUser = new User();
                 newUser.FirstName='Subhi';
                     newUser.LastName = 'Tyagi'; 
                 newUser.Email='example@gmail.com';
                newUser.UserName = 'Subhityagia@gmail.com';
             newUser.Alias='SubT';
             newUser.ProfileId=PrId.Id;
             newUser.TimeZoneSidKey='GMT';
            newUser.EmailEncodingKey='UTF-8';
             newUser.LocaleSidKey='en_us';
             newUser.LanguageLocaleKey='en_us';
             System.debug(newUser);
            insert newUser;
            } catch(Exception e){
                System.debug('Message'+e.getMessage());
                System.debug('Line Number'+e.getLineNumber());
            }
    }
}