import { LightningElement,track } from 'lwc';

export default class ForParent extends LightningElement {
    message = 'tO********************';
    handleClick(){
       this.message = 'new message';
       this.template.querySelector('c-for-Child').ChildComp(this.message)
    }
    handleEvent(event){
      let key = event.detail.key;
      console.log(key)
      let value = event.detail.value;
console.log(value)
      this.message = key+ ' '+ value;
      window.console.log('aaaaaaaaaaathuuuuuuuuu',this.message)
    }
}