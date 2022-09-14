import { LightningElement,track,api,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import recordVersioningMethod from '@salesforce/apex/recordVersioning.recordVersioningMethod';
import recordVersioningMethodData from '@salesforce/apex/recordVersioning.recordVersioningMethodData';

import Account_Object from '@salesforce/schema/Account';

export default class RecordVersioningTask extends NavigationMixin (LightningElement) {
    obapiname = Account_Object;
    showData=false
    HideBtn=true
     @api recordId
     Id
@track acc;

  connectedCallback()  {
    recordVersioningMethodData({accId:this.recordId

    }).then(res=>{
        console.log('connectedCallback', res)
        if(res==false){
            this.HideBtn= false

        }
    })
}


handleClick(event){
        this.showData=true
}

closeModal(){
        this.showData=false
    }

handleSubmit(event){
        event.preventDefault(); 
        // stop the form from submitting
        const fields = event.detail.fields;
        this.acc= fields
        console.log('Objectfields'+ this.acc);
        this.acc.Name = fields.Name;    
        console.log('1 ==>'+ this.acc.Name);


        this.acc.VersionNumber__c= fields.VersionNumber__c+1  
        console.log('2 ==>'+ this.acc.VersionNumber__c );

        this.acc.PreviousVersion__c= this.recordId
        console.log('3 ==>'+ this.acc.PreviousVersion__c);

        this.acc.IsNewest__c= fields.IsNewest__c

        recordVersioningMethod({acc:this.acc}).then(res=>{
            console.log('response',res)
            this.Id=res
            console.log(this.Id)

            this.navigateToDetailPage();
            alert('Account is created '+ this.Id);
       
        })
        
      }

      navigateToDetailPage(){
console.log('======')
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                objectApiName: 'Account',
                recordId:this.Id,
                actionName: 'view',
            },
        });      }
    @wire(getRecord, { recordId:'$recordId', fields })
    account;
}