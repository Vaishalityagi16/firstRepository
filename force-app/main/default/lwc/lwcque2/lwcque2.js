import { LightningElement, track } from 'lwc';
import Lwc2Method from '@salesforce/apex/Lwc2.Lwc2Method';
import Lwc2OppMethod from '@salesforce/apex/Lwc2.Lwc2OppMethod';
import Lwc2ConMethod from '@salesforce/apex/Lwc2.Lwc2ConMethod';

export default class Lwcque2 extends LightningElement {
    @track name;
    @track List= [];
    @track Option;
    @track AccountOpp;
    @track AccountCon;
    connectedCallback(){
        Lwc2Method({

        }).then(res=>{
            this.name= res;
            for(var a of res){
                console.log(a);
                this.List.push({label: a.Name , value:a.Id})
            }
            this.Option= this.List;
        })
    }
    handleClick(event){
        Lwc2OppMethod({
            i: event.target.value
        }).then(res=>{
            console.log(res)
            this.name= res;
            let data= []
            for(var b of res){
                console.log('***********************n',b);
               data.push({label:b.Name, value: b.Id})
            }
            this.AccountOpp= data;
        })

        Lwc2ConMethod({
            r:event.target.value
        }).then(res=>{
            this.name= res;
            let Con = []
            for(var c of res){
                console.log('---------',c);
                Con.push({label: c.Name, value: c.Id})
            }
            this.AccountCon= Con;
        })
    }
}