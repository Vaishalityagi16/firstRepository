import { LightningElement,api,track } from 'lwc';

export default class TaskParent extends LightningElement {
    @track list;
     @track text;
     data;
     @track displayText;
     OnClick(event){
        console.log('first');
this.text = event.target.value
this.template.querySelector('c-task-Child').childComponent(this.text)
console.log(this.text)
     }
    handleClick1(event){
        console.log('two')
this.list = this.text
console.log('--> ',this.list)
this.template.querySelector('c-task-Child').childComp(this.list)
this.text= '';
    }

    handleText(event){
        this.displayText = event.detail;
    }
}