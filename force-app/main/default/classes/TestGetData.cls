public class TestGetData {
    /*public static void getDataMethod(List<Account> objList){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        request.setMethod('POST');
        String Client_Id = '3MVG9pRzvMkjMb6ksGPamegI7F_ii9PtFgWns9yMHevG9PYUOSUXsU74nCU48CgqtDE0CfXK5FHiirdaIM0zX';
        String Client_Secret = 'F643B5B4FEDE2775C5CAB7AA36CD9AC9D240B434B3C75797ECF85757CD576542';
        String UserName = 'sagar.agarwal@cloudanalogy.com';
        String Password = '--(S@gar19)fKzrs6KlUBOfAwJJl0LCE4y2';
        request.setBody('grant_type=password&username='+UserName+'&password='+Password+'&client_id='+Client_Id+'&client_secret='+Client_Secret);
        HttpResponse response = http.send(request); 
        System.debug(response);
        if(response.getStatusCode()==200){
            System.debug(response.getBody());
            Map<String,Object> res = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            Http http1 =  new Http();
            HttpRequest req =  new HttpRequest();
            req.setEndpoint('https://cloudanalogycom301-dev-ed.my.salesforce.com/services/apexrest/AccountRecords?id=1234');
            req.setHeader('Authorization', 'Bearer '+res.get('access_token'));
            req.setHeader('Content-Type', 'application/json');
            //req.setHeader('Content-Length', '<calculated when request is sent>');
            //req.setMethod('GET');
            req.setMethod('POST');
            System.debug(objList);
            System.debug(JSON.serialize(objList));
            req.setBodyAsBlob(Blob.valueOf(JSON.serialize(objList)));
            //req.setBody(JSON.serialize(objList));
            HttpResponse res1 = http1.send(req);
            System.debug(res1);
            
        }
    }
*/
}