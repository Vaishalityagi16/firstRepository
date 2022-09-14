import { LightningElement, track } from 'lwc';
import Lwc4ObjMethod from '@salesforce/apex/Lwc4Class.Lwc4ObjMethod';
import Lwc4Method from '@salesforce/apex/Lwc4Class.Lwc4Method';
export default class Lwc4 extends LightningElement {
    @track name;
    @track Option;
    @track list=[];
    @track data = [];
    @track Option1;
    @track re;
connectedCallback(){
    Lwc4ObjMethod({})
    .then(res=>{
        this.name=res; 
        for(var a of res){
            console.log(a)
            this.list.push({label: a, value: a});
        }
        console.log(this.list);
        this.Option= this.list;
    })
    .catch(error=>{
        console.log('Error');
    })
}

handleClick(event){
    console.log('Inside handle Click'+event.target.value);
    Lwc4Method({name:event.target.value})
    .then(res=>{
        this.name = res;
        console.log('--------->', res) 
        this.re = Object.values(res);
        for(var b of this.re){
            console.log(b)
            this.data.push({label: b, value: b})
        }
        this.Option1 = this.data;
        console.log('Hii');
    })
}

}