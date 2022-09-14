public class Asynch4Schedule implements Schedulable {
    public void execute(System.SchedulableContext bc){
        System.debug('Scheduled');
        Asynch4.OppAdd();
    }

}
/*string s1= '00 00 00 * * ? 2022';
String jobId = System.Schedule('AddOpp', s1, new Asynch4Schedule());*/