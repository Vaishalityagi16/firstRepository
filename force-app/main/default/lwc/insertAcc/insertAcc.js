import { LightningElement, track } from 'lwc';
import Lwc1Method from '@salesforce/apex/Lwc1.Lwc1Method';

export default class InsertAcc extends LightningElement {
    @track AccName;
    @track NoOfEmployees;
    @track Rating;
    @track Description;
    @track BillingCity;
    insertAcc(event){
        var field = event.target.name;
        if(field=='AccName'){
            this.AccName= event.target.value;
        }
        else if(field=='NoOfEmployees'){
            this.Description= event.target.value;
        }
        else if(field=='Rating'){
            this.Rating= event.target.value;
        }
        else if(field=='Description'){
            this.Description= event.target.value;
        }
        else if(field=='BillingCity'){
            this.BillingCity = event.target.value;
        }
    }
    handleClick(){
        Lwc1Method ({
            AccName: this.AccName,
            NoOfEmployees: this.NoOfEmployees,
            Rating: this.Rating,
            Description:  this.Description,
            BillingCity: this.BillingCity
        }).then(res=>{
            console.log('response', res);
        })
    }

}