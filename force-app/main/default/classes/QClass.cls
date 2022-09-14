public class QClass implements Queueable {
    public void execute(QueueableContext qc){
        Account acc = new Account();
        acc.Name = 'cd';
        insert acc;
    }
}