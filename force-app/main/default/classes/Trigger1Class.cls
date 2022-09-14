public class Trigger1Class {
    public static void NewMethod(List<Lead> LeadList){
        try{ List<Contact> conList= [Select id,Name, Email From Contact Where Email!=null];
            if(conList.size()>0){
                for(Contact con: conList){
                    for(Lead Le: LeadList){
                        if(Le.Email==con.Email){
                           Le.AddError('Email is Already Exist');
                        } 
                    }
                }
            }
 }catch(Exception e){
            System.debug('Mesaage'+e.getMessage());
            System.debug('Line Number'+e.getLineNumber());
        }
    }
}