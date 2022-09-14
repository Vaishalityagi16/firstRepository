public class Asynch10 {
    public static void AsynchMethod(){
        try{ List<cronTrigger> jobList = [Select Id, cronJobDetail.Name, cronJobDetail.JobType 
                                          From cronTrigger Where cronJobDetail.JobType = '7']; 
            for(cronTrigger ct: jobList){
             System.abortJob(ct.Id);
            }
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}