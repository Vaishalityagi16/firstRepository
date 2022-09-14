import { LightningElement,track } from 'lwc';
import Lwc3Method from '@salesforce/apex/Lwc3Class.Lwc3Method';
import Lwc3OpMethod from '@salesforce/apex/Lwc3Class.Lwc3OpMethod';
import Lwc3UpMethod from '@salesforce/apex/Lwc3Class.Lwc3UpMethod';

export default class Lwc3 extends LightningElement {
@track name;
@track List= [];
@track Option;
@track d;
@track oppId;

connectedCallback(){
    Lwc3Method({

    }).then(res=>{
        this.name= res;
        for(var a of res){
            console.log(a)
           this.List.push({label: a.Name, value: a.Id}) 
        }
        this.Option= this.List;
    })
}
handleClick(event){
    this.oppId = event.target.value
    Lwc3OpMethod({
        i:event.target.value
    }).then(res=>{
        this.d=res;
    
    })
}
UpdateD(event){
    console.log(event.target.value)
    this.d = event.target.value
    console.log(this.d, typeof this.d)
}
Click(event){
    Lwc3UpMethod({
        r: this.oppId,
        d:this.d
    }).then(res=>{
        alert(res)
    })
}
}