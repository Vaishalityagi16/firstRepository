import { LightningElement,wire,track } from 'lwc';
import WireDemoMethod9 from '@salesforce/apex/WireDemo.WireDemoMethod9'
const columns = [
    { label: 'Name',fieldName:"Name"},
    {label:'Id', fieldName :"Id" }
];
export default class WireDemo extends LightningElement {
    @track columns=columns 
    @track data =[]
    @wire(WireDemoMethod9)
    wiredObj({data,error}){
        if(data){
this.data = data;
        }
        else if(error){
         console.log('Error occured');
        }
    }
    
}