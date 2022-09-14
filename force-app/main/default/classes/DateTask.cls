public class DateTask {
    public static void DateTaskMethod(){
        Date d = date.today();
        Integer MonthName = d.month();
        System.debug(MonthName);
        String name = '';
        String Dt='';
        Map<Integer,String> M = new Map<Integer,String>{1=>'Jan',2=>'Feb',3=>'March',4=>'April',5=>'May',6=>'June',
           7=>'July',8=>'Aug',9=>'Sept',10=>'Oct',11=>'Nov',12=>'Dec'};
           System.debug(M);
        for(Integer i:M.keySet()){
            System.debug(i);
            name = M.get(i);
            System.debug(name);
            if(i==MonthName){
                Dt = name+' '+d.day()+','+d.year();
                System.debug(Dt);
                break;
            }
        }
      
    }
}