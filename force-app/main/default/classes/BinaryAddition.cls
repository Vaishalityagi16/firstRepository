//WAP to add two binary nos. '100101' & '0101101' which are in text format. 
public class BinaryAddition {
    public static void AdditionMethod(string str1, string str2){
        try{
            
            integer b1=integer.valueOf(str1);  //convert 1st binary string into integer
            decimal sum1=0,sum2=0, finalResult; //two variables for calculating sum of two binary number
            System.debug('b1 :'+b1); //Debugging integer value
            integer b2=integer.valueOf(str2);    //convert 2nd binary string
            System.debug('b2 :'+b2);    //debugging 2nd
            for(integer i=0;i<=str1.length()-1;i++){ //loop for iterating over every single digit and multiply it by 2 to convert it from binary to decimal and stored it into the sum variable for 1st binary value.
                integer r=math.mod(b1,10);
                System.debug('r :'+r);
                b1=b1/10;
                sum1= sum1+ r*(math.pow(2,i));
                System.debug('sum :'+sum1);
            }
        //Then did the same things for 2nd binary variable
        for(integer i=0;i<=str2.length()-1;i++){
            integer r=math.mod(b2,10);
            System.debug('r :'+r);
            b2=b2/10;
            sum2+= r*(math.pow(2,i));
            System.debug('sum :'+sum2);
           
        }
            integer sum=(integer)(sum1+sum2);//to convert decimal to integer
            System.debug('Final Sum of both the binary string :'+sum);//Final Sum of both the binary string
            string st='';
            while(sum>0){
                st+=string.valueOf(math.mod(sum,2));
                sum=sum/2;
            }
       		 System.debug('Sum of binary string :'+st.reverse());
        }catch(Exception e){
            System.debug('error :'+e.getMessage());
            System.debug('line number :'+e.getLineNumber());
        }
    }
}