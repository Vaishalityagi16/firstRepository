public class Lwc3Class {
@auraenabled
    public static List<Opportunity> Lwc3Method(){
         List<Opportunity> oppList = [Select Id,Name,StageName,CloseDate From Opportunity];
        return oppList;
 }
    @auraenabled
    public static date Lwc3OpMethod(String i){
        Opportunity opp = [Select Id,Name,StageName,CloseDate From Opportunity Where Id=:i];
        date d = opp.CloseDate;
        return d;
    }
    @auraenabled
    public static String Lwc3UpMethod(String r, String d){
        Opportunity opp = [Select Id,Name,CloseDate,StageName From Opportunity Where Id=:r];
        opp.CloseDate = Date.valueOf(d);
        update opp;
        return 'Successful';
    }
}