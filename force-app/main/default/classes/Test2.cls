public class Test2 {
    public static void FirstTest() {
     sObject sobj1 = new Account(Name='Trailhead');
sObject sobj2 = new Contact (LastName='Workbook 1');
        System.debug(sobj1);
         System.debug(sobj2);
        insert sobj1;
        insert sobj2;
    }
}