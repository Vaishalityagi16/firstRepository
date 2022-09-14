import {api,LightningElement} from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNTNAME_FIELD from '@salesforce/schema/Account.AccountNumber';
import NumberOfEmployees_FIELD from '@salesforce/schema/Account.NumberOfEmployees';

export default class RecordViewForm extends LightningElement {
    fieldName = NAME_FIELD;
    fieldName1 = ACCOUNTNAME_FIELD;
    fieldName2 = NumberOfEmployees_FIELD;

    Obapiname = ACCOUNT_OBJECT;
    @api recordId = "0015j00000bRShwAAG";
}