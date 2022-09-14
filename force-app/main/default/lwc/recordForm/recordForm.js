import { LightningElement, track } from 'lwc';
import Account_Object from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNTNAME_FIELD from '@salesforce/schema/Account.AccountNumber';
import NumberOfEmployees_FIELD from '@salesforce/schema/Account.NumberOfEmployees';
export default class RecordForm extends LightningElement {
    obapiname = Account_Object;
    recordId = "0015j00000jx7xhAAA";
    @track fields = [NAME_FIELD,ACCOUNTNAME_FIELD,NumberOfEmployees_FIELD];
   
    // mode:edit(can edit the record)
    //mode:view(also can edit the record)
    //mode:readonly(only can see the record can not edit)
    // mode: default(can create the record..used to create a record only)
}