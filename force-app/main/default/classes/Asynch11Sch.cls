public class Asynch11Sch implements Schedulable {
    public void execute (System.SchedulableContext bc){
        Database.executeBatch(new Asynch11Batch(), 5);
    }
}
/*String S= '00 00 00 * * ? 2022';
String job = System.Schedule('Asynch11Batch', s, new Asynch11Sch());*/