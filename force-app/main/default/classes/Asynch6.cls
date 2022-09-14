public class Asynch6 {
    public static void DeleteMethod(){
        try{ List<cronTrigger> jobList = [Select Id,cronJobDetail.Name From cronTrigger Where cronJobDetail.Name= 'AddOpp1'];
            for(cronTrigger job:  jobList){
                System.abortJob(job.Id);
            }
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}