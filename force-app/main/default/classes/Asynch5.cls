public class Asynch5 implements Schedulable{
    public void execute(System.SchedulableContext bc){
        Asynch4.OppAdd();
    }

}
/*string s1= '00 00 00,06,12,18 * * ? 2022';
String jobId = System.Schedule('AddOpp', s1, new Asynch4Schedule());*/