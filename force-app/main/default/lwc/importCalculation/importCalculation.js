import { LightningElement, track } from 'lwc';
import { calculator } from 'c/importExportFunctionality';


export default class ImportCalculation extends LightningElement {
@track input1;
@track input2;
@track operators;
@track result;
modeOptions = [
    { label: "+", value: "+" },
    { label: "-", value: "-" },
    { label: "*", value: "*" },
    { label: "/", value: "/" }
  ];

Input1handleclick(event){
this.input1 = event.target.value;
    }

    input2handleclick(event){
        this.input2= event.target.value;
    }

    handleClick1(event){
        //console.log(this.operators)
        if(event.target.value=='Add'){
            this.operators= '+'

        }
        else if(event.target.value=='Subtract'){
this.operators= '-'
        }
       else if(event.target.value=='Divide'){
this.operators= '/'
       }
       else if(event.target.value=='Multiply'){
this.operators= '*'
       }
        console.log(this.operators,this.input1,this.input2)
        this.result = calculator(this.input1,this.input2,this.operators)
        alert(this.result)
    }

}