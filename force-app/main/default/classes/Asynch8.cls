public class Asynch8 implements Schedulable {
    public  void  execute(System.SchedulableContext bc){
           System.debug('Scheduled');
           Asynch8Class.AddClass();
        
    }
}