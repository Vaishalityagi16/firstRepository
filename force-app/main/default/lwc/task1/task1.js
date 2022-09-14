import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

import Task1ClassMethod from '@salesforce/apex/Task1Class.Task1ClassMethod';
import deleterecords from '@salesforce/apex/Task1Class.deleterecords';

const action = [
{label: 'Edit', name:'Edit'},
{label:'Delete', name: 'Delete'}
];

const columns = [{
    label: 'Account name',
    fieldName: 'Name',
    type: 'text',
    sortable: true
    },
    {
    label: 'Account Number',
    fieldName: 'AccountNumber',
    type: 'text',
    sortable: true
    },
    {
    label: 'Account Site',
    fieldName: 'Site',
    type: 'Text',
    sortable: true
    },
    {
    label: 'Account Id',
    fieldName: 'Id',
    type: 'text',
    sortable: true
    },
    { type: 'action',
    typeAttributes:{
        rowActions: action,
            menuAlignment: 'right'
    }

    }
    
    ];
    
export default class Task1 extends NavigationMixin (LightningElement) {
// @track todoD=[]
@track Option;
@track columns = columns;
@track searchKey;
@track acc;
@track data;
@track ButtonN = 'LockSearch'
@track Button = 'Delete'
deleteAcc= []
isPossible=true
connectedCallback(){
Task1ClassMethod()
.then(res=>{
    console.log(res)
        this.acc = JSON.parse(JSON.stringify(res)) 
})
}

handleClick1(event){
this.searchKey = event.target.value;
console.log(this.searchKey, this.searchKey.length);
if(this.searchKey.length>=3){
console.log('aaaaa************')
this.doSearch(this.searchKey)
}
else if(this.searchKey.length<3){
console.log('Should be 3 Alphabets')
this.data=[]
} 
}
doSearch(text){
// let fieldName;
if(this.isPossible == true){
    const temp = JSON.parse(JSON.stringify(this.acc))
    let d = []
    console.log(temp)
    for(let obj of temp){
    console.log('------', obj)
    for(let fieldName in obj){
        if(obj[fieldName].includes(text)){
            d.push(obj)
            break;
        }
    }

    }
     this.data= d
}


}
handleClick2(event){
    console.log('*******')
if(this.ButtonN=='LockSearch'){
// this.data
this.ButtonN = 'UnlockSearch'
this.isPossible = false
} else if(this.ButtonN=='UnlockSearch'){
    this.ButtonN= 'LockSearch'
    console.log('will not search')
    this.isPossible = true
}
}
navigateToRecordPage(row) {
    console.log('inside navigation',row, typeof row.Id)
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            objectApiName: 'Account',
            actionName: 'edit',
            recordId:row.Id
        },


    });
} 
getSelectedRecords(event){
    let selectedrows = JSON.parse(JSON.stringify(event.detail)).selectedRows
    console.log(JSON.parse(JSON.stringify(event.detail)))
    console.log(typeof selectedrows, selectedrows)
     this.deleteAcc = []
     this.deleteAcc.push(selectedrows)
    this.deleteAcc = selectedrows
}
handleClick4(event){
    console.log(this.deleteAcc)
    console.log('++++',typeof this.deleteAcc, this.deleteAcc)
    let temp = JSON.parse(JSON.stringify(this.data))
    let index;
    // for(let i=0; i<temp.length;i++){
    //     if(row.Id===todoD[i].Id){
    //         index = i
    //     }
    // }
    // console.log('@@@@@@@@@')
    // todoD.splice(index,1);

    for(let i=0;i<temp.length;i++){
        for(let j=0; j<this.deleteAcc.length;j++){
            console.log('@@@@@@@', this.deleteAcc[j])
            if(temp[i].Id === this.deleteAcc[j].Id){
                console.log('----> ', this.deleteAcc[j])
                temp.splice(i,1);
                i--;
                break;
            }
        }
    }
    this.data = temp
  
    deleterecords({
        accList:this.deleteAcc

    }) 

    
    .then(res=>{
          console.log('Deleted',res)

    })

}
handleRowAction(event){

    let actionName = event.detail.action
    console.log(actionName.name)
let row = JSON.parse(JSON.stringify(event.detail.row))
    if(actionName.name=='Edit'){
        console.log('inside row action')
        this.navigateToRecordPage(row)
    }
    else if(actionName.name=='Delete'){
        console.log('########',actionName.name)
        console.log('done')
// let obj = event.target.name
//    let todoD = this.deleteAcc
let todoD = JSON.parse(JSON.stringify(this.data))
   let index;
   for(let i=0; i<todoD.length;i++){
       if(row.Id===todoD[i].Id){
           index = i
       }
   }
   console.log('@@@@@@@@@')
   todoD.splice(index,1);
   this.data = todoD
        console.log(typeof row, row)
        deleterecords({accList:[row]})
        .then(res=>{
            console.log(res)
        })
    }
    }
}