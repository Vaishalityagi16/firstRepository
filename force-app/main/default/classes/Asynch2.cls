global class Asynch2 implements Schedulable {
    global void execute(System.SchedulableContext bc){
        Database.executeBatch(new DeleteAccBatch(), 5);
        
    }
}