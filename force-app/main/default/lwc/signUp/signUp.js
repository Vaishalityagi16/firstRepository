import {LightningElement, track} from 'lwc';
import insertRecord from '@salesforce/apex/LoginTask.insertRecord';
import { NavigationMixin } from 'lightning/navigation';

export default class SignUp extends NavigationMixin(LightningElement){
    isModalOpen= false;
    handleClick4Modal = false; 
    isModalOpen1 = true;
    isModalOpen2 = false;
    Id;
    navigateToDetailPage() {
        // Navigate to the Account home page
        console.log('======')
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                objectApiName: 'UserInformation__c',
                recordId:this.Id,
                actionName: 'view',
            },
        });
    }

@track ob = {Name:null,FirstName__c:null,MiddleName__c:null,LastName__c:null,DOB__c:null,Father_Name__c:null,Phone__c:null,HouseNumber__c:null,CityName__c:null,
    Country__c:null,State__c:null,UserName__c:null,Password__c:null,Email__c:null};
    handleCilck1(event){
        this.ob.FirstName__c = event.target.value;
        console.log(this.ob.FirstName__c)
        console.log(this.ob.Name)
        
    }
    handleClick2(event){
        this.ob.MiddleName__c = event.target.value
        console.log(this.ob.MiddleName__c)
    }
    handleClick3(event){
        this.ob.LastName__c= event.target.value
        console.log( this.ob.LastName__c)
    }
    handleClick4(event){
        this.ob.DOB__c = event.target.value
        console.log( this.ob.DOB__c)
    }
    handleClick7(event){
        this.ob.Father_Name__c = event.target.value
        console.log( this.ob.Father_Name__c)
    }
    handleClick8(event){
        this.ob.Phone__c = event.target.value
        console.log( this.ob.Phone__c)
    }
    handleClick9(event){
        this.ob.HouseNumber__c= event.target.value
        console.log( this.ob.HouseNumber__c)
    }
    handleClick10(event){
        this.ob.CityName__c = event.target.value
        console.log(this.ob.CityName__c)
    }
    handleClick11(event){
        this.ob.Country__c = event.target.value
        console.log(this.ob.Country__c)
    }
    handleClick12(event){
        this.ob.State__c = event.target.value
        console.log(this.ob.State__c)
    }

    handleClick6(event){
        // console.log('======>',isValid)
        if(this.isInputValid()){
            this.isModalOpen1= false
            this.isModalOpen= true
        }
        else{
            alert('Enter values in fields')
        }

    }
    closeModal(){
        this.isModalOpen = false
        this.isModalOpen2=false
        this.isModalOpen1= false
    }
    
    handleClick13(event){
       
        if(this.isModalOpen1===true){
            this.isModalOpen1 = false
            this.isModalOpen= true

        }
        else if(this.isModalOpen1===false){
            this.isModalOpen = false;
            this.isModalOpen1 = true;
        }
    }
    handleClick14(event){
        if(this.isInputValid()){
            this.isModalOpen1= false
            this.isModalOpen2= true
        }
        else{
            alert('Enter values in fields')
        }
    }
    handleClick15(event){
        this.ob.UserName__c= event.target.value
        console.log(this.ob.UserName__c)
    }
    handleClic16(event){
        this.ob.Password__c = event.target.value
        console.log(this.ob.Password__c)
    }
    handleClick17(event){
        this.ob.Email__c= event.target.value
        console.log(this.ob.Email__c)
    }

    handleClick18(event){
        this.isModalOpen2= false;
        this.isModalOpen= true
    }
    OnhandleClick5(event){
        
        const eve = new CustomEvent('call', {detail : true}
        );
this.dispatchEvent(eve)
console.log('event',eve)
    }
    
    isInputValid(){
        let isValid = true;
        
         let inputFields = this.template.querySelectorAll('.validate');
         inputFields.forEach(inputField =>{
            if(!inputField.checkValidity()) {
                console.log('**');
                inputField.reportValidity();
                isValid = false;
                console.log(isValid)

            }
         });
         console.log('isValid1 :',isValid)
         return isValid;
    }
    handleClick19(event){
        //this.isModalOpen1 = false
        
        console.log('value ',this.isInputValid())
       if(this.isInputValid()===false){
        console.log('value if ',this.isInputValid())
        alert('Enter valid values..')}
else if(this.isInputValid()===true){
    console.log('value else if',this.isInputValid())
    insertRecord({UserInformation:this.ob

        }).then(res=> {
            console.log(res)
            this.Id = res
            this.navigateToDetailPage();
           alert('User register successfully')
        })
    }
}
    handleCilck20(event){
        this.ob.Name= event.target.value
            console.log(this.ob.Name)
        }
        
    }