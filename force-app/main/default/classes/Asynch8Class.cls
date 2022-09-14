public class Asynch8Class {
    public static void AddClass(){
        try{  String s1 = '00 00 * * * ? 2022';
        String jobId1 = System.Schedule('Asynch0', s1, new Asynch8());
        
        String s2= '00 05 * * * ? 2022';
        String jobId2= System.Schedule('Asynch1', s2, new Asynch8());
            
             String s3= '00 10 * * * ? 2022';
        String jobId3= System.Schedule('Asynch2', s3, new Asynch8());
            
             String s4= '00 15 * * * ? 2022';
        String jobId4= System.Schedule('Asynch3', s4, new Asynch8());
            
             String s5= '00 20 * * * ? 2022';
        String jobId5= System.Schedule('Asynch4', s5, new Asynch8());
            
             String s6= '00 25 * * * ? 2022';
        String jobId6= System.Schedule('Asynch5', s6, new Asynch8());
            
             String s7= '00 30 * * * ? 2022';
        String jobId7= System.Schedule('Asynch6', s7, new Asynch8());
            
             String s8= '00 35 * * * ? 2022';
        String jobId8= System.Schedule('Asynch7', s8, new Asynch8());
            
             String s9= '00 40 * * * ? 2022';
        String jobId9 = System.Schedule('Asynch8', s9, new Asynch8());
            
             String s10= '00 45 * * * ? 2022';
        String jobId10 = System.Schedule('Asynch9', s10, new Asynch8());
            
             String s11= '00 50 * * * ? 2022';
        String jobId11 = System.Schedule('Asynch10', s11, new Asynch8());
            
             String s12= '00 55 * * * ? 2022';
        String jobId12 = System.Schedule('Asynch11', s12, new Asynch8());
        }Catch(Exception e){
            System.debug('Message'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}