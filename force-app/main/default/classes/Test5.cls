public class Test5 {
    public static void method() {
        Account acct = [Select Name from Account where Name Like 'Honey%' ALL ROWS];
        undelete acct;
        
    }
}