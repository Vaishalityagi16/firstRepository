import { LightningElement, track, wire } from 'lwc';
import PaginationClassMethod from '@salesforce/apex/PaginationClass.PaginationClassMethod'
import TickerSymbol from '@salesforce/schema/Account.TickerSymbol';

const columns = [
    { label: 'Account Name', fieldName:"Name"},
    {label:'Active', fieldName :"Active__c" }
];
export default class PaginationTask extends LightningElement {
    @track columns = columns;
    @track data =[];
    @track data1=[];
    @track items = [];
    temp=0;
    pageNumber=1;
    pageSize=5;
    count=0;
    @track start=0;
    @track end= this.pageSize-1;

    connectedCallback(){
        PaginationClassMethod({

        }).then(res=>{
            this.items= res;
            let temp = res;
            console.log('result',temp)
            //console.log('length',temp.length)
            //console.log(typeof temp)
            let tempData = [];
            if(temp.length > this.pageSize){
                console.log('if condition......>')
                console.log('Start',this.start)
                console.log('end',this.end)
                for(let i=this.start; i<this.pageSize; i++){
                    console.log(temp[i])
                     tempData.push(temp[i])
                      console.log('new data',tempData)
                      this.count++;
                }
              }else{
                for(let i=0; i<temp.length;i++ ){
                    tempData.push(this.items[i]);
                      this.count++;
                }
              }
              this.data =tempData
              console.log('just checking',this.data);
              this.start =0;
              console.log('---->',this.start);
              this.end =this.count;
              console.log('......', this.end);
        })
        
        
    }
    handleNextPage(event){
        console.log('forNextPage',this.start);
        console.log('forNextPage',this.end);
        console.log('for next page',this.data.length);
        console.log('for next page',this.items.length);
        let temData1=[];
this.count=0;
    if(this.items.length>this.end){
        console.log('2nd if condition')
        console.log('forNextPage',this.start);
        console.log('forNextPage',this.end);
        for(let i=this.start+5; i<this.end+5; i++){
            temData1.push(this.items[i])
            console.log('>>>>',temData1)
            this.count++;
        }
    }else{
       for(let i=this.start; i<this.items.length;i++){
            temData1.push(this.items[i]);
            console.log('???????',temData1)
                   this.count++;
                   
       } 
    }
    this.data= temData1
    
    console.log('////',this.data)

    this.start+=this.count;
    this.end+=this.count;
    console.log('CurrentPageInNextPage',this.start)
    //console.log('for next page',this.data.length);
    console.log('for next page',this.end);
    //this.pageNumber = this.pageNumber+1;
    } 
    handlePrevPage(event){
        let temData1=[];
         this.count=0;
        if(this.items.length>this.end){
            console.log('2nd if condition')
            console.log('forPrevPage',this.start);
            console.log('forPrevPage',this.end);
            for(let i=this.start-5; i<this.end-5; i++){
                temData1.push(this.items[i])
                console.log('>>>>',temData1)
                this.count++;
            }
        }else{
           for(let i=this.start; i<this.items.length;i++){
                temData1.push(this.items[i]);
                console.log('???????',temData1)
                       this.count++;
                       
           } 
        }
        this.data= temData1
        console.log('////',this.data)
    
        this.start-=this.count;
        this.end-=this.count;
        console.log('forPrevPage',this.start);
            console.log('forPrevPage',this.end);
    }
 
}