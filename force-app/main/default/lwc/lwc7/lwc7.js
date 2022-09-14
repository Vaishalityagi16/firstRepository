import { LightningElement,track, wire } from 'lwc';
import Lwc7ClassMethod from '@salesforce/apex/Lwc7Class.Lwc7ClassMethod';

export default class Lwc7 extends LightningElement {
    @track accList;
    @track error;
    @track sortBy;
    @track sortDirection;
    @track columns = [{
        label: 'Account name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
    },
    
    {
        label: 'Number Of Employees',
        fieldName: 'NumberOfEmployees',
        type: 'Number',
        sortable: true
    },
    {
        label: 'Annual Revenue',
        fieldName: 'AnnualRevenue',
        type: 'Currency',
        sortable: true
    },
    {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
        sortable: true
    },
    {
        label: 'Website',
        fieldName: 'Website',
        type: 'url',
        sortable: true
    },
    {
        label: 'Rating',
        fieldName: 'Rating',
        type: 'Picklist',
        sortable: true
    },

];
@wire(Lwc7ClassMethod)
   wiredAccount({error,data}){
        if(data){
            console.log('Data',data)
            this.accList=data;
            console.log('----------> ',this.accList)

        }
        else if(error){
            console.log('error',error)
            this.error= error;
        }
    }
    doSorting(event){
        console.log('inside fun')
        console.log('----------',this.accList)
        this.sortBy= event.detail.fieldName;
        this.sortDirection= event.detail.sortDirection;
        this.sortData(this.sortBy,this.sortDirection);
    }
    sortData(fieldName,direction){
        console.log(this.accList)
        let parseData = JSON.parse(JSON.stringify(this.accList));
        console.log(parseData)
        let value = (obj)=>{
        return obj[fieldName];
        }
        let dir = (direction=='asc'?1:-1)
        parseData.sort((x,y) => {
            if(value(x)){
                x= value(x);
            }
            else{
                x= ''
            }
            if(value(y)){
                y = value(y)
            }
            else{
                y= ''
            }
            let comp = 0;
            if(x>y){
               comp= 1;
            }
            else{
                comp= -1;
            }
            return (dir*comp)
        })
        this.accList= parseData
    }
   
}