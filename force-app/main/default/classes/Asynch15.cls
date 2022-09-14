public class Asynch15 implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Name,Status__c,Trailhead_Data__c From Modules__c Where Status__c =\'Completed\'');
    }
    public void execute(Database.BatchableContext bc, List<Modules__c> mList){
        
        List<Trailhead_Data__c> tList= [Select Id, Module_Name__c From Trailhead_Data__c];
        System.debug(mList);
        System.debug(tList);
        for(Modules__c m: mList){
            for(Trailhead_Data__c t: tList){
                if(m.Trailhead_Data__c==t.Id){
                     if(t.Module_Name__c == Null){
                        t.Module_Name__c = m.Name;
                    }
                    else{
                        t.Module_Name__c += m.Name;
                    }
                    
                }
            }
        } 
        update tList;
        
    } 
    public void finish(Database.BatchableContext bc){
        System.debug('Finish Function');
    }
    
}