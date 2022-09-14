public class Test4 {
    public static void method() {
        Account acct= [Select Name from Account where Name='Honey'];
        acct.Website = 'http://www.Sown,io';
        Update acct;
    }
}