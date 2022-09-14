import { api, LightningElement, track } from 'lwc';
import page1 from './template1.html'
import page2 from './template2.html';

export default class LifeCycleHooksParentCom extends LightningElement {
 list=[];
 @api page = 'template1';

constructor() {
    super();
    console.log('In Constructor');
}

connectedCallback() {
    this.list.push('Hello LWC');
    console.log('ConnectedCallback');
    console.log(this.list);
}

disconnectedCallback() {
    this.list=[]
    console.log('disconnectedCallback');
}
changeTemp() {
    if(this.page=='template1')
        this.page='template2';
    else this.page='template1';
}
render() {
    console.log("In render")
    if(this.page=='template1'){
        console.log(this.page1)
        return page1;
    }
    
    else return page2;
  }
  renderedCallback(){
    console.log("renderedCallback");
    if(this.page =='template2')
    {
        console.log(this.page);
        var btn=this.template.querySelectorAll("lightning-button");
        btn.forEach(function(element){
            console.log(btn.name);
          if(element.name=='btn2')
          {
              element.variant="success";
          }
        },this);
    }
}
}