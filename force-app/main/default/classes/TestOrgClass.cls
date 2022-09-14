@RestResource(urlMapping='/Arecords/*')
global class TestOrgClass {
    @HttpGet
    global static List<sObject> getData(){
        System.debug('abababa');
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        System.debug(request.requestURI);
        String uriId = request.requestURI.subString(request.requestUri.lastIndexOf('/')+1);
        System.debug(uriId);
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(uriId).getDescribe().fields.getMap();
        Set<string> mapset = fieldMap.keyset();
        List<String> listFields = new List<String>();
        String query = 'Select Id ';
        
        for(String field : fieldMap.keySet()){
            Schema.DescribeFieldResult fieldResult = fieldMap.get(field).getDescribe();
            if(fieldResult.isUpdateable() && field != 'ownerid' && !field.endsWith('__c')){
                //System.debug(field);
                query = query + ',' + field;
            }
            System.debug(query);
        }
        query = query+' from '+uriId;
        System.debug(query);
        List<sObject> accList = Database.query(query);
        
        System.debug(accList);
        return accList;
    }
    
    /*@HttpPost
global static String getData1(){
System.debug('aaa');
RestRequest request = RestContext.request;
List<Map<String,Object>> mapList = new List<Map<String,Object>>();

System.debug('params '+request.params);
Map<string ,object> newMap = request.params;
for(String ab: newMap.keySet()){
System.debug('map value are '+ ab);
List<object> accList = (List<object>) json.deserializeUntyped(ab);
System.debug('List '+accList);
for(Object ob : accList){
Map<String,object> newmap1 =(Map<String,object>) ob;
system.debug('asda :'+newmap1);
mapList.add(newmap1);
}
}
List<String> fList = new List<String>{'Name','Phone','Description','NoOfEmployees','Ratings'};
List<sObject> objList = new List<sObject>();
for(Integer i=0; i<mapList.size();i++){
sObject obj = new Account();
Integer f=0;
for(String str: mapList[i].keySet()){
if(fList.contains(str)){
obj.put(str, mapList[i].get(str));
f=1;
}
}
if(f==1){
objList.add(obj); 
}
}
insert objList;
return 'acc1';
}
*/
}