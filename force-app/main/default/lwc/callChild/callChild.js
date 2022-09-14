import { LightningElement } from 'lwc';

export default class CallChild extends LightningElement {

    constructor(){
        super();
        console.log("constructor-Child");
    }

    connectedCallback() {
        console.log('ConnectedCallback-Child');
    }

    renderedCallback(){
        console.log("renderCallback-Child")
    }
disconnectedCallback(){
    console.log("disConnectedCallBack-Child")
}
    errorCallback(error, stack) {

        alert("Child", error);
    }


}