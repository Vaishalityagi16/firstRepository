import { LightningElement,track } from 'lwc';

export default class ParentLwc extends LightningElement {
    countValue=0;
   

    handleDecrement(){
        this.countValue--;
    }

    handleIncrement(){
        this.countValue++;
    }
    errorCallback(error,stack){
 throw error;    
}
}