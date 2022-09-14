import { LightningElement } from 'lwc';
import showErrorToast from '@salesforce/label/c.showErrorToast';
import showInfoToast from '@salesforce/label/c.showInfoToast';
import showSuccessToast from '@salesforce/label/c.showSuccessToast';
import showWarningToast from '@salesforce/label/c.showWarningToast';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CallParent extends LightningElement {
label = {showErrorToast,
    showInfoToast,
    showSuccessToast,
    showWarningToast};

    constructor(){
        super();
        console.log("constructor-parent =="+this.label.toastCustomLabel);
    }

    connectedCallback() {
        console.log('ConnectedCallback-parent');
    }

    renderedCallback(){
        console.log("renderCallback-Parent")
    }

    errorCallback(error, stack) {

        alert("Parent"+ error);
        console.log('errorcallback – child' + error );     
        console.log(stack); 
        
    }
    show = true;
    handleShowHide() {
       
        this.show = !this.show;
        //this.showToast();

    }

    showErrorToast() {
        //message1 = this.label.toastCustomLabel;
        console.log('testCustomLAble');
        const evt = new ShowToastEvent({
            title: 'Toast Error',
            message: this.label.showErrorToast,
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
}

showSuccessToast(){
    const evt = new ShowToastEvent({
        title: 'Toast Success',
        message: this.label.showSuccessToast,
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}

showWarningToast() {
    const evt = new ShowToastEvent({
        title: 'Toast Warning',
        message: this.label.showWarningToast,
        variant: 'warning',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}

showInfoToast() {
    const evt = new ShowToastEvent({
        title: 'Toast Info',
        message: this.label.showInfoToast,
        variant: 'info',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}

}