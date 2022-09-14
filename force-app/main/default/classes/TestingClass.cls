public class TestingClass {
    @InvocableMethod (label='Create Contacts')
    public static void TestingClass(List<Id>accId){
        List<Contact> conList = new List<Contact>();
        Account acc = [Select Id,Name,NumberOfEmployees From Account Where Id=:accId];
        for(integer i=0; i<acc.NumberOfEmployees;i++){
            Contact con = new Contact();
            con.LastName = acc.Name+i;
            con.AccountId= acc.Id;
            conList.add(con);
        }
        insert conList;
    } 
}