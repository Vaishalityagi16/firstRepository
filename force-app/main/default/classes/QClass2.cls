public class QClass2 implements Queueable{
    List<Account> accList = new List<Account>();
    public QClass2(List<Account> templist){
         this.accList = templist;
    }
   
    public void execute (QueueableContext qc){
        for(Account acc: accList){
            System.debug(acc);
        }
    }

}