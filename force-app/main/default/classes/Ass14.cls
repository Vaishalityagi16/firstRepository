public class Ass14 implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator( 'Select Id,Name From Account limit 6');
    }
    public void execute(Database.BatchableContext bc , List<Account> accList){
        List<Trailhead_Data__c> Ilist = new List<Trailhead_Data__c>();
        for(Integer i = 0;i< 9999;i++){
            Trailhead_Data__c t = new Trailhead_Data__c();
            t.Name = 'dfgdf';
            t.url__c = 'https://trailblazer.me/id/vtyagi63';
            Ilist.add(t);
        }
        insert Ilist;
}
    public void finish(Database.BatchableContext bc){
        System.debug('insert finish function');
    }
}