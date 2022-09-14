public class Test6 {
    public static void method(){
        try{
        List<Contact> conList = new List<Contact> {
    new Contact(FirstName='Esha',LastName='Sharma',Department='Technology'),
        new Contact(FirstName='Subhi',LastName='Tyagi',Department='Technology'),
        new Contact(FirstName='Timsi',LastName='Tyagi',Department='Finance'),
        new Contact(FirstName='Prateek',LastName='Tyagi',Department='Education')};
            insert conList;
List<Contact> listToUpdate = new List<Contact>();
for(Contact con : conList) {
    if (con.Department == 'Finance') {
        con.Title = 'Financial analyst';
        listToUpdate.add(con);
    }
}
update listToUpdate;
    }catch(Exception e)
    { System.debug('Message:'+ e.getMessage());
     System.debug('Line Number'+ e.getLineNumber());
        
    }
}
    public static void method2() {
        List<Contact> con= new List<Contact>();
        con = [Select Name from Contact where FirstName='Timsi'];
        delete con;
            
    }
}