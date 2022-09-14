public class WeatherInfo {
    @AuraEnabled
    public static Wrapper WeatherInfoMethod(String CityName){
        System.debug(CityName);
        String access_key = 'c1d01ff5a821f8cbd101181ba53106a8';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://api.weatherstack.com/current?access_key=c1d01ff5a821f8cbd101181ba53106a8&query='+CityName);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Wrapper wr =  new Wrapper();
        if(response.getStatusCode()==200){
            Map<String,Object> result = (Map<String,Object>) JSOn.deserializeUntyped(response.getBody());
            System.debug(response.getBody());
            Map<String,Object> w = (Map<String, Object>) result.get('current');
            System.debug(w);
            
            Map<String,Object> Location= (Map<String,Object>) result.get('location');
            System.debug(Location);
            wr.temp = String.valueOf(w.get('temperature'));
            system.debug(w.get('temperature'));
            
            wr.humidity = String.valueOf(w.get('humidity'));
            system.debug(w.get('humidity'));
            
            wr.wind_speed = String.valueOf(w.get('wind_speed'));
            system.debug(w.get('wind_speed'));
            wr.country = String.valueOf(Location.get('country'));
            system.debug(Location.get('country'));
            wr.region = String.valueOf(Location.get('region'));
            system.debug(Location.get('region'));
            
            //System.debug(w);
            //for(String s : w.keySet()){
            //   System.debug(s+' -> '+w.get(s));
            //}
        }
        System.debug(wr);
        return wr;
    }
    public class Wrapper{
        @AuraEnabled
        public String temp;
        @AuraEnabled
        public String humidity;
        @AuraEnabled
        public String wind_speed;  
        @AuraEnabled
        public String country;
        @AuraEnabled
        public String region;        
    }
    
}