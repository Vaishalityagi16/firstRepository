public class Test7 {
    public static void method() {
        Contact Josh = new Contact(FirstName='josh', LastName='Kaplan', Department='Finance');
        insert Josh;
        Josh.description='Josh\'s record has been updated by the upsert operation.';
        Contact Kathy= new Contact(FirstName='Kathy',LastName='Brown', Department='Technology');
        List<Contact> Con= new List<Contact>{Josh,Kathy};
            upsert con;
    }
    public static void method2(){
        Contact jane = new Contact(FirstName='Jane',
                         LastName='Smith',
                         Email='jane.smith@example.com',
                         Description='Contact of the day');
insert jane;
Contact jane2 = new Contact(FirstName='Jane',
                         LastName='Smith',  
                         Email='jane.smith@example.com',
                         Description='Prefers to be contacted by email.');
upsert jane2 Contact.fields.Email;
System.assertEquals('Prefers to be contacted by email.',
                   [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);
    }
}