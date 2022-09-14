public class OppAdd {
@auraenabled
    public static String OppAddMethod(String OppName, String StageName, date CloseDate){
        try{
            Opportunity opp = new Opportunity();
            opp.Name= OppName;
            opp.StageName= StageName;
            opp.CloseDate= CloseDate;
            insert opp;
            return 'Success';
        }catch(Exception e){
            
            System.debug(e.getLineNumber()+'======>'+e.getMessage());
            return e.getLineNumber()+'======>'+e.getMessage();
        }
    }
}