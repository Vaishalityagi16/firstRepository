import { api, LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
const FIELDS = ['Account.Id'];

export default class ContactRecordForm extends LightningElement {
    @api recordId;
    
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    Account;
     handleSuccess(event){
            alert('Contact is created '+ event.detail.id);
          }
          handleSubmit(event){
            console.log('Id--->'+this.Account.data.fields.Id.value);
            event.preventDefault();       // stop the form from submitting
   const fields = event.detail.fields;
   fields.AccountId = this.Account.data.fields.Id.value;

   this.template.querySelector('lightning-record-edit-form').submit(fields);
          }
    handleError(event) {
        console.log("handleError event");
        alert(JSON.stringify(event.detail));
    }



}