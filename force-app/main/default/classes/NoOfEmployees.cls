public class NoOfEmployees {
    public static void CreateContacts(List<Account>accList){
        try{
List<Account> acc = [Select Id,Name,NumberOfEmployees From Account Where Id In:(accList)];
            List<Contact> conList = new List<Contact>(); 
            for(Account ac: accList){
                    if(ac.NumberOfEmployees>0){
                        for(integer i =0; i<ac.NumberOfEmployees; i++){
                            Contact con = new Contact();
                            con.FirstName = ac.Name;
                            con.LastName= 'Tyagi';
                            con.AccountId = ac.Id;
                            conList.add(con);
                        }
                    }
            } insert conList;
        }
        catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
        
    } 
 // Delete Contacts.
    public Static void UpdateContacts(List<Account>accList){
        try{ 
List<Account> acc = [Select Id,Name,NumberOfEmployees, (Select AccountId From Contacts) From Account Where Id IN:(accList)];
            List<Contact> conList = new List<Contact>();
            List<Contact> Delcon= new List<Contact>();
            for(Account ac: accList) {
               System.debug(ac.NumberOfEmployees +'and' + ac.Contacts.size());
                    if(ac.NumberOfEmployees>ac.Contacts.size()){
                        integer diff= ac.NumberOfEmployees - ac.Contacts.size();
                         for(integer i =0; i<diff; i++){
                            Contact con = new Contact();
                            con.FirstName = ac.Name;
                            con.LastName= 'Sharma';
                            con.AccountId = ac.Id;
                            conList.add(con);
                        }
                    } else if (ac.NumberOfEmployees<ac.Contacts.size()){
                        integer diff= ac.Contacts.size() - ac.NumberOfEmployees;
                        for(integer i=0; i<diff;i++){
                            Delcon.add(ac.contacts[i]);
                        }
                    }
                    
                    
                }insert conList;
                 Delete Delcon;
            
        } catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    } 


}