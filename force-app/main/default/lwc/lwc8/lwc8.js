import { LightningElement,track } from 'lwc';
import Lwc8ClassMethod from '@salesforce/apex/Lwc8Class.Lwc8ClassMethod';
import getContacts from '@salesforce/apex/Lwc8Class.getContacts';

export default class Lwc8 extends LightningElement {
@track Option;
@track list= [];
@track lastName
@track Option1
@track accId;
connectedCallback(){
Lwc8ClassMethod({

}).then(res=>{
    for(var a of res){
this.list.push({label:a.Name, value: a.Id})
    }
    console.log(this.list)
    this.Option = this.list;
})
}
handleClick(event){
    this.accId= event.target.value
    console.log(event.target.value)
    }
handleClick2(event){
    getContacts({AccId:this.accId, lastName : this.lastName})
    .then(res=>{
        console.log(res);
        })

}

handleClick1(event){
    this.lastName = event.target.value
}

}