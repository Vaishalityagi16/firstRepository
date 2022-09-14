import { LightningElement,api,track } from 'lwc';

export default class ForChild extends LightningElement {
    @api message;

    @api
    ChildComp(name){
        alert(name)
        this.message = name;
    }
    handleClick(){
        const event  = new CustomEvent(('buttonclick'),{
            detail:{
                key : 'key00',
                value: 'Value01'
            }
        });
        this.dispatchEvent(event);
    }
}