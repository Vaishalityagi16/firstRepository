//WAP to enter a startDate='06:07:55 2-jan-2016' & endDate='07:08:55 5-feb-2016' and display the difference between two dates in Years, months, days, hours, minutes,seconds.
public class DateDiff {
    public static void Difference(){
        try{
			Map <String, Integer> monthNames = new Map <String, Integer> {'jan'=>1, 'feb'=>2, 'mar'=>3, 'apr'=>4, 'may'=>5, 'jun'=>6, 'jul'=>7, 'aug'=>8, 'sep'=>9, 'oct'=>10, 'nov'=>11, 'dec'=>12};
            List<string> one='06:07:55 2-jan-2010'.split(' ');
            List<string> two='07:08:55 5-feb-2010'.split(' ');
            System.debug('one :' +one);
            System.debug('two :'+two);
            List<string> onetime=one[0].split(':');
            List<string> oneDate=one[1].split('-');
            System.debug('onetime :'+onetime);
             System.debug('oneDate:'+oneDate);
            time t1=time.newInstance(integer.valueOf(onetime[0]),integer.valueOf(onetime[1]), integer.valueOf(onetime[2]),0);
            Date d1=Date.newInstance(integer.valueof(oneDate[2]),monthNames.get(oneDate[1]), Integer.valueof(oneDate[0]));
            System.debug('t1 :'+t1);
            System.debug('d1 :'+d1);
            DateTime startDate=Datetime.newInstance(d1, t1);
            System.debug('startDate :'+startDate);
            List<string> twotime=two[0].split(':');
            List<string> twoDate=two[1].split('-');
            time t2=time.newInstance(integer.valueOf(twotime[0]),integer.valueOf(twotime[1]), integer.valueOf(twotime[2]),0);
       	    Date d2=Date.newInstance(integer.valueof(twoDate[2]),monthNames.get(twoDate[1]), Integer.valueof(twoDate[0]));
            Datetime endDate=Datetime.newInstance(d2,t2);
            System.debug('endDate :'+endDate);
            integer year=endDate.yearGmt()-startDate.yearGmt();
            integer month=endDate.month()-startDate.month();
            integer day=endDate.day()-startDate.day();
            integer hour=endDate.hour()-startDate.hour();
            integer minute=endDate.minute()-startDate.minute();
            integer sec=endDate.second()-startDate.second();
            System.debug('Year :'+year+'\n Month :'+month+' \n Day :'+day+' \n hour :'+hour+' \nminute :'+minute+'\nsecond'+sec);
        }
        catch(Exception e){
            System.debug('e :'+e.getMessage());
            System.debug('line number :'+e.getLineNumber());
        }
    }
}