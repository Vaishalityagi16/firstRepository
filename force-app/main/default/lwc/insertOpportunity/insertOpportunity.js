import { LightningElement, track } from 'lwc';
import OppAddMethod from '@salesforce/apex/OppAdd.OppAddMethod';
export default class InsertOpportunity extends LightningElement {
    @track OppName;
    @track StageName;
    @track CloseDate;
insertOpp(event){
    console.log('asjjkcds')
    var field= event.target.name;
    console.log(field)
    if(field=='OppName'){
        this.OppName= event.target.value;
    }
    else if(field=='StageName'){
       this.StageName= event.target.value;
    }
    else if(field=='CloseDate'){
        this.CloseDate= event.target.value;
    }
}

handleClick(){
    console.log(this.OppName)
    console.log(this.StageName)
    console.log(this.CloseDate)
    OppAddMethod({
        OppName: this.OppName,
        StageName: this.StageName,
        CloseDate: this.CloseDate

    }).then(res=>{
       console.log('response', res);
    })

    
}
}