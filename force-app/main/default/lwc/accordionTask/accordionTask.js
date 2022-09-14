import { LightningElement,track } from 'lwc';
import AccordionTaskMethod from '@salesforce/apex/AccordionTask.AccordionTaskMethod'
import getContacts from '@salesforce/apex/AccordionTask.getContacts'
import getOpportunities from '@salesforce/apex/AccordionTask.getOpportunities'
import getFavourite from '@salesforce/apex/AccordionTask.getFavourite'
import getTestData from '@salesforce/apex/AccordionTask.getTestData'

const columns = [
    { label: 'id', fieldName:"Id"},
    {label:'Name', fieldName :"Name" }
];
export default class AccordionTask extends LightningElement {
    @track data;
    @track opp;
    @track con;
    @track fav;
    @track testData;
    @track columns=columns;
    customData=false;
    standardData=true
    @track activeSections = ['AccountData','ContactsData','OpportunityData'];
connectedCallback(){
    this.activeSections = [];
    AccordionTaskMethod({

    }).then(res=>{
        console.log(res)
this.data = res
console.log('Account',this.data);
    })

    getContacts({

    }).then(res=>{
        console.log('contacts',res);
this.con = res;
console.log('Contacts',this.con)
    })

    getOpportunities({

    }).then(res=>{
        console.log('Opportunities',res)
        this.opp = res;
        console.log('opportunities',this.opp);
    })
    getFavourite({

    }).then(res=>{
        console.log('Favourites',res);
this.fav = res
console.log(this.fav)
    })

    getTestData({

    }).then(res=>{
        console.log('testData',res)
        this.testData = res
    })
}
handleClick1(event){
    this.customData=true
    this.standardData= false
}
handleClick2(event){
    this.customData=false
    this.standardData=true
}

}