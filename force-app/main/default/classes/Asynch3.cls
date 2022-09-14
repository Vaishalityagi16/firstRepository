public class Asynch3{
    public static void DeleteMethod(){
        try{
            List<CronTrigger> JobDetail= [Select Id, cronJobDetail.Name From CronTrigger Where cronJobDetail.Name = 'MYjOB'];
            for(CronTrigger cj: JobDetail){
                System.abortJob(cj.Id);
            }
        }catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }

}