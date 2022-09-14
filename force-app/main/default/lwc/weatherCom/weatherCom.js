import { LightningElement,track } from 'lwc';
import WeatherInfoMethod from '@salesforce/apex/WeatherInfo.WeatherInfoMethod';
const columns = [{
    label: 'country',
    fieldName: 'country',
    type: 'text',
    sortable: true
    },
    {
    label: 'region',
    fieldName: 'region',
    type: 'text',
    sortable: true
    },
    {
    label: 'temp',
    fieldName: 'temp',
    sortable: true
    },
    {
    label: 'humidity',
    fieldName: 'humidity',
    type: 'text',
    sortable: true
    },
    {
        label: 'wind_speed',
        fieldName: 'wind_speed',
        type: 'text',
        sortable: true
        },
    
    ];
export default class WeatherCom extends LightningElement {
    @track columns = columns;
    @track data
    CityName = '';
    handleClick1(event){
        console.log('aaaaaaa', event.target.value)
        this.CityName = event.target.value
    }
    handleClick2(event){
        WeatherInfoMethod({CityName:this.CityName})
        .then(res=>{
            let temp = []
            console.log(typeof res, res)
        temp.push(res);
     this.data = temp
        })
    }

}