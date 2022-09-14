public class map1 {
    public static void method(){
        Map<Id,Account> AccountMap = new Map<id,Account>([select id,Name,(select id,Name from Contacts),(Select id,Name from opportunities) from Account]);
        for(Id acc:AccountMap.keyset()){
            System.debug('Contact Names of Account == '+AccountMap.get(acc).Name +' ==> '+AccountMap.get(acc).Contacts);
           
            System.debug('Opportunities Names of Account == '+AccountMap.get(acc).Name + ' ==>'+AccountMap.get(acc).opportunities);
           
        }    
    }
}