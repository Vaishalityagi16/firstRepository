import { api, LightningElement } from 'lwc';
import LoginMethod from '@salesforce/apex/LoginTask.LoginMethod';
import sendEmail from '@salesforce/apex/LoginTask.sendEmail';
import UpdatePassword from '@salesforce/apex/LoginTask.UpdatePassword';

import { NavigationMixin } from 'lightning/navigation';
export default class LogINTask extends NavigationMixin(LightningElement) {
    UserName;
    Password;
    Id;
    Otp;
    Otp0;
    UserName1;
    NewPassword;
    ConfirmNewPassword; 
    @api handleClick4Modal = false;
    LoginModal= true;
    signupmodel = false;
isModalOpen=false
    isModalOpen1 = false
    isModalOpen2 = false
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
    closeModal(){
        this.isModalOpen =false
        this.isModalOpen1 = false
        this.isModalOpen2 = false

    }
    handleclick1(event){
        console.log('Enter1')
        this.UserName = event.target.value;
        
console.log(this.UserName)
    }
    handleclick2(event){
        console.log('Enter2')
        this.Password = event.target.value;
        console.log(this.Password)
    }
    handleClick3(event){
        console.log('Enter3')
         
        LoginMethod({ UserName: this.UserName, Password:this.Password

        }).then(res=>{
            this.Id = res;
            console.log(this.Id)
            console.log('----------->>', res);
            if ( this.UserName===undefined || this.UserName===' '){
                alert('Please enter a userName')
            }
            else if(this.Password=== undefined || this.Password=== ' '){
               alert('Enter a password')
            }
            else if(res == 'User not exist'){
                console.log('test');
                alert('UserName not matched')
            }
            else if(res=='Password did not match'){
      alert('Please enter correct password')
            }
           
            else {
                this.navigateToDetailPage();
              alert('LoggedIn Successfully')
            }
        })
    }
    handleClick4(event){
        if(this.handleClick4Modal==false){
            console.log('hii call signup')
            this.signupmodel = true
            this.LoginModal= false
        }
       
        
    }
    handleClick5(){
        this.isModalOpen = true;
    }
    handleclick6(event){
        console.log('handleclick6')
this.UserName1 = event.target.value;
console.log(this.UserName1);
    }
    handleClick7(event){
        
        if(this.UserName1=== undefined || this.UserName1===''){
            alert('Please enter your UserName..')
        }
        else {
            this.isModalOpen = false
            console.log('------',this.UserName1, typeof this.UserName1)
            this.isModalOpen1 = true;
            sendEmail({UserName:this.UserName1
            }).then(res=>{
            this.Otp0 = res;
    console.log(this.Otp0);
            })
        }
        
    }
    handleClick8(){
        this.isModalOpen = false;
        this.isModalOpen1 = false;
        this.isModalOpen2 = false;
    }
    handleclick9(event){
        console.log('handleclick9 = ', event.target.value)
        this.Otp = event.target.value;
        console.log('handleclick9',this.Otp)

    }
    handleClick10(event){
        console.log('handleclick10',this.Otp)
        if(this.Otp=== undefined || this.Otp===''){
            alert('Please enter Otp..');
        }
        else if(this.Otp==this.Otp0){
            alert('Otp Verified');
            this.isModalOpen1 = false
            console.log('------',this.Otp, typeof this.Otp)
            this.isModalOpen2 = true;
        }
        else {
            alert('Please enter correct otp');
        }
    }
    handleclick11(event){
    this.NewPassword = event.target.value;
    console.log('handleclick11', this.NewPassword);
    }
    handleclick12(event){
     console.log('handleclick12');
    this.ConfirmNewPassword = event.target.value;
     }
     handleClick13(event){
        console.log('handleclick13');
    UpdatePassword({UserName:this.UserName1,Password:this.NewPassword
        }).then(res=>{
            console.log('toUpdatePassword')
            if(this.ConfirmNewPassword != this.NewPassword){
                alert('Password not matched')
            }
            else {
                this.isModalOpen2 = false
                alert(res)
            }
        })
        
     }
     
     handlelogin(event){
        console.log('hii log are here')
        
   
    this.signupmodel=false
     this.LoginModal= true
    }
}