public class QueueClass implements Queueable,Database.AllowsCallouts{
    public List<Account> accList;
    public QueueClass(List<Account> objList) {
        this.accList = objList;
    }
    public void execute(QueueableContext Context) {
        System.debug('Inside Queueable class:'+accList);
        TestGetData.getDataMethod(accList);
    }
}