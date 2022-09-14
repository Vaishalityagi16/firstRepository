import { LightningElement, track } from 'lwc';
import Lwc6ClassMethod from '@salesforce/apex/Lwc6Class.Lwc6ClassMethod';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Lwc6 extends LightningElement {
@track Option;
@track UserName;
@track Password;
@track ShowToastEvent;

    handleClick2(event){
        var inp = this.template.querySelectorAll("lightning-input");
        console.log('value is here')
        inp.forEach(function(element) {
            console.log('value in inside the lopp')
            if(element.name=='UserName'){
                
                 this.UserName= element.value;


            }else if(element.name=='Password'){
                this.Password=element.value;
                console.log('password ==>',this.Password)

            }
        },this);  
        Lwc6ClassMethod({UserName: this.UserName, Password: this.Password})
        .then(res=>{
            if(res=='Sucessfully logedin'){
                this.showSuccessToast();
            }
            else{
                this.showErrorToast();

            }
    })
}
showErrorToast() {
    const  evt = new ShowToastEvent({
        title: 'Toast Error',
        message: 'Some unexpected error',
        variant: 'error',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}
showSuccessToast() {
    const evt = new ShowToastEvent({
        title: 'Toast Success',
        message: 'Opearion sucessful',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}
}