public class Lwc4Class {
    @auraenabled
    public static List<String> Lwc4ObjMethod(){
        List<String> sObjectList = new List<String>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            //Schema.DescribeSObjectResult describeSObjectResultObj = objTyp.getDescribe();
            sObjectList.add(objTyp.getdescribe().getName());
        }System.debug(sObjectList);
        sObjectList.sort();
        return sObjectList;
        
    }
    @auraenabled
    public static Map<String,String> Lwc4Method(String name){
        System.debug('name :'+name);
        Map<String,String> fName= new Map<String,String>(); 
        Map<String,Schema.SObjectType> obj = Schema.getGlobalDescribe();
        Map <String, Schema.SObjectField> fieldMap = obj.get(name).getDescribe().fields.getMap();
        for(Schema.SObjectField d : fieldMap.values()){
            Schema.Describefieldresult ds = d.getDescribe();
            
            fName.put(ds.getname(),ds.getlabel());
            
        }
        System.debug(fName); 
        return fName;
    }
    @auraenabled
    public static String LwcD4Method(String name, String ApiName){
        System.debug(name+'    '+ApiName);
        Map<String,String> fName= new Map<String,String>(); 
        String r;
        Map<String,Schema.SObjectType> obj = Schema.getGlobalDescribe();
        Map <String, Schema.SObjectField> fieldMap = obj.get(name).getDescribe().fields.getMap();
        for(Schema.SObjectField fieldName: fieldMap.values()){
            
            Schema.describefieldresult fielddataType = fieldName.getDescribe();
            if(String.ValueOf(fielddataType.getname())==ApiName){
                r = String.valueOf(fielddataType.getType());
            }
        }
        System.debug(r);
        return r;
    }
    
}