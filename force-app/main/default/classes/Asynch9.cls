public class Asynch9 {
    public static void Asynch9Method(){
        try{ for(integer i=0; i<12; i++){
            String s1 = '00 '+String.valueOf(i*5)+' * * * ? 2022';
            String s2 = System.Schedule('Asynch'+i,s1, new Asynch8());
        }
            
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}
/* List<cronTrigger> jobList = [Select Id, cronJobDetail.Name From cronTrigger Where cronjobDetail.jobType= '7'];
for(cronTrigger cr: jobList){
    System.abortJob(cr.Id);
}*/