import { LightningElement,track } from 'lwc';
import Lwc4ObjMethod from '@salesforce/apex/Lwc4Class.Lwc4ObjMethod';
import Lwc4Method from '@salesforce/apex/Lwc4Class.Lwc4Method';
import LwcD4Method from '@salesforce/apex/Lwc4Class.LwcD4Method';

export default class Lwc5 extends LightningElement {
    @track Name;
    @track Option;
    @track type1;
    @track list=[];
    @track data = [];
    @track data1
    @track Option1;
    @track Option2;
    @track Option3;
    @track re;
    @track objName;
connectedCallback(){
    Lwc4ObjMethod({})
    .then(res=>{
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
    this.objName = event.target.value
    Lwc4Method({name:event.target.value})
    .then(res=>{
        this.Name = res;
        console.log('--------->', res) 
        this.re = Object.values(res);
        for(var b of this.re){
            console.log(b)
            this.data.push({label: b, value: b})
        }
        this.Option1 = this.data;
        console.log('res13456',res)
        console.log('Hii');
    })
    .catch(error=>{
        console.log('Error1');
    })
    
}
handleClick1(event){
    console.log(event.target.value)
    
    for(var r in this.Name){
        console.log('------> ',r)
        if(event.target.value == this.Name[r]){
            this.Option2 = r
        }
    }
    console.log('**********8')
    LwcD4Method({name:this.objName,ApiName:this.Option2})
    .then(res=>{
        console.log('res1',res)
        this.Option3 = res;  
    })
   
   
}

}