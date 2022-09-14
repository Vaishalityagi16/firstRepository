import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import Account_Object from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNTNAME_FIELD from '@salesforce/schema/Account.AccountNumber';
import NumberOfEmployees_FIELD from '@salesforce/schema/Account.NumberOfEmployees';
export default class RecordEditForm extends LightningElement {
    objectapiname = Account_Object;
    fieldName= NAME_FIELD;
    fieldName1 = ACCOUNTNAME_FIELD;
    fieldName2 = NumberOfEmployees_FIELD;
    Id = "Id will be display";
    handleSuccess(event){
        console.log('enter')
        this.Id = event.detail.id; 
        const events = new ShowToastEvent({
            title:"Successful",
            message:"Account Created",
            variant:'Success'
        });
        this.dispatchEvent(events);
    }
}