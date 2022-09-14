import { LightningElement,api,track } from 'lwc';

export default class TaskChild extends LightningElement {
  @track list=[];
   @track text;
   @track DisplayText;
    @api
    childComp(value){
        console.log('enter');
        console.log('**********',value)
        let d = JSON.parse(JSON.stringify(this.list))
        d.push({label:value,value:value})
        this.list= d
        console.log('!!!!!!!!!--',this.list)
    }
    OnClick(event){
        console.log('enter2')
this.text = event.target.value
console.log(this.text)
let eve = new CustomEvent('taskchild', {detail : this.text}
                                );
    this.dispatchEvent(eve)
    }
    @api
    childComponent(name){
        console.log('enter3')
        this.DisplayText= name
    }
}